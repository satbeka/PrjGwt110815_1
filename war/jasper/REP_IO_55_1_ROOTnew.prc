CREATE OR REPLACE PROCEDURE "REP_IO_55_1_ROOT" (P_ID        NUMBER,
                                               P_USER_NAME VARCHAR2,
                                               p_result    OUT SYS_REFCURSOR) IS
  v_row         d_p4_orderinfo%ROWTYPE;
  v_date        DATE;
  v_order_type  NUMBER;
  v_nin         VARCHAR2(36);
  v_on_date     DATE;
  v_asset       NUMBER;
  v_claim_asset NUMBER;
  v_claim_nin   VARCHAR2(36);
  v_as_type     VARCHAR2(16);

  v_client NUMBER;
BEGIN

  SELECT *
    INTO v_row
    FROM d_p4_orderinfo
   WHERE id = p_id;

  SELECT CASE
           WHEN v_row.is_moment = 1 THEN
            CASE
              WHEN v_row.cd_reference IS NOT NULL THEN
               (SELECT n.date_
                  FROM fa_shareholders_nom_hold n
                 WHERE n.refer_ = v_row.cd_reference)
              ELSE
               nvl(v_row.user_exec_date, SYSDATE)
            END
           ELSE
            v_row.onedate
         END,
         
         CASE
           WHEN v_row.order_type > 500 THEN
            v_row.order_type - 500
           ELSE
            v_row.order_type
         END
    INTO v_on_date,
         v_order_type
    FROM dual;

  report.v_is_cd := 0;
  report.g_refer := v_row.cd_reference;

  BEGIN
    v_nin := report.GetNINOnDate(p_nin  => v_row.p4_nsin,
                                 p_date => v_on_date);
  EXCEPTION
    WHEN OTHERS THEN
      raise_application_error(-20000,
                              'НЕ УКАЗАН НИН.' || chr(10) || chr(13) ||
                              dbms_utility.format_error_stack ||
                              dbms_utility.format_error_backtrace);
  END;

  v_date := report.GetDateNin(v_nin, v_on_date);

  SELECT b.b1_id,
         b.b1_linked_asset_id,
         b.b1_as_type,
         b.b1_client
    INTO v_asset,
         v_claim_asset,
         v_as_type,
         v_client
    FROM d_b1_assets_h b
   WHERE b.b1_id = v_row.asset
     AND b.date_modified <= v_date
     AND b.date_end > v_date
     AND b.status_hist IN (1, 2);

  IF v_as_type = '06'
  THEN
  
    IF v_claim_asset IS NULL
    THEN
      SELECT b.b1_id,
             b.b1_linked_asset_id,
             b.b1_as_type,
             b.b1_client
        INTO v_asset,
             v_claim_asset,
             v_as_type,
             v_client
        FROM d_b1_assets b
       WHERE b.b1_id = v_row.asset;
    END IF;
  
    v_asset       := v_claim_asset;
    v_claim_asset := v_row.asset;
    SELECT b1_nin
      INTO v_nin
      FROM d_b1_assets
     WHERE b1_id = v_asset;
  END IF;

  IF v_claim_asset IS NOT NULL
  THEN
    SELECT b1_nin
      INTO v_claim_nin
      FROM d_b1_assets
     WHERE b1_id = v_claim_asset;
  END IF;

  INSERT INTO d_c3_positions_h_t
    SELECT *
      FROM d_c3_positions_h p
     WHERE p.c3_asset IN (v_asset, v_claim_asset)
        OR p.c3_asset IN (SELECT b1_id
                            FROM d_b1_assets b
                           WHERE b.b1_as_type IN ('01', '02')
                             AND b.b1_client = v_row.client);

  OPEN p_result FOR
    SELECT a1.a1_cl_fullname AS full_name,
           uc.a1_cl_fullname AS uc_full_name,
           CASE
             WHEN REPLACE(report.full_address(a1.a1_id, 'P'), ' ', '') <>
                  REPLACE(report.full_address(a1.a1_id, 'J'), ' ', '') THEN
              'Юридический адрес: ' || report.full_address(a1.a1_id, 'J') ||
              chr(10) || 'Фактический адрес: ' ||
              report.full_address(a1.a1_id, 'P')
             ELSE
              report.full_address(a1.a1_id, 'P')
           END AS address,
           CASE
             WHEN b1.b1_as_type = '04' THEN
              uc.a1_cl_doc_nom || ' от ' || uc.a1_cl_doc_dat
             ELSE
              a1.a1_cl_doc_nom || ' от ' || a1.a1_cl_doc_dat
           END AS doc,
           nvl(CASE
                 WHEN b1.b1_as_type = '04' THEN
                  uc.a1_idn
                 ELSE
                  a1.a1_idn
               END,
               ' ') AS bin,
           UPPER(s18.s18_name) AS SEC_TYPE,
           s18.s18_code AS sec_type_code,
           CASE
             WHEN b1.b1_as_type = '05' THEN
              b1.b1_fullname
             ELSE
              p4.p4_nsin --v_nin
           END || CASE
             WHEN p4.p4_nsin <> v_nin AND b1.b1_as_type <> '06' THEN
              '*'
             ELSE
              ''
           END AS NIN,
           
           CASE
             WHEN b1.b1_as_type IN ('01', '02') THEN
              report.volOfDeclaredShares(v_client /*p4.client*/, v_date)
             ELSE
              report.volOfDeclaredSecurities(v_client /*p4.client*/,
                                             v_date,
                                             v_nin)
           END AS volOfAllDeclared,
           
           CASE
             WHEN b1.b1_as_type IN ('01', '02') THEN
              report.volOfPlacedShares(v_client /*p4.client*/, v_date)
             ELSE
              report.volOfPlacedSecurities(v_client /*p4.client*/,
                                           v_date,
                                           v_nin)
           END AS volOfAllPlaced,
           
           CASE
             WHEN b1.b1_as_type IN ('01', '02') THEN
              report.volOfReacquiredShares(v_client /*p4.client*/, v_date)
             ELSE
              report.volOfReacquiredSecurities(v_client /*p4.client*/,
                                               v_date,
                                               v_nin)
           END AS volOfAllReacquired,
           
           report.volofdeclaredsecurities(v_client /*p4.client*/,
                                          v_date,
                                          v_nin) AS volOfDeclared,
           report.volofplacedsecurities(v_client /*p4.client*/,
                                        v_date,
                                        v_nin) AS volOfPlaced,
           report.volofreacquiredsecurities(v_client /*p4.client*/,
                                            v_date,
                                            v_nin) AS volOfReacquired,
           
           CASE
             WHEN b1.b1_as_type IN ('05') THEN
              report.xt_getAccAmount(v_client /*p4.client*/, v_date, '108')
             ELSE
              0
           END AS xt_uk,
           CASE
             WHEN b1.b1_as_type IN ('05') THEN
              report.xt_getAccAmount(v_client /*p4.client*/, v_date, '9')
             ELSE
              0
           END AS xt_vykupl,
           CASE
             WHEN b1.b1_as_type IN ('05') THEN
              report.xt_getAccAmount(v_client /*p4.client*/, v_date, '9')
             ELSE
              0
           END AS xt_nerazm,
           p4.ORDER_N,
           p4.ORDER_DATE,
           Date2Char(v_on_date, 1) AS ONEDATE,
           CASE
             WHEN b1.b1_as_type = '05' THEN
              'Сведения о товариществе:'
             ELSE
              'Сведения об эмитенте:'
           END AS sved,
           CASE
             WHEN b1.b1_as_type = '05' THEN
              'хоз.товарищества:'
             ELSE
              'эмитента'
           END AS em_name,
           p4.p4_NSIN,
           nvl(p4.USER_EXEC_DATE, SYSDATE) AS USER_EXEC_DATE,
           get_order_signer(p_branch   => p4.branch,
                            order_code => v_order_type,
                            date_qry   => nvl(p4.USER_EXEC_DATE, SYSDATE)) AS user_sign,
           adm_pkg.getUserFIO(nvl(p4.USER_EXEC_NAME, P_USER_NAME)) AS user_exec,
           (CASE
             WHEN p4.cd_reference IS NOT NULL THEN
              ' '
             ELSE
              'Информация составлена на основании сведений, составляющих систему реестров'
           END) AS data_source,
           nvl(D_JOURNAL.get_j3_number(p4.id), ' ') AS j3_number,
           nvl(D_JOURNAL.get_j3_date(p4.id), ' ') AS j3_date,
           nvl2(v_claim_asset, 1, 0) AS is_claim,
           v_claim_nin AS claim_nin,
           report.getBalanceOnDateT(p_date      => v_date,
                                    p_asset_id  => v_claim_asset,
                                    p_client_id => v_client /*v_row.client*/,
                                    p_acc_type  => 9) AS volOfReacquiredClaim,
           report.getBalanceOnDateT(p_date      => v_date,
                                    p_asset_id  => v_asset,
                                    p_client_id => v_client /*v_row.client*/,
                                    p_acc_type  => 8) AS volOfExpired,
           report.getBalanceOnDateT(p_date      => v_date,
                                    p_asset_id  => v_claim_asset,
                                    p_client_id => NULL,
                                    p_acc_type  => '1,2,3') AS volOfPlacedClaim,
           report.getBalanceOnDateT(p_date      => v_date,
                                    p_asset_id  => v_asset,
                                    p_client_id => NULL,
                                    p_acc_type  => '104') AS volOfDeclaredBonds,
           CASE
              WHEN p4.order_type IN (55.1, 555.1) THEN
               'Реестр
держателей ценных бумаг по состоянию на ' ||
               to_char(v_on_date, 'dd.mm.yyyy hh24:mi:ss')
              WHEN p4.order_type IN (55.5, 555.5) THEN
              
               'Справка
о держателях ценных бумаг, владеющих ' || p4.percent || ' и более процентами от общего количества размещенных ценных бумаг, 
НИН ' || p4.p4_nsin || '
по состоянию на ' ||
               to_char(v_on_date, 'dd.mm.yyyy hh24:mi:ss')
              ELSE
               ' '
            END AS title,
           CASE
             WHEN b1.b1_status NOT IN
                  ('OP', 'EXP', 'RS', 'TM', 'US', 'SO', 'DE', 'BL', 'NL') THEN
              'Выпуск ценных бумаг ' || lower(st.s1_name) || '. '
             WHEN b1.b1_status = 'BL' THEN
              'Заблокирован. Основание: ' ||
              report.GetBlockReasonIssue(b1_id, v_date)
             WHEN b1.b1_status IN ('NL', 'DE') THEN
              report.GetCancellationDesc(p_asset_id => b1.b1_id)
           
             ELSE
              ' '
           END AS reestr_block,
           CASE
             WHEN p4.order_type > 100 THEN
              1
             ELSE
              0
           END AS is_oper,
           CASE
             WHEN p4.p4_nsin <> v_nin AND b1.b1_as_type <> '06' THEN
              v_nin
             ELSE
              ' '
           END AS prev_nin,
           report.IsShowSigner(P_ID => p4.id) AS is_show_signer,
           report.ercbAddress AS ercb_Address,
           p4.order_uid,
           report.getBalanceOnDateT(p_date      => v_date,
                                    p_asset_id  => p4.asset,
                                    p_client_id => v_row.client,
                                    p_acc_type  => '0',
                                    p_cb_type   => NULL) AS volOf0,
           report.getBalanceOnDateT(p_date      => v_date,
                                    p_asset_id  => NULL,
                                    p_client_id => v_row.client,
                                    p_acc_type  => '0',
                                    p_cb_type   => decode(v_as_type,
                                                          '03',
                                                          '03',
                                                          '04',
                                                          '04',
                                                          '01,02')) AS volOf0All,
          rprt_get_fname_addr(cl_id => p4.client) AS cl_addr_name
          -->sat 010915
          ,tisr_jasper_pkg.getKz(i_p_id => P_ID,i_id_bl => 1) AS kz1
          ,tisr_jasper_pkg.getKz(i_p_id => P_ID,i_id_bl => 2) AS kz2
          ,tisr_jasper_pkg.getKz(i_p_id => P_ID,i_id_bl => 3) AS kz3          
          --<
      FROM d_p4_orderinfo p4
      LEFT JOIN d_b1_assets b1 ON (b1.b1_nin = p4.p4_nsin)
      LEFT JOIN d_s18_asset_type s18 ON (s18.s18_code = b1.b1_as_type)
      LEFT JOIN d_a1_clients a1
    --        ON (a1.a1_id = p4.client)
    ON (a1.a1_id = v_client)
      LEFT JOIN d_a1_clients uc ON (uc.a1_id = a1.a1_uc_id)
      LEFT JOIN d_s1_status st ON st.s1_code = b1.b1_status
     WHERE p4.id = P_ID
          --and b1.date_modified <= v_date
          --and b1.date_end > v_date
       AND st.s1_type = 'ASS';
END;
/
