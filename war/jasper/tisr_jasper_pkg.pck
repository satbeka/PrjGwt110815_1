CREATE OR REPLACE PACKAGE "TISR_JASPER_PKG" IS
  -- Author  : KTAIPAKHOV
  -- Created : 26.09.2013 17:54:09
  -- Purpose :

  -- Public type declarations
  --type <TypeName> is <Datatype>;

  -- Public constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
  --<VariableName> <Datatype>;
  TYPE tbl_c3_position IS TABLE OF d_c3_positions_h%ROWTYPE INDEX BY PLS_INTEGER;
  v_is_cd number;
  g_refer varchar2(64);

  -- Public constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
  --<VariableName> <Datatype>;

  -- Значение выбранного поля из таблицы d_a1_clients_h
  -- @param p_a1_id - Идентификатор
  -- @param p_date - на дату
  -- @param f_field - поле
  FUNCTION get_a1_field(p_a1_id NUMBER, p_date DATE, f_field VARCHAR2)
    RETURN VARCHAR2;

  FUNCTION getKz (
                            i_p_id varchar2,
                            i_id_bl  NUMBER
                            ) RETURN varchar2;

  -- Количество ЦБ полученных при первичном размещении
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_volume_primary(i_client_id NUMBER,
                                i_asset_id  NUMBER,
                                i_beg_date  DATE,
                                i_end_date  DATE) RETURN NUMBER;

  -- Количество ЦБ отданных при погашениии
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_volume_repayment(i_client_id NUMBER,
                                  i_asset_id  NUMBER,
                                  i_beg_date  DATE,
                                  i_end_date  DATE) RETURN NUMBER;

  -- Количество ЦБ покупка на вторичном рынке по клиенты и ЦБ
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_vol_second_buy(i_client_id NUMBER,
                                i_asset_id  NUMBER,
                                i_beg_date  DATE,
                                i_end_date  DATE) RETURN NUMBER;

  -- Количество ЦБ - ПРОДАЖА на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_vol_second_sell(i_client_id NUMBER,
                                 i_asset_id  NUMBER,
                                 i_beg_date  DATE,
                                 i_end_date  DATE) RETURN NUMBER;

  -- Количество ЦБ НЕ покупка на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_vol_pro_plus(i_client_id NUMBER,
                              i_asset_id  NUMBER,
                              i_beg_date  DATE,
                              i_end_date  DATE) RETURN NUMBER;

  -- Количество ЦБ НЕ ПРОДАЖА на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_vol_pro_minus(i_client_id NUMBER,
                               i_asset_id  NUMBER,
                               i_beg_date  DATE,
                               i_end_date  DATE) RETURN NUMBER;

  ----------------------------------------------------------------------------
  -- Количество ЦБ полученных при первичном размещении
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_sum_primary(i_client_id NUMBER,
                             i_asset_id  NUMBER,
                             i_beg_date  DATE,
                             i_end_date  DATE) RETURN NUMBER;

  -- Количество ЦБ отданных при погашениии
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_sum_repayment(i_client_id NUMBER,
                               i_asset_id  NUMBER,
                               i_beg_date  DATE,
                               i_end_date  DATE) RETURN NUMBER;

  -- Количество ЦБ покупка на вторичном рынке по клиенты и ЦБ
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_sum_second_buy(i_client_id NUMBER,
                                i_asset_id  NUMBER,
                                i_beg_date  DATE,
                                i_end_date  DATE) RETURN NUMBER;

  -- Количество ЦБ - ПРОДАЖА на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_sum_second_sell(i_client_id NUMBER,
                                 i_asset_id  NUMBER,
                                 i_beg_date  DATE,
                                 i_end_date  DATE) RETURN NUMBER;

  -- Количество ЦБ НЕ покупка на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_sum_pro_plus(i_client_id NUMBER,
                              i_asset_id  NUMBER,
                              i_beg_date  DATE,
                              i_end_date  DATE) RETURN NUMBER;

  -- Количество ЦБ НЕ ПРОДАЖА на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_sum_pro_minus(i_client_id NUMBER,
                               i_asset_id  NUMBER,
                               i_beg_date  DATE,
                               i_end_date  DATE) RETURN NUMBER;

  ----------------------------------------------------------------------------

  -- Количество ЦБ полученных при первичном размещении
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_kom_primary(i_client_id NUMBER,
                             i_asset_id  NUMBER,
                             i_beg_date  DATE,
                             i_end_date  DATE) RETURN NUMBER;

  -- Количество ЦБ отданных при погашениии
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_kom_repayment(i_client_id NUMBER,
                               i_asset_id  NUMBER,
                               i_beg_date  DATE,
                               i_end_date  DATE) RETURN NUMBER;

  -- Количество ЦБ покупка на вторичном рынке по клиенты и ЦБ
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_kom_second_buy(i_client_id NUMBER,
                                i_asset_id  NUMBER,
                                i_beg_date  DATE,
                                i_end_date  DATE) RETURN NUMBER;

  -- Количество ЦБ - ПРОДАЖА на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_kom_second_sell(i_client_id NUMBER,
                                 i_asset_id  NUMBER,
                                 i_beg_date  DATE,
                                 i_end_date  DATE) RETURN NUMBER;

  -- Количество ЦБ НЕ покупка на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_kom_pro_plus(i_client_id NUMBER,
                              i_asset_id  NUMBER,
                              i_beg_date  DATE,
                              i_end_date  DATE) RETURN NUMBER;

  -- Количество ЦБ НЕ ПРОДАЖА на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_kom_pro_minus(i_client_id NUMBER,
                               i_asset_id  NUMBER,
                               i_beg_date  DATE,
                               i_end_date  DATE) RETURN NUMBER;

  ----------------------------------------------------------------------------

  --- Обновляет несквозную нумерацию для таблицы отчета в соответствии с сортировочны порядком
  --@param I_tablename       имя таблицы где обновляется нумерация
  --@param I_numeration      поле нумерации, которое обновляется
  --@param I_orderbyclause   порядок сортировки(поля через запятую) без слов "order by"
  --@param I_skvoz           сквозная нумерация
  --{*}  0 или NULL -нет
  --{*}  1 сквозная
  PROCEDURE numerate(i_tablename     IN VARCHAR2,
                     i_numeration    IN VARCHAR2,
                     i_orderbyclause IN VARCHAR2,
                     i_skvoz         IN NUMBER);

  -- Public function and procedure declarations
  FUNCTION holdersquantity(emitent_id NUMBER,
                           date_qry   DATE,
                           nin        VARCHAR2 := NULL,
                           p_cb_type  VARCHAR2 := NULL) RETURN NUMBER;

  --Количество держателей с ЦД
  FUNCTION HoldersQuantityCD(emitent_id NUMBER,
                             date_qry   DATE,
                             nin        VARCHAR2 := NULL,
                             p_refer_   varchar2) RETURN NUMBER;

  FUNCTION holdersquantitybyemission(emitent_id   NUMBER,
                                     date_qry     DATE,
                                     num_emission VARCHAR2,
                                     fiz          OUT NUMBER,
                                     jur          OUT NUMBER,
                                     nin_list     varchar2 := null)
    RETURN NUMBER;

  FUNCTION holdersquantitybyemission2(emitent_id   NUMBER,
                                      date_qry     DATE,
                                      num_emission VARCHAR2,
                                      fiz          OUT NUMBER,
                                      jur          OUT NUMBER,
                                      nin_list     varchar2 := null)
    RETURN NUMBER;

  FUNCTION getlistofholders(emitent_id NUMBER,
                            date_qry   DATE,
                            nin        VARCHAR2 := NULL) RETURN VARCHAR2;

  -- Получает список обременения
  FUNCTION getlistofencumbrance(acc_id     NUMBER,
                                date_qry   DATE,
                                p_asset_id number := NULL) RETURN VARCHAR2
    DETERMINISTIC;
  FUNCTION getListOfEncumbranceT(acc_id     NUMBER,
                                 date_qry   DATE,
                                 v_asset_id number := NULL) RETURN VARCHAR2;

  -- Получает список управляющих
  FUNCTION getlistofmanager(acc_id     NUMBER,
                            date_qry   DATE,
                            v_asset_id number := NULL) RETURN VARCHAR2
    DETERMINISTIC;

  FUNCTION getlistofmanagert(acc_id     NUMBER,
                             date_qry   DATE,
                             v_asset_id number := NULL) RETURN VARCHAR2;

  FUNCTION getlistofblocked(acc_id      NUMBER,
                            date_qry    DATE,
                            nin         VARCHAR2 := NULL,
                            p_is_holder varchar2 := 0) RETURN VARCHAR2;

  FUNCTION volofvotedsimplebyacc(acc_id   NUMBER,
                                 date_qry DATE,
                                 nin      VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION volofshares(acc_id   NUMBER,
                       date_qry DATE,
                       cb_type  VARCHAR2,
                       nin      VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION volofallsecurities(acc_id   NUMBER,
                              date_qry DATE,
                              nin      VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION volofallshares(acc_id   NUMBER,
                          date_qry DATE,
                          nin      VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION volofsimpleshares(acc_id   NUMBER,
                             date_qry DATE,
                             nin      VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION volofprefshares(acc_id   NUMBER,
                           date_qry DATE,
                           nin      VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION volofencumbrance(acc_id     NUMBER,
                            date_qry   DATE,
                            p_asset_id number := NULL) RETURN NUMBER;

  FUNCTION volOfEncumbranceT(acc_id     NUMBER,
                             date_qry   DATE,
                             p_asset_id number := NULL) RETURN NUMBER;

  FUNCTION volofblockedsecurities(acc_id   NUMBER,
                                  date_qry DATE,
                                  nin      VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION volofblockedsecuritiesT(acc_id     NUMBER := null,
                                   date_qry   DATE,
                                   p_asset_id number := NULL) RETURN number;

  FUNCTION VolOfManager(acc_id     NUMBER,
                        date_qry   DATE,
                        p_asset_id number := NULL) RETURN number;

  FUNCTION volOfManagerT(acc_id     NUMBER,
                         date_qry   DATE,
                         p_asset_id number := NULL) RETURN NUMBER;

  FUNCTION volofdeclaredsecurities(emitent_id NUMBER,
                                   date_qry   DATE,
                                   nin        VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION volofdeclaredshares(emitent_id NUMBER,
                               date_qry   DATE,
                               nin        VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION volofdeclaredsimpleshares(emitent_id NUMBER,
                                     date_qry   DATE,
                                     nin        VARCHAR2 := NULL)
    RETURN NUMBER;

  FUNCTION volofdeclaredprefshares(emitent_id NUMBER,
                                   date_qry   DATE,
                                   nin        VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION volofreacquiredsecurities(emitent_id NUMBER,
                                     date_qry   DATE,
                                     nin        VARCHAR2 := NULL)
    RETURN NUMBER;

  -- Количество выкупленных ЦБ эмитента в ЦД
  FUNCTION volOfReacquiredSecuritiesCD(emitent_id NUMBER,
                                       date_qry   DATE,
                                       nin        VARCHAR2 := NULL,
                                       cb_type    varchar2 := null)
    RETURN NUMBER;

  -- Количество объявленных ЦБ эмитента в ЦД
  FUNCTION volOfDeclaredSecuritiesCD(emitent_id NUMBER,
                                     date_qry   DATE,
                                     nin        VARCHAR2 := NULL,
                                     cb_type    varchar2 := null,
                                     p_refer    varchar2 := null)
    RETURN NUMBER;

  FUNCTION volOfUnclaimed(emitent_id NUMBER,
                          date_qry   DATE,
                          nin        VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION volofreacquiredshares(emitent_id NUMBER,
                                 date_qry   DATE,
                                 nin        VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION volofreacquiredsimpleshares(emitent_id NUMBER,
                                       date_qry   DATE,
                                       nin        VARCHAR2 := NULL)
    RETURN NUMBER;

  FUNCTION volofreacquiredprefshares(emitent_id NUMBER,
                                     date_qry   DATE,
                                     nin        VARCHAR2 := NULL)
    RETURN NUMBER;

  FUNCTION volofplacedencumbrance(emitent_id NUMBER,
                                  date_qry   DATE,
                                  nin        VARCHAR2 := NULL,
                                  p_cb_type  VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION volOfPlacedEncumbranceCD(emitent_id NUMBER,
                                    date_qry   DATE,
                                    nin        VARCHAR2 := NULL,
                                    p_refer    varchar2 := null)
    RETURN NUMBER;

  FUNCTION volofplacedblocked(emitent_id NUMBER,
                              date_qry   DATE,
                              nin        VARCHAR2 := NULL,
                              p_cb_type  VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION volOfPlacedBlockedCd(emitent_id NUMBER,
                                date_qry   DATE,
                                nin        VARCHAR2 := NULL,
                                p_refer    varchar2 := null) RETURN NUMBER;

  FUNCTION volofplacedsecurities(emitent_id NUMBER,
                                 date_qry   DATE,
                                 nin        VARCHAR2 := NULL,
                                 p_refer    varchar2 := null) RETURN NUMBER
    DETERMINISTIC;

  FUNCTION volofplacedshares(emitent_id NUMBER,
                             date_qry   DATE,
                             nin        VARCHAR2 := NULL) RETURN NUMBER
    DETERMINISTIC;

  FUNCTION volofplacedsimpleshares(emitent_id NUMBER,
                                   date_qry   DATE,
                                   nin        VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION volofplacedprivshares(emitent_id NUMBER,
                                 date_qry   DATE,
                                 nin        VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION volOfVotedSecurities(emitent_id NUMBER,
                                date_qry   DATE,
                                nin        VARCHAR2 := NULL,
                                rep_id     number := null) RETURN NUMBER
    DETERMINISTIC;

  FUNCTION volOfVotedSimpleSecurities(emitent_id NUMBER,
                                      date_qry   DATE,
                                      nin        VARCHAR2 := NULL,
                                      rep_id     number := null)
    RETURN NUMBER DETERMINISTIC;

  FUNCTION volOfVotedPrefSecurities(emitent_id NUMBER,
                                    date_qry   DATE,
                                    nin        VARCHAR2 := NULL,
                                    rep_id     number := null) RETURN NUMBER
    DETERMINISTIC;

  FUNCTION getlistofplacedshares(emitent_id NUMBER, date_qry DATE)
    RETURN tbl_varchar;

  FUNCTION getemitentidbynin(nin VARCHAR2) RETURN NUMBER;

  FUNCTION char2datetime(chrdt VARCHAR2) RETURN DATE;

  FUNCTION char2date(chrdt VARCHAR2) RETURN DATE;

  FUNCTION date2char(dt DATE, tm NUMBER := NULL) RETURN VARCHAR2;

  FUNCTION round8(val               NUMBER,
                  show_decimal_zero NUMBER := 0,
                  decimal_places    number := 8) RETURN VARCHAR2;

  FUNCTION to_number8(val VARCHAR2) RETURN NUMBER;

  -- XT
  FUNCTION xt_getaccamount(client_id NUMBER,
                           date_qry  DATE,
                           acc_type  NUMBER) RETURN NUMBER;

  -- утилиты отчетов
  FUNCTION full_address(client_id       NUMBER,
                        address_type    VARCHAR2 := NULL,
                        i_date          DATE := SYSDATE,
                        i_index_visible number := 1) RETURN VARCHAR2;

  FUNCTION client_docs(acc_id NUMBER) RETURN VARCHAR2;
  FUNCTION client_docs_spr(acc_id NUMBER) RETURN VARCHAR2;

  FUNCTION acc_open_date(cl_account_id NUMBER) RETURN DATE;
  FUNCTION getVidAndNin(p_asset_id NUMBER) RETURN VARCHAR2;
  FUNCTION getRegName RETURN VARCHAR2;

  FUNCTION getRegInfo RETURN VARCHAR2;

  FUNCTION getBalance(p_asset_id  varchar2 := NULL,
                      p_client_id NUMBER := NULL,
                      p_acc_type  VARCHAR2 := NULL) RETURN NUMBER;

  FUNCTION getBalanceOnDate(p_date       DATE,
                            p_asset_id   varchar2 := NULL,
                            p_client_id  NUMBER := NULL,
                            p_acc_type   VARCHAR2 := NULL,
                            p_cb_type    varchar2 := null,
                            p_emitent_id NUMBER := null) RETURN NUMBER;

  FUNCTION getBalanceOnDateT(p_date       DATE,
                             p_asset_id   varchar2 := NULL,
                             p_client_id  NUMBER := NULL,
                             p_acc_type   VARCHAR2 := NULL,
                             p_cb_type    varchar2 := null,
                             p_emitent_id NUMBER := null,
                             p_vote       NUMBER := NULL) RETURN NUMBER;

  --Возвращает наименование типа тарифа, для актов и счетов используется
  function fee_type_name(i_FEECALCLOGID number) RETURN varchar2;

  --Возвращает значение параметра
  FUNCTION get_adm_param(i_param varchar2) RETURN VARCHAR2;

  function GetBlockReasonIssue(P_ASSET_ID number, P_date date)
    return varchar2;

  function GetReestrAddInfo(P_CLIENT_ID     number,
                            P_ADD_INFO_LIST varchar2,
                            P_DATE          date) return varchar2;

  function GetCDAccID return number;

  function GetCDID return number;

  function GetListOfCommonRepr(P_CLIENT_ID number) return varchar2;

  function getClContactInfo(p_client_id number) return varchar2;

  function getClAccStatus(p_client_id number) return varchar2;

  function getClBankReq(p_client_id number) return varchar2;

  function getClBankReqCD(p_id number) return varchar2;

  function GetClRnn(P_client_id number) return varchar2;

  function GetClCountryReg(P_client_id number) return varchar2;

  function GetClResident(P_client_id number) return varchar2;

  function GetClResidentCD(P_RESIDENT number) return varchar2;

  function GetClDateBirth(P_client_id number) return varchar2;

  function GetReestrAddInfoCD(P_ID number, P_ADD_INFO_LIST varchar2)
    return varchar2;

  function VolOfZalogUprBlock(i_type   varchar, -- BLOCK, DOV, ZALOG
                              acc_id   NUMBER,
                              date_qry DATE,
                              asset_id number,
                              i_c3_id  number := null) return number;

  function VolOfZalogUprBlockT(i_type   varchar, -- BLOCK, DOV, ZALOG
                               acc_id   NUMBER,
                               date_qry DATE,
                               asset_id number) return number;

  function ListOfZalogUprBlock(i_type      varchar, -- BLOCK, DOV, ZALOG
                               acc_id      NUMBER,
                               date_qry    DATE,
                               asset_id    number,
                               p_is_holder number := 0) return varchar2;

  function ListOfZalogUprBlockT(i_type      varchar, -- BLOCK, DOV, ZALOG
                                acc_id      NUMBER,
                                date_qry    DATE,
                                asset_id    number,
                                p_is_holder number := 0) return varchar2;

  function GetNINOnDate(p_nin varchar2, p_date date) return varchar2;

  function GetDateNin(p_nin varchar2, p_date date) return date;

  function GetCancellationDesc(p_asset_id   number,
                               P_EMITENT_ID number := null) return varchar2;

  function IsShowSigner(P_ID number) return number;

  function ercbAddress return varchar2;

  function GetDealHistoryTitle(P_ID number) return varchar2;

  function GetLinkedAssetID(p_id number) return number;

  function GetLinkedAssetNIN(p_id number) return varchar2;

END TISR_JASPER_PKG;
/
CREATE OR REPLACE PACKAGE BODY "TISR_JASPER_PKG" IS

  -- Private type declarations
  --type <TypeName> is <Datatype>;

  -- Private constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Private variable declarations
  --<VariableName> <Datatype>;

  -- Значение выбранного поля из таблицы d_a1_clients_h
  -- @param p_b1_id - Идентификатор
  -- @param p_date - на дату
  -- @param f_field - поле

  FUNCTION get_a1_field(p_a1_id NUMBER, p_date DATE, f_field VARCHAR2)
    RETURN VARCHAR2 IS
    p_out     VARCHAR2(1000);
    p_datestr VARCHAR2(200);
    p_sql     VARCHAR2(1000);
  BEGIN
    p_datestr := TO_CHAR(p_date, 'dd.mm.yyyy HH24:mi:ss');
  
    p_sql := ' Select max(' || f_field || ')
            from d_a1_clients_h q
           WHERE q.date_modified <= report.Char2DateTime(''' ||
             p_datestr || ''') AND q.date_end> report.Char2DateTime(''' ||
             p_datestr || ''')
             AND q.status_hist IN (1, 2)
             and a1_id=' || p_a1_id;
  
    EXECUTE IMMEDIATE p_sql
      INTO p_out;
  
    RETURN p_out;
  END;

  -- Количество ЦБ по клиенту и НИИ на дату

  FUNCTION getKz (
                            i_p_id varchar2,
                            i_id_bl  NUMBER
                            ) RETURN varchar2 IS
                            
    p_KZ varchar2(1000):=' net Kz translate! ';
  BEGIN
    begin 
    SELECT tt.text_kz
      INTO p_KZ
      FROM tisr_jasper_kz tt
      left join d_view_cl_order_all a 
         on a.id=i_p_id and tt.report_code=a.report_code
      where tt.id_bl=i_id_bl;
      exception when others then
        p_KZ:=' net Kz translate! ';
        end;
    RETURN p_KZ;
  END;

  -- Количество ЦБ полученных при первичном размещении
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_volume_primary(i_client_id NUMBER,
                                i_asset_id  NUMBER,
                                i_beg_date  DATE,
                                i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_volume)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (30, 530, 1030, 42, 542, 1042)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_ca_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND a.p3_own_acc_type IN ('4', '7', '109')
       AND a.p3_status = 0;
    --       AND a.p3_answ_type = '30-01';
  
    RETURN nvl(p_count, 0);
  END;

  -- Количество ЦБ отданных при погашениии
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_volume_repayment(i_client_id NUMBER,
                                  i_asset_id  NUMBER,
                                  i_beg_date  DATE,
                                  i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_volume)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (30, 530, 1030, 43, 543, 1043, 1044)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_own_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND (a.p3_ca_acc_type IN ('6', '7', '9'))
       AND a.p3_status = 0;
    --       AND a.p3_answ_type = '30-01';
  
    RETURN nvl(p_count, 0);
  END;

  -- Количество ЦБ покупка на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_vol_second_buy(i_client_id NUMBER,
                                i_asset_id  NUMBER,
                                i_beg_date  DATE,
                                i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_volume)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (30, 530, 1030)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_ca_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND a.p3_own_acc_type NOT IN ('4', '7', '109') -- кроме первичного
       AND a.p3_status = 0
       AND a.p3_type_deal = 'BUYSEL';
    --       AND a.p3_answ_type = '30-01';
  
    RETURN nvl(p_count, 0);
  END;

  -- Количество ЦБ - ПРОДАЖА на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_vol_second_sell(i_client_id NUMBER,
                                 i_asset_id  NUMBER,
                                 i_beg_date  DATE,
                                 i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_volume)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (10, 510, 1010)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_ca_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND a.p3_own_acc_type NOT IN ('4', '6', '7', '9') -- кроме выкупа
       AND a.p3_status = 0
       AND a.p3_type_deal = 'BUYSEL';
    --       AND a.p3_answ_type = '10-01';
  
    RETURN nvl(p_count, 0);
  END;

  -- Количество ЦБ НЕ покупка на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_vol_pro_plus(i_client_id NUMBER,
                              i_asset_id  NUMBER,
                              i_beg_date  DATE,
                              i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_volume)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (30, 530, 1030)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_ca_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND a.p3_own_acc_type NOT IN ('4', '6', '7', '109') -- кроме первичного и выкупа
       AND a.p3_status = 0
       AND a.p3_type_deal <> 'BUYSEL';
    --       AND a.p3_answ_type = '30-01';
  
    RETURN nvl(p_count, 0);
  END;

  -- Количество ЦБ НЕ ПРОДАЖА на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_vol_pro_minus(i_client_id NUMBER,
                               i_asset_id  NUMBER,
                               i_beg_date  DATE,
                               i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_volume)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (10, 510, 1010)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_ca_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND a.p3_own_acc_type NOT IN ('4', '6', '7', '9') -- кроме первичного и выкупа
       AND a.p3_status = 0
       AND a.p3_type_deal <> 'BUYSEL';
    --       AND a.p3_answ_type = '10-01';
  
    RETURN nvl(p_count, 0);
  END;

  ------------------------------------------------------------------------------------------
  -- Количество ЦБ полученных при первичном размещении
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_sum_primary(i_client_id NUMBER,
                             i_asset_id  NUMBER,
                             i_beg_date  DATE,
                             i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_volume * a.p3_price)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (30, 530, 1030, 42, 542, 1042)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_ca_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND a.p3_own_acc_type IN ('4', '7', '109')
       AND a.p3_status = 0;
    --       AND a.p3_answ_type = '30-01';
  
    RETURN nvl(p_count, 0);
  END;

  -- Количество ЦБ отданных при погашениии
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_sum_repayment(i_client_id NUMBER,
                               i_asset_id  NUMBER,
                               i_beg_date  DATE,
                               i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_volume * a.p3_price)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (30, 530, 1030, 43, 543, 1043, 1044)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_own_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND (a.p3_ca_acc_type IN ('6', '7', '9'))
       AND a.p3_status = 0;
    --       AND a.p3_answ_type = '30-01';
  
    RETURN nvl(p_count, 0);
  END;

  -- Количество ЦБ покупка на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_sum_second_buy(i_client_id NUMBER,
                                i_asset_id  NUMBER,
                                i_beg_date  DATE,
                                i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_volume * a.p3_price)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (30, 530, 1030)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_ca_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND a.p3_own_acc_type NOT IN ('4', '7', '109') -- кроме первичного
       AND a.p3_status = 0
       AND a.p3_type_deal = 'BUYSEL';
    --       AND a.p3_answ_type = '30-01';
  
    RETURN nvl(p_count, 0);
  END;

  -- Количество ЦБ - ПРОДАЖА на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_sum_second_sell(i_client_id NUMBER,
                                 i_asset_id  NUMBER,
                                 i_beg_date  DATE,
                                 i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_volume * a.p3_price)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (10, 510, 1010)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_ca_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND a.p3_own_acc_type NOT IN ('4', '6', '7', '9') -- кроме выкупа
       AND a.p3_status = 0
       AND a.p3_type_deal = 'BUYSEL';
    --       AND a.p3_answ_type = '10-01';
  
    RETURN nvl(p_count, 0);
  END;

  -- Количество ЦБ НЕ покупка на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_sum_pro_plus(i_client_id NUMBER,
                              i_asset_id  NUMBER,
                              i_beg_date  DATE,
                              i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_volume * a.p3_price)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (30, 530, 1030)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_ca_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND a.p3_own_acc_type NOT IN ('4', '6', '7', '109') -- кроме первичного и выкупа
       AND a.p3_status = 0
       AND a.p3_type_deal <> 'BUYSEL';
    --       AND a.p3_answ_type = '30-01';
  
    RETURN nvl(p_count, 0);
  END;

  -- Количество ЦБ НЕ ПРОДАЖА на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_sum_pro_minus(i_client_id NUMBER,
                               i_asset_id  NUMBER,
                               i_beg_date  DATE,
                               i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_volume * a.p3_price)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (10, 510, 1010)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_ca_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND a.p3_own_acc_type NOT IN ('4', '6', '7', '9') -- кроме первичного и выкупа
       AND a.p3_status = 0
       AND a.p3_type_deal <> 'BUYSEL';
    --       AND a.p3_answ_type = '10-01';
  
    RETURN nvl(p_count, 0);
  END;

  ------------------------------------------------------------------------------------------

  -- Количество ЦБ полученных при первичном размещении
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_kom_primary(i_client_id NUMBER,
                             i_asset_id  NUMBER,
                             i_beg_date  DATE,
                             i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_price_total)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (30, 530, 1030, 42, 542, 1042)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_ca_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND a.p3_own_acc_type IN ('4', '7', '109')
       AND a.p3_status = 0;
    --       AND a.p3_answ_type = '30-01';
  
    RETURN nvl(p_count, 0);
  END;

  -- Количество ЦБ отданных при погашениии
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_kom_repayment(i_client_id NUMBER,
                               i_asset_id  NUMBER,
                               i_beg_date  DATE,
                               i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_price_total)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (30, 530, 1030, 43, 543, 1043, 1044)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_own_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND (a.p3_ca_acc_type IN ('6', '7', '9'))
       AND a.p3_status = 0;
    --       AND a.p3_answ_type = '30-01';
  
    RETURN nvl(p_count, 0);
  END;

  -- Количество ЦБ покупка на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_kom_second_buy(i_client_id NUMBER,
                                i_asset_id  NUMBER,
                                i_beg_date  DATE,
                                i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_price_total)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (30, 530, 1030)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_ca_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND a.p3_own_acc_type NOT IN ('4', '7', '109') -- кроме первичного
       AND a.p3_status = 0
       AND a.p3_type_deal = 'BUYSEL';
    --       AND a.p3_answ_type = '30-01';
  
    RETURN nvl(p_count, 0);
  END;

  -- Количество ЦБ - ПРОДАЖА на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_kom_second_sell(i_client_id NUMBER,
                                 i_asset_id  NUMBER,
                                 i_beg_date  DATE,
                                 i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_price_total)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (10, 510, 1010)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_ca_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND a.p3_own_acc_type NOT IN ('4', '6', '7', '9') -- кроме выкупа
       AND a.p3_status = 0
       AND a.p3_type_deal = 'BUYSEL';
    --       AND a.p3_answ_type = '10-01';
  
    RETURN nvl(p_count, 0);
  END;

  -- Количество ЦБ НЕ покупка на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_kom_pro_plus(i_client_id NUMBER,
                              i_asset_id  NUMBER,
                              i_beg_date  DATE,
                              i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_price_total)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (30, 530, 1030)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_ca_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND a.p3_own_acc_type NOT IN ('4', '6', '7', '109') -- кроме первичного и выкупа
       AND a.p3_status = 0
       AND a.p3_type_deal <> 'BUYSEL';
    --       AND a.p3_answ_type = '30-01';
  
    RETURN nvl(p_count, 0);
  END;

  -- Количество ЦБ НЕ ПРОДАЖА на вторичном рынке по клиенту и ЦБ за период
  -- @param i_client_id - Клиент
  -- @param i_asset_id - ЦБ
  -- @param i_beg_date - Период С
  -- @param i_end_date - Период по

  FUNCTION getp3_kom_pro_minus(i_client_id NUMBER,
                               i_asset_id  NUMBER,
                               i_beg_date  DATE,
                               i_end_date  DATE) RETURN NUMBER IS
    p_count NUMBER;
  BEGIN
    SELECT SUM(a.p3_price_total)
      INTO p_count
      FROM d_p3_order_stock a
     WHERE p3_order_type IN (10, 510, 1010)
       AND a.p3_exec_date >= i_beg_date
       AND a.p3_exec_date < i_end_date
       AND a.p3_ca_client = i_client_id
       AND a.p3_asset = i_asset_id
       AND a.p3_own_acc_type NOT IN ('4', '6', '7', '9') -- кроме первичного и выкупа
       AND a.p3_status = 0
       AND a.p3_type_deal <> 'BUYSEL';
    --       AND a.p3_answ_type = '10-01';
  
    RETURN nvl(p_count, 0);
  END;

  ------------------------------------------------------------------------------------------

  --- Обновляет несквозную нумерацию для таблицы отчета в соответствии с сортировочны порядком
  --@param I_tablename       имя таблицы где обновляется нумерация
  --@param I_numeration      поле нумерации, которое обновляется
  --@param I_orderbyclause   порядок сортировки(поля через запятую) без слов "order by"
  --@param I_skvoz           сквозная нумерация
  --{*}  0 или NULL -нет
  --{*}  1 сквозная
  PROCEDURE numerate(i_tablename     IN VARCHAR2, ---имя  таблицы где обновляется нумерация
                     i_numeration    IN VARCHAR2, --- поле нумерации, которое обновляется
                     i_orderbyclause IN VARCHAR2,
                     --- порядок сортировки(поля через запятую) без слов "order by"
                     i_skvoz IN NUMBER -- сквозная нумерация или нет 1- сквозная
                     ) AS
    tcur        SYS_REFCURSOR;
    i           NUMBER;
    update_sql  VARCHAR2(4000);
    varsysouter VARCHAR2(4000);
    varisdata   NUMBER;
  BEGIN
    i := 1;
  
    OPEN tcur FOR 'select t.sysout, t.ISDATA ' || ' from ' || i_tablename || ' t ' || '  order by ' || i_orderbyclause || ' ';
  
    LOOP
      FETCH tcur
        INTO varsysouter, varisdata;
    
      IF tcur%FOUND = FALSE THEN
        CLOSE tcur;
      
        EXIT;
      END IF;
    
      IF (varisdata IS NULL) THEN
        IF i_skvoz = 0 THEN
          -- если нумерация не сквозная то сбрасываем счетчик
          i := 1;
        END IF;
      ELSE
        update_sql := 'update ' || i_tablename || ' t ' || 'set  ( ' ||
                      i_numeration || ') = ( ' || i || ' )' ||
                      ' where t.sysout= ''' ||
                      REPLACE(varsysouter, '''', '') || '''';
      
        EXECUTE IMMEDIATE update_sql;
      
        i := i + 1;
      END IF;
    END LOOP;
  
    COMMIT;
  END;

  -- Function and procedure implementations
  FUNCTION HoldersQuantity(emitent_id NUMBER,
                           date_qry   DATE,
                           nin        VARCHAR2 := NULL,
                           p_cb_type  VARCHAR2 := NULL) RETURN NUMBER IS
    quantity NUMBER;
  BEGIN
  
    SELECT COUNT(DISTINCT a2.a2_client)
      INTO quantity
      FROM d_c3_positions_h c3
      JOIN d_b1_assets_h b1
        ON (b1.b1_id = c3.c3_asset)
      JOIN d_a2_accounts a2
        ON (a2.a2_id = c3.c3_account)
     WHERE b1.b1_client = emitent_id
       AND a2.a2_acc_type IN (1, 2, 3, 5)
       AND b1.status_hist IN (1, 2)
       AND b1_client = emitent_id
       AND b1.date_modified <= date_qry
       AND b1.date_end > date_qry
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2)
       AND c3.c3_amount > 0
       AND (b1.b1_nin = nin OR nin IS NULL)
       AND (b1.b1_as_type IN
           (SELECT column_value FROM TABLE(cfg_utils.in_list(p_cb_type))) OR
           p_cb_type IS NULL);
  
    RETURN(nvl(quantity, 0));
  END;

  --Количество держателей с ЦД
  FUNCTION HoldersQuantityCD(emitent_id NUMBER,
                             date_qry   DATE,
                             nin        VARCHAR2 := NULL,
                             p_refer_   VARCHAR2) RETURN NUMBER IS
    v_cnt    NUMBER;
    v_cnt_cd NUMBER;
  BEGIN
  
    SELECT COUNT(DISTINCT a2.a2_client)
      INTO v_cnt
      FROM d_c3_positions_h c3
      JOIN d_b1_assets_h b1
        ON (b1.b1_id = c3.c3_asset)
      JOIN d_a2_accounts a2
        ON (a2.a2_id = c3.c3_account)
     WHERE b1.b1_client = emitent_id
       AND a2.a2_acc_type IN (1, 2)
       AND b1.status_hist IN (1, 2)
       AND b1_client = emitent_id
       AND b1.date_modified <= date_qry
       AND b1.date_end > date_qry
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2)
       AND b1.b1_nin = nin;
  
    SELECT COUNT(*)
      INTO v_cnt_cd
      FROM fa_shareholders_sec_us s
     WHERE s.refer_ = p_refer_;
  
    RETURN v_cnt + v_cnt_cd;
  END;

  FUNCTION HoldersQuantityByEmission2(emitent_id   NUMBER,
                                      date_qry     DATE,
                                      num_emission VARCHAR2,
                                      fiz          OUT NUMBER,
                                      jur          OUT NUMBER,
                                      nin_list     VARCHAR2 := NULL)
    RETURN NUMBER IS
    quantity NUMBER;
  BEGIN
  
    /*   IF num_emission IS NULL OR TRIM(num_emission) = '' THEN
      quantity := 0;
    END IF;*/
  
    SELECT COUNT(DISTINCT a2.a2_client)
      INTO quantity
      FROM d_c3_positions_h c3
      JOIN d_b1_assets_h b1
        ON (b1.b1_id = c3.c3_asset)
      JOIN d_a2_accounts a2
        ON (a2.a2_id = c3.c3_account)
     WHERE b1.b1_client = emitent_id
       AND (TRIM(b1.b1_num_emission) = TRIM(num_emission) OR
           (num_emission IS NULL AND b1.b1_as_type = '05'))
       AND a2.a2_acc_type IN (1, 2, 3, 5)
       AND b1.status_hist IN (1, 2)
       AND b1.date_modified <= date_qry
       AND b1.date_end > date_qry
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2)
       AND c3.c3_amount > 0;
  
    CASE
      WHEN nvl(quantity, 0) = 0 THEN
        quantity := 1;
      ELSE
        NULL;
    END CASE;
  
    RETURN(nvl(quantity, 0));
  END;

  FUNCTION HoldersQuantityByEmission(emitent_id   NUMBER,
                                     date_qry     DATE,
                                     num_emission VARCHAR2,
                                     fiz          OUT NUMBER,
                                     jur          OUT NUMBER,
                                     nin_list     VARCHAR2 := NULL)
    RETURN NUMBER IS
    quantity NUMBER;
  BEGIN
  
    /*   IF num_emission IS NULL OR TRIM(num_emission) = '' THEN
      quantity := 0;
    END IF;*/
  
    SELECT COUNT(z.client_id),
           SUM(CASE
                 WHEN a1.a1_cl_type = 'F' THEN
                  1
                 ELSE
                  0
               END),
           SUM(CASE
                 WHEN a1.a1_cl_type IN ('J', 'P') THEN
                  1
                 ELSE
                  0
               END)
      INTO quantity, fiz, jur
      FROM (SELECT a2.a2_client AS client_id
              FROM d_c3_positions_h c3
              JOIN d_b1_assets_h b1
                ON (b1.b1_id = c3.c3_asset)
              JOIN d_a2_accounts a2
                ON (a2.a2_id = c3.c3_account)
              JOIN d_a1_clients a1
                ON (a1.a1_id = a2.a2_client)
             WHERE b1.b1_client = emitent_id
               AND ((TRIM(b1.b1_num_emission) = TRIM(num_emission)) OR
                   
                   (TRIM(num_emission) IS NULL AND b1.b1_as_type = '05' AND
                   nin_list IS NULL) OR
                   ( --trim(num_emission) is null
                   --and
                    b1_nin IN
                    (SELECT column_value
                        FROM TABLE(cfg_utils.IN_LIST(nin_list))) AND
                    b1.b1_as_type <> '05' AND nin_list IS NOT NULL))
               AND a2.a2_acc_type IN (1, 2, 3, 5)
               AND b1.status_hist IN (1, 2)
               AND b1.date_modified <= date_qry
               AND b1.date_end > date_qry
                  
                  /*          and b1.rec_id = (select max(h.rec_id/)
                  from d_b1_assets_h h
                  where h.b1_id = b1.b1_id
                        --and h.b1_client = emitent_id
                        and h.date_modified <= date_qry
                        and h.status_hist in (1,2))
                        */
                  
                  /*          and c3.rec_id = (select max(h.rec_id/)
                  from d_c3_positions_h h
                  where h.c3_id = c3.c3_id
                      -- h.c3_account = c3.c3_account
                      -- and h.c3_asset = c3.c3_asset
                       and h.date_modified<=date_qry
                   --group by h.c3_id
                   )
                   */
               AND c3.date_modified <= date_qry
               AND c3.date_end > date_qry
               AND c3.status_hist IN (1, 2)
             GROUP BY a2.a2_client
            HAVING SUM(c3.c3_amount) <> 0) Z
      JOIN d_a1_clients a1
        ON (a1.a1_id = z.client_id);
  
    RETURN(nvl(quantity, 0));
  END;

  FUNCTION getlistofholders(emitent_id NUMBER,
                            date_qry   DATE,
                            nin        VARCHAR2 := NULL) RETURN VARCHAR2 IS
    acc_id_list VARCHAR2(4000);
  BEGIN
    DECLARE
      CURSOR acc_list_cur IS
        SELECT a2.a2_id AS acc_id
          FROM d_c3_positions_h c3
          JOIN d_b1_assets_h b1
            ON (b1.b1_id = c3.c3_asset)
          JOIN d_a2_accounts a2
            ON (a2.a2_id = c3.c3_account)
         WHERE b1.b1_client = emitent_id
           AND a2.a2_acc_type IN (1, 2, 3, 5)
           AND b1.status_hist IN (1, 2)
           AND b1.date_modified <= date_qry
           AND b1.date_end > date_qry
           AND c3.date_modified <= date_qry
           AND c3.date_end > date_qry
           AND c3.status_hist IN (1, 2)
           AND (b1.b1_nin = nin OR nin IS NULL);
    BEGIN
      FOR acc_list_rec IN acc_list_cur LOOP
        acc_id_list := acc_id_list || acc_list_rec.acc_id || ',';
      END LOOP;
    END;
  
    RETURN(acc_id_list);
  END;
  -- В обременении
  FUNCTION getListOfEncumbrance(acc_id     NUMBER,
                                date_qry   DATE,
                                p_asset_id NUMBER := NULL) RETURN VARCHAR2 AS
    res VARCHAR2(3000);
  BEGIN
    res := ListOfZalogUprBlock(i_type   => 'ZALOG',
                               acc_id   => acc_id,
                               date_qry => date_qry,
                               asset_id => p_asset_id);
  
    RETURN res;
  END;

  -- В обременении
  FUNCTION getListOfEncumbranceT(acc_id     NUMBER,
                                 date_qry   DATE,
                                 v_asset_id NUMBER := NULL) RETURN VARCHAR2 IS
    res VARCHAR2(3000);
  BEGIN
    res := ListOfZalogUprBlockT(i_type   => 'ZALOG',
                                acc_id   => acc_id,
                                date_qry => date_qry,
                                asset_id => v_asset_id);
    RETURN res;
  END;

  -- В управлении
  FUNCTION getlistofmanager(acc_id     NUMBER,
                            date_qry   DATE,
                            v_asset_id NUMBER := NULL) RETURN VARCHAR2 AS
    res VARCHAR2(3000);
  BEGIN
    res := ListOfZalogUprBlock(i_type   => 'DOV',
                               acc_id   => acc_id,
                               date_qry => date_qry,
                               asset_id => v_asset_id);
    RETURN res;
  END;

  FUNCTION getlistofmanagert(acc_id     NUMBER,
                             date_qry   DATE,
                             v_asset_id NUMBER := NULL) RETURN VARCHAR2 IS
    res VARCHAR2(3000);
  BEGIN
    res := ListOfZalogUprBlockT(i_type   => 'DOV',
                                acc_id   => acc_id,
                                date_qry => date_qry,
                                asset_id => v_asset_id);
    RETURN res;
  END;

  -- Список блокированных
  FUNCTION getListOfBlocked(acc_id      NUMBER,
                            date_qry    DATE,
                            nin         VARCHAR2 := NULL,
                            p_is_holder VARCHAR2 := 0) RETURN VARCHAR2 IS
    ListOfBlocked VARCHAR2(4000);
    v_nin         VARCHAR2(36);
  BEGIN
    ListOfBlocked := '0';
    DECLARE
      CURSOR upr_list_cur IS
        SELECT (SELECT p3.p3_tmemo
                  FROM d_p3_order_stock p3
                 WHERE p3.p3_id = c3.c3_parent_id) AS block_reason, --Z.a1_cl_fullname AS upr,
               --грязный хак
               /*               case
                 when SUM(c3.c3_amount) = 0 then
                  sum((select sum(p.c3_amount)
                        from d_c3_positions_h p
                       where p.c3_subparent_id = c3.c3_id
                         and p.date_modified < = sysdate
                         and p.date_end > sysdate))
                 else
                  SUM(c3.c3_amount)
               end
               */
               (SELECT p3.p3_volume
                  FROM d_p3_order_stock p3
                 WHERE p3.p3_id = c3.c3_parent_id
                   AND p3.p3_order_type NOT IN (531)) AS amt,
               z.a1_cl_name_short cl_name,
               c3.c3_asset
          FROM d_c3_positions_h c3
          JOIN d_b1_assets_h b1
            ON (b1.b1_id = c3.c3_asset)
          JOIN d_a1_clients Z
            ON (Z.a1_id = c3.c3_client)
         WHERE c3.c3_account = acc_id
           AND c3.date_modified <= date_qry
           AND c3.date_end > date_qry
           AND c3.status_hist IN (1, 2)
           AND c3.c3_type = 'BLOCK'
           AND (b1.b1_nin = nin OR nin IS NULL)
           AND b1.status_hist IN (1, 2)
           AND b1.date_modified <= date_qry
           AND b1.date_end > date_qry
           AND c3.c3_amount > 0
         GROUP BY Z.a1_cl_fullname,
                  c3_parent_id,
                  a1_cl_name_short,
                  c3_asset;
    BEGIN
      FOR rec IN upr_list_cur LOOP
        IF rec.amt != 0 THEN
        
          SELECT b1_nin
            INTO v_nin
            FROM d_b1_assets
           WHERE b1_id = rec.c3_asset;
          ListOfBlocked := (CASE ListOfBlocked
                             WHEN '0' THEN
                              ''
                             ELSE
                              ListOfBlocked || chr(10) --|| 'Блокировано - '||ListOfBlocked
                           END) || CASE
                             WHEN p_is_holder = 0 THEN
                              rec.cl_name
                             ELSE
                              v_nin
                           END || ' Блокировано - ' || round8(rec.amt) ||
                           '. Основание блокирования: ' || rec.block_reason;
        END IF;
      END LOOP;
    END;
    IF ListOfBlocked = '0' THEN
      RETURN ' ';
    ELSE
      RETURN(ListOfBlocked);
    END IF;
  END;

  -- Кол-во голосующих ЦБ
  FUNCTION volOfVotedSimpleByAcc(acc_id   NUMBER,
                                 date_qry DATE,
                                 nin      VARCHAR2 := NULL) RETURN NUMBER IS
    vol NUMBER;
  BEGIN
  
    SELECT SUM(c3.c3_amount)
      INTO vol
      FROM d_c3_positions_h c3
      JOIN d_b1_assets_h b1
        ON (b1.b1_id = c3.c3_asset)
     WHERE c3.c3_account = acc_id
       AND c3.c3_amount != 0
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2)
          
       AND c3.c3_asset = b1.b1_id
       AND (b1.b1_nin = nin OR nin IS NULL)
       AND b1.b1_as_type = '01'
       AND b1.b1_vote = 1
       AND b1.status_hist IN (1, 2)
       AND b1.date_modified <= date_qry
       AND b1.date_end > date_qry
    
    ;
  
    RETURN nvl(vol, 0);
  
  END;

  -- Кол-во акций на лицевом счете
  FUNCTION volOfShares(acc_id   NUMBER,
                       date_qry DATE,
                       cb_type  VARCHAR2,
                       nin      VARCHAR2 := NULL) RETURN NUMBER IS
    vol NUMBER;
  BEGIN
    SELECT SUM(c3.c3_amount * (CASE
                 WHEN nvl(a2.a2_acc_type, 0) = 7 THEN
                  -1
                 ELSE
                  1
               END))
      INTO vol
      FROM d_c3_positions_h c3
      JOIN d_b1_assets_h b1
        ON (b1.b1_id = c3.c3_asset)
      LEFT JOIN d_a2_accounts a2
        ON (a2.a2_id = c3.c3_account)
     WHERE c3.c3_account = acc_id
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2)
          
       AND b1.b1_as_type IN ((SELECT *
                               FROM THE (SELECT CAST(r_table.list_to_table_varchar(cb_type,
                                                                                   ',') AS
                                                     tbl_varchar)
                                           FROM dual)))
       AND c3.c3_asset = b1.b1_id
       AND (b1.b1_nin = nin OR nin IS NULL)
       AND b1.status_hist IN (1, 2)
       AND b1.date_modified <= date_qry
       AND b1.date_end > date_qry;
  
    RETURN(nvl(vol, 0));
  
  END;

  -- Общее количество ЦБ на лицевом счете
  FUNCTION volOfAllSecurities(acc_id   NUMBER,
                              date_qry DATE,
                              nin      VARCHAR2 := NULL) RETURN NUMBER IS
    vol NUMBER;
    --type_list varchar2(1000);
  BEGIN
  
    SELECT SUM(c3.c3_amount * (CASE
                 WHEN nvl(a2.a2_acc_type, 0) = 7 THEN
                  -1
                 ELSE
                  1
               END))
      INTO vol
      FROM d_c3_positions_h c3
      JOIN d_b1_assets_h b1
        ON (b1.b1_id = c3.c3_asset)
      LEFT JOIN d_a2_accounts a2
        ON (a2.a2_id = c3.c3_account)
     WHERE c3.c3_account = acc_id
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2)
          --and b1.b1_as_type IN ((select * from THE (select cast(r_table.list_to_table_varchar(cb_type, ',') as tbl_varchar) from dual)))
       AND c3.c3_asset = b1.b1_id
       AND (b1.b1_nin = nin OR nin IS NULL)
       AND b1.status_hist IN (1, 2)
       AND b1.date_modified <= date_qry
       AND b1.date_end > date_qry;
  
    RETURN nvl(vol, 0);
  
  END;

  FUNCTION volOfAllShares(acc_id   NUMBER,
                          date_qry DATE,
                          nin      VARCHAR2 := NULL) RETURN NUMBER IS
    vol NUMBER;
  BEGIN
    vol := volOfShares(acc_id, date_qry, '01,02', nin);
    RETURN(nvl(vol, 0));
  END;

  FUNCTION volOfSimpleShares(acc_id   NUMBER,
                             date_qry DATE,
                             nin      VARCHAR2 := NULL) RETURN NUMBER IS
    vol NUMBER;
  BEGIN
    vol := volOfShares(acc_id, date_qry, '01', nin);
    RETURN(nvl(vol, 0));
  END;

  FUNCTION volOfPrefShares(acc_id   NUMBER,
                           date_qry DATE,
                           nin      VARCHAR2 := NULL) RETURN NUMBER IS
    vol NUMBER;
  BEGIN
    vol := volOfShares(acc_id, date_qry, '02', nin);
    RETURN(nvl(vol, 0));
  END;

  -- Кол-во в обременении по счету

  FUNCTION volOfEncumbrance(acc_id     NUMBER,
                            date_qry   DATE,
                            p_asset_id NUMBER := NULL) RETURN NUMBER IS
    res NUMBER;
  BEGIN
  
    res := VolOfZalogUprBlock(i_type   => 'ZALOG',
                              acc_id   => acc_id,
                              date_qry => date_qry,
                              asset_id => p_asset_id);
  
    RETURN res;
  END;

  -- Кол-во в обременении
  FUNCTION volOfEncumbranceT(acc_id     NUMBER,
                             date_qry   DATE,
                             p_asset_id NUMBER := NULL) RETURN NUMBER IS
    res NUMBER;
  BEGIN
  
    res := VolOfZalogUprBlockT(i_type   => 'ZALOG',
                               acc_id   => acc_id,
                               date_qry => date_qry,
                               asset_id => p_asset_id);
  
    RETURN res;
  END;

  -- Кол-во блокированных ЦБ на счете
  FUNCTION volOfBlockedSecurities(acc_id   NUMBER,
                                  date_qry DATE,
                                  nin      VARCHAR2 := NULL) RETURN NUMBER IS
    volOfBlocked NUMBER;
    p_b1_id      NUMBER;
    i            NUMBER;
  BEGIN
  
    IF nin IS NOT NULL THEN
      SELECT b1_id
        INTO p_b1_id
        FROM d_b1_assets_h b1
       WHERE b1.b1_nin = nin
         AND b1.date_modified <= date_qry
         AND b1.date_end > date_qry
         AND b1.status_hist IN (1, 2);
    END IF;
  
    SELECT COUNT(*)
      INTO i
      FROM d_c3_positions_h c3
     WHERE c3.c3_account = acc_id
       AND (c3.c3_asset = p_b1_id OR p_b1_id IS NULL)
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2)
       AND c3.c3_type = 'BLOCK';
  
    IF i = 0 THEN
      RETURN 0;
    END IF;
  
    SELECT SUM(c3.c3_amount)
      INTO volOfBlocked
      FROM d_c3_positions_h c3
     WHERE c3.c3_account = acc_id
       AND (c3.c3_asset = p_b1_id OR p_b1_id IS NULL)
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2)
       AND c3.c3_type = 'BLOCK';
  
    RETURN nvl(volOfBlocked, 0);
  END;

  -- Кол-во блокированных ЦБ на счете
  FUNCTION volOfBlockedSecuritiesT(acc_id     NUMBER := NULL,
                                   date_qry   DATE,
                                   p_asset_id NUMBER := NULL) RETURN NUMBER IS
    volOfBlocked NUMBER;
    p_b1_id      NUMBER;
    i            NUMBER;
  BEGIN
  
    /* SELECT count(*)
      INTO i
      FROM d_c3_positions_h_t_block c3
     WHERE (c3.c3_account = acc_id or acc_id is null)
       AND (c3.c3_asset = p_asset_id OR p_asset_id IS NULL)
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2)
       AND c3.c3_type = 'BLOCK';
    
    if i = 0 then
      return 0;
    end if;*/
  
    SELECT SUM(c3.c3_amount)
      INTO volOfBlocked
      FROM d_c3_positions_h_t_block c3
     WHERE (c3.c3_account = acc_id OR acc_id IS NULL)
       AND (c3.c3_asset = p_asset_id OR p_asset_id IS NULL)
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2)
       AND c3.c3_type = 'BLOCK'
       AND c3.c3_account NOT IN
           (SELECT a2_id FROM d_a2_accounts WHERE a2_acc_type IN (4, 6));
  
    -- volOfBlocked :=
    --VolOfZalogUprBlockT(i_type => 'BLOCK', acc_id => acc_id, date_qry => date_qry, asset_id => p_asset_id);
  
    RETURN(nvl(volOfBlocked, 0));
  END;

  FUNCTION VolOfManager(acc_id     NUMBER,
                        date_qry   DATE,
                        p_asset_id NUMBER := NULL) RETURN NUMBER AS
    res NUMBER;
  BEGIN
  
    res := VolOfZalogUprBlock(i_type   => 'DOV',
                              acc_id   => acc_id,
                              date_qry => date_qry,
                              asset_id => p_asset_id);
    RETURN(res);
  END;

  FUNCTION volOfManagerT(acc_id     NUMBER,
                         date_qry   DATE,
                         p_asset_id NUMBER := NULL) RETURN NUMBER IS
    vol     NUMBER;
    v_tbl   tbl_number := tbl_number();
    p_c3_id NUMBER;
    i       NUMBER;
  BEGIN
  
    --  return 1;
    IF acc_id IS NULL AND p_asset_id IS NULL THEN
      RETURN 0;
    END IF;
  
    IF date_qry IS NULL THEN
      RETURN 0;
    END IF;
  
    SELECT COUNT(*)
      INTO i
      FROM d_c3_positions_h_t z3
     WHERE 1 = 1
       AND z3.date_modified <= date_qry
       AND z3.date_end > date_qry
       AND z3.c3_account = acc_id
       AND z3.status_hist IN (1, 2)
       AND (z3.c3_asset = p_asset_id)
       AND z3.c3_type = 'UPR'
       AND z3.c3_client <> z3.c3_upr;
  
    IF i = 0 THEN
      RETURN 0;
    END IF;
  
    SELECT z3.c3_id
      INTO p_c3_id
      FROM d_c3_positions_h_t z3
     WHERE 1 = 1
       AND z3.date_modified <= date_qry
       AND z3.date_end > date_qry
       AND z3.c3_account = acc_id
       AND z3.status_hist IN (1, 2)
       AND (z3.c3_asset = p_asset_id)
       AND c3_type = 'UPR'
       AND c3_client = c3_upr;
  
    SELECT SUM(summa)
      INTO vol
      FROM (SELECT c3_subparent_id,
                   SYS_CONNECT_BY_PATH(c3_type, '/'),
                   CONNECT_BY_ISLEAF,
                   
                   (SELECT SUM(f.c3_amount)
                      FROM (SELECT *
                              FROM d_c3_positions_h_t f
                             WHERE f.date_modified <= date_qry
                               AND f.date_end > date_qry
                               AND f.c3_account = acc_id
                               AND f.status_hist IN (1, 2)
                               AND f.c3_asset = p_asset_id) f
                     START WITH f.c3_id = a.c3_id
                    CONNECT BY PRIOR f.c3_id = f.c3_subparent_id) AS summa,
                   a.*
              FROM (SELECT *
                      FROM d_c3_positions_h_t z3
                     WHERE 1 = 1
                       AND z3.date_modified <= date_qry
                       AND z3.date_end > date_qry
                       AND z3.c3_account = acc_id
                       AND z3.status_hist IN (1, 2)
                       AND (z3.c3_asset = p_asset_id)) a
             WHERE a.c3_type = 'UPR'
               AND a.c3_client <> a.c3_upr
             START WITH c3_id = p_c3_id
            CONNECT BY PRIOR c3_id = c3_subparent_id
            
            );
  
    RETURN nvl(vol, 0);
  END;

  -- Кол-во объявленных ЦБ
  FUNCTION volOfDeclaredSecurities(emitent_id NUMBER,
                                   date_qry   DATE,
                                   nin        VARCHAR2 := NULL) RETURN NUMBER IS
    vol NUMBER;
  BEGIN
  
    SELECT SUM(b1.b1_volume)
      INTO vol
      FROM d_b1_assets_h b1
     WHERE b1.b1_client = emitent_id
       AND b1.status_hist IN (1, 2)
       AND b1.date_modified <= date_qry
       AND b1.date_end > date_qry
       AND (b1.b1_nin = nin OR nin IS NULL)
       AND b1.b1_status IN ('OP', 'RS', 'US', 'BL', 'EXP');
  
    RETURN nvl(vol, 0);
  END;

  -- Кол-во объявленных акций
  FUNCTION volOfDeclaredShares(emitent_id NUMBER,
                               date_qry   DATE,
                               nin        VARCHAR2 := NULL) RETURN NUMBER IS
    vol NUMBER;
  BEGIN
    vol := 0;
  
    SELECT SUM(b1.b1_volume)
      INTO vol
      FROM d_b1_assets_h b1
     WHERE b1.b1_client = emitent_id
       AND b1.date_modified <= date_qry
       AND b1.date_end > date_qry
       AND b1.status_hist IN (1, 2)
       AND (b1.b1_nin = nin OR nin IS NULL)
       AND b1.b1_status IN ('OP', 'RS', 'US', 'BL')
       AND b1.b1_as_type IN ('01', '02');
  
    RETURN nvl(vol, 0);
  END;

  -- Кол-во объявленных простых акций
  FUNCTION volOfDeclaredSimpleShares(emitent_id NUMBER,
                                     date_qry   DATE,
                                     nin        VARCHAR2 := NULL)
    RETURN NUMBER IS
    vol NUMBER;
  BEGIN
  
    SELECT SUM(b1.b1_volume)
      INTO vol
      FROM d_b1_assets_h b1
     WHERE b1.b1_client = emitent_id
          --AND b1.b1_date_reg_emission <= date_qry
       AND b1.date_modified <= date_qry
       AND b1.date_end > date_qry
       AND b1.status_hist IN (1, 2)
       AND b1.b1_status IN ('OP', 'RS', 'US', 'BL')
       AND b1.b1_as_type = '01';
  
    RETURN(nvl(vol, 0));
  END;

  -- Кол-во объявленных привилегированных акций
  FUNCTION volOfDeclaredPrefShares(emitent_id NUMBER,
                                   date_qry   DATE,
                                   nin        VARCHAR2 := NULL) RETURN NUMBER IS
    vol NUMBER;
  BEGIN
    SELECT SUM(b1.b1_volume)
      INTO vol
      FROM d_b1_assets_h b1
     WHERE b1.b1_client = emitent_id
       AND b1.b1_status IN ('OP', 'RS', 'US', 'BL')
       AND b1.date_modified <= date_qry
       AND b1.date_end > date_qry
       AND b1.status_hist IN (1, 2)
       AND (b1.b1_nin = nin OR nin IS NULL)
       AND b1.b1_as_type = '02';
  
    RETURN(nvl(vol, 0));
  END;

  -- Количество выкупленных ЦБ эмитента
  FUNCTION volOfReacquiredSecurities(emitent_id NUMBER,
                                     date_qry   DATE,
                                     nin        VARCHAR2 := NULL)
    RETURN NUMBER IS
    vol    NUMBER;
    vol_cd NUMBER;
  BEGIN
  
    SELECT SUM(c3.c3_amount)
      INTO vol
      FROM d_a2_accounts a2
      JOIN d_c3_positions_h c3
        ON (c3.c3_account = a2.a2_id)
     WHERE a2.a2_client = emitent_id
       AND a2.a2_acc_type IN 6
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2)
       AND c3.c3_asset IN (SELECT b1.b1_id
                             FROM d_b1_assets_h b1
                            WHERE b1.b1_client = emitent_id
                              AND (b1.b1_nin = nin OR nin IS NULL)
                              AND b1.date_modified <= date_qry
                              AND b1.date_end > date_qry
                              AND b1.status_hist IN (1, 2));
  
    IF g_refer IS NOT NULL THEN
      SELECT SUM(s.bght)
        INTO vol_cd
        FROM fa_shareholders_sec s
       WHERE s.refer_ = g_refer
         AND (s.isin = nin OR nin IS NULL);
    ELSE
    
      SELECT SUM(b.TOTAL_)
        INTO vol_cd
        FROM V_FA_EMITENT_SUB_ACC_BALANCE b
        JOIN d_a2_accounts a2
          ON (a2.a2_id = b.account_id)
       WHERE a2.a2_client = emitent_id
         AND b.asset IN (SELECT b1.b1_id
                           FROM d_b1_assets_h b1
                          WHERE b1.b1_client = emitent_id
                            AND (b1.b1_nin = nin OR nin IS NULL)
                            AND b1.date_modified <= date_qry
                            AND b1.date_end > date_qry
                            AND b1.status_hist IN (1, 2))
         AND b.kind = 3
         AND b.rep_date_ = (SELECT MAX(rep_date_)
                              FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                   FA_EMITENT_SUB_ACC_BALANCE_D c2
                             WHERE c2.isin = nin
                               AND c.rep_date_ <= date_qry
                               AND c2.KIND = 3
                               AND c.refer_ = c2.refer_)
         AND b.refer_ = (SELECT MAX(c2.refer_)
                           FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                FA_EMITENT_SUB_ACC_BALANCE_D c2
                          WHERE c2.isin = nin
                            AND c.rep_date_ <= date_qry
                            AND c2.KIND = 3
                            AND c.refer_ = c2.refer_);
    END IF;
  
    RETURN nvl(vol, 0) + nvl(vol_cd, 0);
  END;

  -- Количество выкупленных ЦБ эмитента в ЦД
  FUNCTION volOfReacquiredSecuritiesCD(emitent_id NUMBER,
                                       date_qry   DATE,
                                       nin        VARCHAR2 := NULL,
                                       cb_type    VARCHAR2 := NULL)
    RETURN NUMBER IS
    vol   NUMBER;
    v_nin VARCHAR2(256);
  BEGIN
  
    vol := 0;
  
    IF g_refer IS NOT NULL THEN
      SELECT nvl(SUM(s.bght), 0)
        INTO vol
        FROM fa_shareholders_sec s
       WHERE s.refer_ = g_refer
         AND s.isin IN (SELECT b1_nin
                          FROM d_b1_assets_h a
                         WHERE (a.b1_nin = nin OR nin IS NULL)
                           AND (a.b1_as_type IN
                               (SELECT column_value
                                   FROM TABLE(cfg_utils.in_list(cb_type))) OR
                               cb_type IS NULL)
                           AND a.date_modified <= date_qry
                           AND a.date_end > date_qry);
    
      IF nin IS NULL THEN
        SELECT bv_listagg(b1_nin)
          INTO v_nin
          FROM d_b1_assets_h h
         WHERE b1_client = emitent_id
           AND b1_as_type IN ('01', '02')
           AND ((b1_as_type IN ('01', '02') AND cb_type IS NULL) OR
               (h.b1_as_type IN
               (SELECT column_value FROM TABLE(cfg_utils.in_list(cb_type))) AND
               cb_type IS NOT NULL))
           AND h.date_modified <= date_qry
           AND h.date_end > date_qry
           AND h.b1_nin NOT IN (SELECT s.isin
                                  FROM fa_shareholders_sec s
                                 WHERE s.refer_ = g_refer);
      
        FOR rec IN (SELECT column_value AS nin_
                      FROM TABLE(cfg_utils.in_list(v_nin))) LOOP
          SELECT nvl(SUM(b.TOTAL_), 0) + vol
            INTO vol
            FROM V_FA_EMITENT_SUB_ACC_BALANCE b
            JOIN d_a2_accounts a2
              ON (a2.a2_id = b.account_id)
           WHERE a2.a2_client = emitent_id
             AND b.asset IN (SELECT b1.b1_id
                               FROM d_b1_assets_h b1
                              WHERE b1.b1_client = emitent_id
                                AND (b1.b1_nin = rec.nin_)
                                AND b1.date_modified <= date_qry
                                AND b1.date_end > date_qry
                                AND b1.status_hist IN (1, 2))
             AND b.kind = 3
             AND b.rep_date_ = (SELECT MAX(rep_date_)
                                  FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                       FA_EMITENT_SUB_ACC_BALANCE_D c2
                                 WHERE c2.isin = rec.nin_
                                   AND c.rep_date_ <= date_qry
                                   AND c2.KIND = 3
                                   AND c.refer_ = c2.refer_)
             AND b.refer_ = (SELECT MAX(c2.refer_)
                               FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                    FA_EMITENT_SUB_ACC_BALANCE_D c2
                              WHERE c2.isin = rec.nin_
                                AND c.rep_date_ <= date_qry
                                AND c2.KIND = 3
                                AND c.refer_ = c2.refer_);
        END LOOP;
      END IF;
    
    ELSE
    
      IF nin IS NULL THEN
        SELECT bv_listagg(b1_nin)
          INTO v_nin
          FROM d_b1_assets_h h
         WHERE b1_client = emitent_id
           AND b1_as_type IN ('01', '02')
           AND h.date_modified <= date_qry
           AND h.date_end > date_qry;
      
        FOR rec IN (SELECT column_value AS nin_
                      FROM TABLE(cfg_utils.in_list(v_nin))) LOOP
          SELECT nvl(SUM(b.TOTAL_), 0) + vol
            INTO vol
            FROM V_FA_EMITENT_SUB_ACC_BALANCE b
            JOIN d_a2_accounts a2
              ON (a2.a2_id = b.account_id)
           WHERE a2.a2_client = emitent_id
             AND b.asset IN (SELECT b1.b1_id
                               FROM d_b1_assets_h b1
                              WHERE b1.b1_client = emitent_id
                                AND (b1.b1_nin = rec.nin_)
                                AND (b1.b1_as_type IN
                                    (SELECT column_value
                                        FROM TABLE(cfg_utils.in_list(cb_type))) OR
                                    cb_type IS NULL)
                                AND b1.date_modified <= date_qry
                                AND b1.date_end > date_qry
                                AND b1.status_hist IN (1, 2))
             AND b.kind = 3
             AND b.rep_date_ = (SELECT MAX(rep_date_)
                                  FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                       FA_EMITENT_SUB_ACC_BALANCE_D c2
                                 WHERE c2.isin = rec.nin_
                                   AND c.rep_date_ <= date_qry
                                   AND c2.KIND = 3
                                   AND c.refer_ = c2.refer_)
             AND b.refer_ = (SELECT MAX(c2.refer_)
                               FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                    FA_EMITENT_SUB_ACC_BALANCE_D c2
                              WHERE c2.isin = rec.nin_
                                AND c.rep_date_ <= date_qry
                                AND c2.KIND = 3
                                AND c.refer_ = c2.refer_);
        END LOOP;
      ELSE
        FOR rec IN (SELECT column_value AS nin_
                      FROM TABLE(cfg_utils.in_list(nin))) LOOP
        
          SELECT nvl(SUM(b.TOTAL_), 0) + vol
            INTO vol
            FROM V_FA_EMITENT_SUB_ACC_BALANCE b
            JOIN d_a2_accounts a2
              ON (a2.a2_id = b.account_id)
           WHERE a2.a2_client = emitent_id
             AND b.asset IN (SELECT b1.b1_id
                               FROM d_b1_assets_h b1
                              WHERE b1.b1_client = emitent_id
                                AND (b1.b1_nin = rec.nin_ /* OR nin IS NULL*/
                                    )
                                AND (b1.b1_as_type IN
                                    (SELECT column_value
                                        FROM TABLE(cfg_utils.in_list(cb_type))) OR
                                    cb_type IS NULL)
                                AND b1.date_modified <= date_qry
                                AND b1.date_end > date_qry
                                AND b1.status_hist IN (1, 2))
             AND b.kind = 3
             AND b.rep_date_ = (SELECT MAX(rep_date_)
                                  FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                       FA_EMITENT_SUB_ACC_BALANCE_D c2
                                 WHERE c2.isin = rec.nin_
                                   AND c.rep_date_ <= date_qry
                                   AND c2.KIND = 3
                                   AND c.refer_ = c2.refer_)
             AND b.refer_ = (SELECT MAX(c2.refer_)
                               FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                    FA_EMITENT_SUB_ACC_BALANCE_D c2
                              WHERE c2.isin = rec.nin_
                                AND c.rep_date_ <= date_qry
                                AND c2.KIND = 3
                                AND c.refer_ = c2.refer_);
        
        END LOOP;
      END IF;
    END IF;
  
    IF v_is_cd = 0 THEN
      --взять с самого сообщения, сравнить и уведомить в случае необходимости
      RETURN(nvl(vol, 0));
    ELSE
      RETURN 0;
    END IF;
  
  END;

  -- Количество объявленных ЦБ эмитента в ЦД
  FUNCTION volOfDeclaredSecuritiesCD(emitent_id NUMBER,
                                     date_qry   DATE,
                                     nin        VARCHAR2 := NULL,
                                     cb_type    VARCHAR2 := NULL,
                                     p_refer    VARCHAR2 := NULL)
    RETURN NUMBER IS
    vol   NUMBER;
    v_nin VARCHAR2(256);
  BEGIN
  
    vol := 0;
  
    IF p_refer IS NOT NULL THEN
      g_refer := p_refer;
    END IF;
  
    IF g_refer IS NOT NULL THEN
      SELECT NVL(SUM(s.decl), 0)
        INTO vol
        FROM fa_shareholders_sec s
       WHERE s.refer_ = g_refer
         AND s.isin IN (SELECT b1_nin
                          FROM d_b1_assets_h a
                         WHERE (a.b1_nin = nin OR nin IS NULL)
                           AND (a.b1_as_type IN
                               (SELECT column_value
                                   FROM TABLE(cfg_utils.in_list(cb_type))) OR
                               cb_type IS NULL)
                           AND a.date_modified <= date_qry
                           AND a.date_end > date_qry);
    
      IF nin IS NULL THEN
      
        SELECT bv_listagg(b1_nin)
          INTO v_nin
          FROM d_b1_assets_h h
         WHERE b1_client = emitent_id
           AND b1_as_type IN ('01', '02')
           AND h.date_modified <= date_qry
           AND h.date_end > date_qry
           AND h.b1_nin NOT IN (SELECT s.isin
                                  FROM fa_shareholders_sec s
                                 WHERE s.refer_ = g_refer);
      
        FOR rec IN (SELECT column_value AS nin_
                      FROM TABLE(cfg_utils.in_list(v_nin))) LOOP
        
          SELECT nvl(SUM(b.TOTAL_), 0) + vol
            INTO vol
            FROM V_FA_EMITENT_SUB_ACC_BALANCE b
            JOIN d_a2_accounts a2
              ON (a2.a2_id = b.account_id)
           WHERE a2.a2_client = emitent_id
             AND b.asset IN (SELECT b1.b1_id
                               FROM d_b1_assets_h b1
                              WHERE b1.b1_client = emitent_id
                                AND (b1.b1_nin = rec.nin_ /* OR nin IS NULL*/
                                    )
                                AND b1.date_modified <= date_qry
                                AND b1.date_end > date_qry
                                AND b1.status_hist IN (1, 2))
             AND b.kind = 2
             AND b.rep_date_ = (SELECT MAX(rep_date_)
                                  FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                       FA_EMITENT_SUB_ACC_BALANCE_D c2
                                 WHERE c2.isin = rec.nin_
                                   AND c.rep_date_ <= date_qry
                                   AND c2.KIND = 2
                                   AND c.refer_ = c2.refer_)
             AND b.refer_ = (SELECT MAX(c2.refer_)
                               FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                    FA_EMITENT_SUB_ACC_BALANCE_D c2
                              WHERE c2.isin = rec.nin_
                                AND c.rep_date_ <= date_qry
                                AND c2.KIND = 3
                                AND c.refer_ = c2.refer_);
        END LOOP;
      
      END IF;
    
    ELSE
    
      IF nin IS NULL THEN
      
        SELECT nvl(SUM(b.TOTAL_), 0)
          INTO vol
          FROM V_FA_EMITENT_SUB_ACC_BALANCE b
          JOIN d_a2_accounts a2
            ON (a2.a2_id = b.account_id)
         WHERE a2.a2_client = emitent_id
           AND b.asset IN (SELECT b1.b1_id
                             FROM d_b1_assets_h b1
                            WHERE b1.b1_client = emitent_id
                              AND (b1.b1_nin = nin OR nin IS NULL)
                              AND (b1.b1_as_type IN
                                  (SELECT column_value
                                      FROM TABLE(cfg_utils.in_list(cb_type))) OR
                                  cb_type IS NULL)
                              AND b1.date_modified <= date_qry
                              AND b1.date_end > date_qry
                              AND b1.status_hist IN (1, 2))
           AND b.kind = 2
           AND b.rep_date_ = (SELECT MAX(rep_date_)
                                FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                     FA_EMITENT_SUB_ACC_BALANCE_D c2
                               WHERE c2.asset = b.ASSET --c2.isin = nin
                                 AND c.rep_date_ <= date_qry
                                 AND c2.KIND = 2
                                 AND c.refer_ = c2.refer_)
           AND b.refer_ = (SELECT MAX(c2.refer_)
                             FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                  FA_EMITENT_SUB_ACC_BALANCE_D c2
                            WHERE c2.asset = b.ASSET --c2.isin = nin
                              AND c.rep_date_ <= date_qry
                              AND c2.KIND = 3
                              AND c.refer_ = c2.refer_);
      
      ELSE
        FOR rec IN (SELECT column_value AS nin_
                      FROM TABLE(cfg_utils.in_list(nin))) LOOP
        
          SELECT nvl(SUM(b.TOTAL_), 0)
            INTO vol
            FROM V_FA_EMITENT_SUB_ACC_BALANCE b
            JOIN d_a2_accounts a2
              ON (a2.a2_id = b.account_id)
           WHERE a2.a2_client = emitent_id
             AND b.asset IN (SELECT b1.b1_id
                               FROM d_b1_assets_h b1
                              WHERE b1.b1_client = emitent_id
                                AND (b1.b1_nin = rec.nin_ /* OR nin IS NULL*/
                                    )
                                AND (b1.b1_as_type IN
                                    (SELECT column_value
                                        FROM TABLE(cfg_utils.in_list(cb_type))) OR
                                    cb_type IS NULL)
                                AND b1.date_modified <= date_qry
                                AND b1.date_end > date_qry
                                AND b1.status_hist IN (1, 2))
             AND b.kind = 2
             AND b.rep_date_ = (SELECT MAX(rep_date_)
                                  FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                       FA_EMITENT_SUB_ACC_BALANCE_D c2
                                 WHERE c2.isin = rec.nin_
                                   AND c.rep_date_ <= date_qry
                                   AND c2.KIND = 2
                                   AND c.refer_ = c2.refer_)
             AND b.refer_ = (SELECT MAX(c2.refer_)
                               FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                    FA_EMITENT_SUB_ACC_BALANCE_D c2
                              WHERE c2.isin = rec.nin_
                                AND c.rep_date_ <= date_qry
                                AND c2.KIND = 3
                                AND c.refer_ = c2.refer_);
        END LOOP;
      END IF;
    END IF;
  
    IF v_is_cd = 0 THEN
      RETURN(nvl(vol, 0));
    ELSE
      RETURN 0;
    END IF;
  END;

  -- Кол-во выкупленных акций эмитента
  FUNCTION volOfReacquiredShares(emitent_id NUMBER,
                                 date_qry   DATE,
                                 nin        VARCHAR2 := NULL) RETURN NUMBER IS
    vol    NUMBER;
    vol_cd NUMBER;
    v_nin  VARCHAR2(60);
  BEGIN
  
    vol_cd := 0;
  
    SELECT /*+INDEX (c3 D_C3_ACC_ASS_TYP)*/
     SUM(c3.c3_amount) --+ sum(d.total_)
      INTO vol
      FROM d_a2_accounts a2
      JOIN d_c3_positions_h c3
        ON (c3.c3_account = a2.a2_id)
     WHERE a2.a2_client = emitent_id
       AND a2.a2_acc_type = 6 -- счет выкупленных ЦБ
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2)
       AND c3.c3_asset IN (SELECT b1.b1_id
                             FROM d_b1_assets_h b1
                            WHERE b1.b1_client = emitent_id
                              AND (b1.b1_nin = nin OR nin IS NULL)
                              AND b1.b1_as_type IN ('01', '02')
                              AND b1.date_modified <= date_qry
                              AND b1.date_end > date_qry
                              AND b1.status_hist IN (1, 2));
  
    IF g_refer IS NOT NULL THEN
      SELECT SUM(s.bght)
        INTO vol_cd
        FROM fa_shareholders_sec s
       WHERE s.refer_ = g_refer
         AND s.isin IN (SELECT b1_nin
                          FROM d_b1_assets a
                         WHERE (a.b1_nin = nin OR nin IS NULL)
                           AND a.b1_as_type IN ('01', '02'));
    
      IF nin IS NULL THEN
        SELECT bv_listagg(b1_nin)
          INTO v_nin
          FROM d_b1_assets
         WHERE b1_client = emitent_id
           AND b1_as_type IN ('01', '02')
           AND b1_nin NOT IN (SELECT s.isin
                                FROM fa_shareholders_sec s
                               WHERE s.refer_ = g_refer);
      
        FOR rec IN (SELECT column_value AS nin_
                      FROM TABLE(cfg_utils.in_list(v_nin))) LOOP
        
          SELECT nvl(SUM(b.TOTAL_), 0) + vol_cd
            INTO vol_cd
            FROM V_FA_EMITENT_SUB_ACC_BALANCE b
            JOIN d_a2_accounts a2
              ON (a2.a2_id = b.account_id)
           WHERE a2.a2_client = emitent_id
             AND b.asset IN (SELECT b1.b1_id
                               FROM d_b1_assets_h b1
                              WHERE b1.b1_client = emitent_id
                                AND (b1.b1_nin = rec.nin_ /* OR nin IS NULL*/
                                    )
                                   
                                AND b1.date_modified <= date_qry
                                AND b1.date_end > date_qry
                                AND b1.status_hist IN (1, 2))
             AND b.kind = 3
             AND b.rep_date_ = (SELECT MAX(rep_date_)
                                  FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                       FA_EMITENT_SUB_ACC_BALANCE_D c2
                                 WHERE c2.isin = rec.nin_
                                   AND c.rep_date_ <= date_qry
                                   AND c2.KIND = 3
                                   AND c.refer_ = c2.refer_)
             AND b.refer_ = (SELECT MAX(c2.refer_)
                               FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                    FA_EMITENT_SUB_ACC_BALANCE_D c2
                              WHERE c2.isin = rec.nin_
                                AND c.rep_date_ <= date_qry
                                AND c2.KIND = 3
                                AND c.refer_ = c2.refer_);
        
        END LOOP;
      END IF;
    
    ELSE
    
      IF nin IS NULL THEN
        SELECT bv_listagg(b1_nin)
          INTO v_nin
          FROM d_b1_assets
         WHERE b1_client = emitent_id
           AND b1_as_type IN ('01', '02');
      
        FOR rec IN (SELECT column_value AS nin_
                      FROM TABLE(cfg_utils.in_list(v_nin))) LOOP
        
          SELECT nvl(SUM(b.TOTAL_), 0) + vol_cd
            INTO vol_cd
            FROM V_FA_EMITENT_SUB_ACC_BALANCE b
            JOIN d_a2_accounts a2
              ON (a2.a2_id = b.account_id)
           WHERE a2.a2_client = emitent_id
             AND b.asset IN (SELECT b1.b1_id
                               FROM d_b1_assets_h b1
                              WHERE b1.b1_client = emitent_id
                                AND (b1.b1_nin = rec.nin_ /* OR nin IS NULL*/
                                    )
                                   
                                AND b1.date_modified <= date_qry
                                AND b1.date_end > date_qry
                                AND b1.status_hist IN (1, 2))
             AND b.kind = 3
             AND b.rep_date_ = (SELECT MAX(rep_date_)
                                  FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                       FA_EMITENT_SUB_ACC_BALANCE_D c2
                                 WHERE c2.isin = rec.nin_
                                   AND c.rep_date_ <= date_qry
                                   AND c2.KIND = 3
                                   AND c.refer_ = c2.refer_)
             AND b.refer_ = (SELECT MAX(c2.refer_)
                               FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                    FA_EMITENT_SUB_ACC_BALANCE_D c2
                              WHERE c2.isin = rec.nin_
                                AND c.rep_date_ <= date_qry
                                AND c2.KIND = 3
                                AND c.refer_ = c2.refer_);
        
        END LOOP;
      ELSE
      
        SELECT SUM(b.TOTAL_)
          INTO vol_cd
          FROM V_FA_EMITENT_SUB_ACC_BALANCE b
          JOIN d_a2_accounts a2
            ON (a2.a2_id = b.account_id)
         WHERE a2.a2_client = emitent_id
           AND b.asset IN (SELECT b1.b1_id
                             FROM d_b1_assets_h b1
                            WHERE b1.b1_client = emitent_id
                              AND (b1.b1_nin = nin OR nin IS NULL)
                              AND b1.b1_as_type IN ('01', '02')
                              AND b1.status_hist IN (1, 2)
                              AND b1.date_modified <= date_qry
                              AND b1.date_end > date_qry
                           
                           )
           AND b.kind = 3
           AND b.rep_date_ = (SELECT MAX(rep_date_)
                                FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                     FA_EMITENT_SUB_ACC_BALANCE_D c2
                               WHERE c2.isin = nin
                                 AND c.rep_date_ <= date_qry
                                 AND c2.KIND = 3
                                 AND c.refer_ = c2.refer_)
           AND b.refer_ = (SELECT MAX(c2.refer_)
                             FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                  FA_EMITENT_SUB_ACC_BALANCE_D c2
                            WHERE c2.isin = nin
                              AND c.rep_date_ <= date_qry
                              AND c2.KIND = 3
                              AND c.refer_ = c2.refer_);
      
      END IF;
    
    END IF;
  
    RETURN nvl(vol, 0) + nvl(vol_cd, 0);
  END;

  -- Кол-во выкупленных простых акций эмитента
  FUNCTION volOfReacquiredSimpleShares(emitent_id NUMBER,
                                       date_qry   DATE,
                                       nin        VARCHAR2 := NULL)
    RETURN NUMBER IS
    vol    NUMBER;
    vol_cd NUMBER;
    v_nin  VARCHAR2(16);
    vCount NUMBER;
  BEGIN
  
    vol_cd := 0;
  
    SELECT /*+INDEX (c3 D_C3_ACC_ASS_TYP)*/
     SUM(c3.c3_amount) --+ sum(d.total_)
      INTO vol
      FROM d_a2_accounts a2
      JOIN d_c3_positions_h c3
        ON (c3.c3_account = a2.a2_id)
     WHERE a2.a2_client = emitent_id
       AND a2.a2_acc_type = 6 -- счет выкупленных ЦБ
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2)
       AND c3.c3_asset IN (SELECT b1.b1_id
                             FROM d_b1_assets_h b1
                           --join D_S18_ASSET_TYPE s18 on (s18.s18_code = b1.b1_as_type)
                            WHERE b1.b1_client = emitent_id
                              AND (b1.b1_nin = nin OR nin IS NULL)
                              AND b1.b1_as_type = '01'
                              AND b1.status_hist IN (1, 2)
                              AND b1.date_modified <= date_qry
                              AND b1.date_end > date_qry);
  
    SELECT COUNT(*)
      INTO vCount
      FROM fa_shareholders_sec s
     WHERE s.refer_ = g_refer
       AND s.isin IN (SELECT b1_nin
                        FROM d_b1_assets a
                       WHERE (a.b1_nin = nin OR nin IS NULL)
                         AND a.b1_as_type = '01');
  
    IF g_refer IS NOT NULL AND vCount > 0 THEN
      SELECT SUM(s.bght)
        INTO vol_cd
        FROM fa_shareholders_sec s
       WHERE s.refer_ = g_refer
         AND s.isin IN (SELECT b1_nin
                          FROM d_b1_assets a
                         WHERE (a.b1_nin = nin OR nin IS NULL)
                           AND a.b1_as_type = '01');
    
    ELSE
    
      FOR rec IN (SELECT b1_nin
                    FROM d_b1_assets
                   WHERE b1_client = emitent_id
                     AND b1_as_type = '01') LOOP
      
        SELECT nvl(SUM(b.TOTAL_), 0) + vol_cd
          INTO vol_cd
          FROM V_FA_EMITENT_SUB_ACC_BALANCE b
          JOIN d_a2_accounts a2
            ON (a2.a2_id = b.account_id)
         WHERE a2.a2_client = emitent_id
           AND b.asset IN (SELECT b1.b1_id
                             FROM d_b1_assets_h b1
                            WHERE b1.b1_client = emitent_id
                              AND (b1.b1_nin = rec.b1_nin)
                              AND b1.b1_as_type = '01'
                              AND b1.status_hist IN (1, 2)
                              AND b1.date_modified <= date_qry
                              AND b1.date_end > date_qry)
           AND b.kind = 3
           AND b.rep_date_ = (SELECT MAX(rep_date_)
                                FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                     FA_EMITENT_SUB_ACC_BALANCE_D c2
                               WHERE c2.isin = rec.b1_nin
                                 AND c.rep_date_ <= date_qry
                                 AND c2.KIND = 3
                                 AND c.refer_ = c2.refer_)
           AND b.refer_ = (SELECT MAX(c2.refer_)
                             FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                  FA_EMITENT_SUB_ACC_BALANCE_D c2
                            WHERE c2.isin = rec.b1_nin
                              AND c.rep_date_ <= date_qry
                              AND c2.KIND = 3
                              AND c.refer_ = c2.refer_);
      END LOOP;
    END IF;
    IF v_is_cd = 1 THEN
      vol_cd := 0;
    END IF;
    RETURN nvl(vol, 0) + nvl(vol_cd, 0);
  END;

  -- Кол-во выкупленных привилегированных акций эмитента
  FUNCTION volOfReacquiredPrefShares(emitent_id NUMBER,
                                     date_qry   DATE,
                                     nin        VARCHAR2 := NULL)
    RETURN NUMBER IS
    vol    NUMBER;
    vol_cd NUMBER;
    v_nin  VARCHAR2(16);
    vCount NUMBER;
  BEGIN
    SELECT SUM(c3.c3_amount) --+ sum(d.total_)
      INTO vol
      FROM d_a2_accounts a2
      JOIN d_c3_positions_h c3
        ON (c3.c3_account = a2.a2_id)
     WHERE a2.a2_client = emitent_id
       AND a2.a2_acc_type = 6 -- счет выкупленных ЦБ
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2)
          
       AND c3.c3_asset IN (SELECT b1.b1_id
                             FROM d_b1_assets_h b1
                           --join D_S18_ASSET_TYPE s18 on (s18.s18_code = b1.b1_as_type)
                            WHERE b1.b1_client = emitent_id
                              AND (b1.b1_nin = nin OR nin IS NULL)
                              AND b1.b1_as_type = '02'
                              AND b1.status_hist IN (1, 2)
                              AND b1.date_modified <= date_qry
                              AND b1.date_end > date_qry
                           
                           ); -- префы
  
    SELECT COUNT(*)
      INTO vCount
      FROM fa_shareholders_sec s
     WHERE s.refer_ = g_refer
       AND s.isin IN (SELECT b1_nin
                        FROM d_b1_assets a
                       WHERE (a.b1_nin = nin OR nin IS NULL)
                         AND a.b1_as_type = '02');
  
    IF g_refer IS NOT NULL AND vCount > 0 THEN
      SELECT SUM(s.bght)
        INTO vol_cd
        FROM fa_shareholders_sec s
       WHERE s.refer_ = g_refer
         AND s.isin IN (SELECT b1_nin
                          FROM d_b1_assets a
                         WHERE (a.b1_nin = nin OR nin IS NULL)
                           AND a.b1_as_type = '02');
    
    ELSE
    
      FOR rec IN (SELECT b1_nin
                    FROM d_b1_assets
                   WHERE b1_client = emitent_id
                     AND b1_as_type = '02') LOOP
      
        SELECT SUM(b.TOTAL_)
          INTO vol_cd
          FROM V_FA_EMITENT_SUB_ACC_BALANCE b
          JOIN d_a2_accounts a2
            ON (a2.a2_id = b.account_id)
         WHERE a2.a2_client = emitent_id
           AND b.asset IN (SELECT b1.b1_id
                             FROM d_b1_assets_h b1
                            WHERE b1.b1_client = emitent_id
                              AND (b1.b1_nin = rec.b1_nin)
                              AND b1.b1_as_type = '02'
                              AND b1.status_hist IN (1, 2)
                              AND b1.date_modified <= date_qry
                              AND b1.date_end > date_qry)
           AND b.kind = 3
           AND b.rep_date_ = (SELECT MAX(rep_date_)
                                FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                     FA_EMITENT_SUB_ACC_BALANCE_D c2
                               WHERE c2.isin = rec.b1_nin
                                 AND c.rep_date_ <= date_qry
                                 AND c2.KIND = 3
                                 AND c.refer_ = c2.refer_)
           AND b.refer_ = (SELECT MAX(c2.refer_)
                             FROM FA_EMITENT_SUB_ACC_BALANCE   c,
                                  FA_EMITENT_SUB_ACC_BALANCE_D c2
                            WHERE c2.isin = rec.b1_nin
                              AND c.rep_date_ <= date_qry
                              AND c2.KIND = 3
                              AND c.refer_ = c2.refer_);
      END LOOP;
    END IF;
  
    RETURN nvl(vol, 0) + nvl(vol_cd, 0);
  END;

  -- Кол-во обремененных размещенных ЦБ эмитента на дату
  FUNCTION volOfPlacedEncumbrance(emitent_id NUMBER,
                                  date_qry   DATE,
                                  nin        VARCHAR2 := NULL,
                                  p_cb_type  VARCHAR2 := NULL) RETURN NUMBER IS
    vol NUMBER;
  BEGIN
  
    vol := 0;
    DECLARE
    
      -- Список счет у которых есть ЗАлог, на дату по НИН
      CURSOR PlacedEncumbrance_cur IS
        SELECT DISTINCT a2.a2_id AS a2_id, c3.c3_asset
          FROM d_a2_accounts a2
          JOIN d_c3_positions_h c3
            ON (c3.c3_account = a2.a2_id)
         WHERE a2.a2_acc_type IN (1, 2, 3, 5, 0)
           AND c3.date_modified <= date_qry
           AND c3.date_end > date_qry
           AND c3.status_hist IN (1, 2)
           AND c3.c3_type = 'ZALOG'
           AND c3.c3_asset IN
               (SELECT b1.b1_id
                  FROM d_b1_assets_h b1
                 WHERE b1.b1_client = emitent_id
                   AND (b1.b1_nin = nin OR nin IS NULL)
                   AND (b1.b1_as_type IN
                       (SELECT column_value
                           FROM TABLE(cfg_utils.in_list(p_cb_type))) OR
                       p_cb_type IS NULL)
                   AND b1.date_modified <= date_qry
                   AND b1.date_end > date_qry
                   AND b1.status_hist IN (1, 2));
    BEGIN
      FOR PlacedEncumbrance_rec IN PlacedEncumbrance_cur LOOP
        vol := vol + volOfEncumbrance(PlacedEncumbrance_rec.a2_id,
                                      date_qry,
                                      PlacedEncumbrance_rec.c3_asset);
      END LOOP;
    END;
  
    RETURN(nvl(vol, 0));
  END;

  FUNCTION volOfPlacedEncumbranceCD(emitent_id NUMBER,
                                    date_qry   DATE,
                                    nin        VARCHAR2 := NULL,
                                    p_refer    VARCHAR2 := NULL)
    RETURN NUMBER AS
    res     NUMBER;
    v_zalog NUMBER;
  BEGIN
    v_zalog := volOfPlacedEncumbrance(emitent_id => emitent_id,
                                      date_qry   => date_qry,
                                      nin        => nin);
    SELECT SUM(s.bldg)
      INTO res
      FROM fa_shareholders_sec_us s
     WHERE s.refer_ = p_refer;
    RETURN v_zalog + nvl(res, 0);
  END;

  -- Кол-во блокированных размещенных ЦБ эмитента на дату
  FUNCTION volOfPlacedBlocked(emitent_id NUMBER,
                              date_qry   DATE,
                              nin        VARCHAR2 := NULL,
                              p_cb_type  VARCHAR2 := NULL) RETURN NUMBER IS
    vol NUMBER;
  BEGIN
  
    vol := 0;
    DECLARE
      CURSOR PlacedBlocked_cur IS
        SELECT a2.a2_id AS a2_id
          FROM d_a2_accounts a2
          JOIN d_c3_positions_h c3
            ON (c3.c3_account = a2.a2_id)
         WHERE a2.a2_acc_type IN (1, 2, 3, 5, 0)
           AND c3.date_modified <= date_qry
           AND c3.date_end > date_qry
           AND c3.status_hist IN (1, 2)
              
           AND c3.c3_asset IN (SELECT b1.b1_id
                                 FROM d_b1_assets_h b1
                               --join D_S18_ASSET_TYPE s18 on (s18.s18_code = b1.b1_as_type)
                                WHERE b1.b1_client = emitent_id
                                  AND (b1.b1_nin = nin OR nin IS NULL)
                                  AND (b1.b1_as_type IN
                                      (SELECT column_value
                                          FROM TABLE(cfg_utils.in_list(p_cb_type))) OR
                                      p_cb_type IS NULL)
                                  AND b1.status_hist IN (1, 2)
                                  AND b1.date_modified <= date_qry
                                  AND b1.date_end > date_qry
                               
                               );
    
    BEGIN
      FOR PlacedBlocked_rec IN PlacedBlocked_cur LOOP
        vol := vol + volOfBlockedSecurities(PlacedBlocked_rec.a2_id,
                                            date_qry,
                                            nin);
      END LOOP;
    END;
  
    RETURN(nvl(vol, 0));
  END;

  FUNCTION volOfPlacedBlockedCd(emitent_id NUMBER,
                                date_qry   DATE,
                                nin        VARCHAR2 := NULL,
                                p_refer    VARCHAR2 := NULL) RETURN NUMBER AS
    res       NUMBER;
    v_blocked NUMBER;
  BEGIN
    v_blocked := volOfPlacedBlocked(emitent_id => emitent_id,
                                    date_qry   => date_qry,
                                    nin        => nin);
    SELECT SUM(s.bloc)
      INTO res
      FROM fa_shareholders_sec_us s
     WHERE s.refer_ = p_refer;
    RETURN v_blocked + nvl(res, 0);
  END;

  -- Кол-во размещенных ЦБ эмитента на дату
  FUNCTION volOfPlacedSecurities(emitent_id NUMBER,
                                 date_qry   DATE,
                                 nin        VARCHAR2 := NULL,
                                 p_refer    VARCHAR2 := NULL) RETURN NUMBER
    DETERMINISTIC IS
    vol   NUMBER;
    vol_1 NUMBER;
    vol_2 NUMBER;
    vol_3 NUMBER;
  
  BEGIN
  
    SELECT nvl(SUM(c3.c3_amount), 0)
      INTO vol
      FROM d_c3_positions_h c3
      JOIN d_a2_accounts a2
        ON (c3.c3_account = a2.a2_id)
     WHERE a2.a2_acc_type IN (1, 2, 3, 0) --104
       AND c3.date_modified <= date_qry
       AND date_qry < c3.date_end
       AND c3.status_hist IN (1, 2)
       AND c3.c3_asset IN (SELECT b1.b1_id
                             FROM d_b1_assets_h b1
                            WHERE b1.b1_client = emitent_id
                              AND (b1.b1_nin = nin OR nin IS NULL)
                              AND b1.date_modified <= date_qry
                              AND b1.date_end > date_qry
                              AND b1.status_hist IN (1, 2));
  
    vol_1 := volOfReacquiredSecurities(emitent_id, date_qry, nin); -- Количество выкупленных ЦБ эмитента
    vol_2 := volOfReacquiredSecuritiesCD(emitent_id, date_qry, nin); -- Количество выкупленных ЦБ эмитента в ЦД
    vol_3 := volOfDeclaredSecuritiesCD(emitent_id,
                                       date_qry,
                                       nin,
                                       '',
                                       p_refer); -- Количество объявленных ЦБ эмитента в ЦД
  
    vol := vol + vol_1 - vol_2 - vol_3;
  
    RETURN(nvl(vol, 0));
  END;

  -- Кол-во размещенных акций эмитента на дату
  FUNCTION volOfUnclaimed(emitent_id NUMBER,
                          date_qry   DATE,
                          nin        VARCHAR2 := NULL) RETURN NUMBER IS
    vol NUMBER;
  BEGIN
    SELECT /*INDEX (c3 D_C3_ACC_ASS_TYP)*/
     SUM(c3.c3_amount)
      INTO vol
      FROM d_c3_positions_h c3
      JOIN d_a2_accounts a2
        ON (c3.c3_account = a2.a2_id)
     WHERE a2.a2_acc_type IN (0)
       AND c3.date_modified <= date_qry
       AND date_qry < c3.date_end
       AND c3.status_hist IN (1, 2)
       AND c3.status_hist IN (1, 2)
       AND c3.c3_asset IN (SELECT b1.b1_id
                             FROM d_b1_assets_h b1
                            WHERE b1.b1_client = emitent_id
                              AND (b1.b1_nin = nin OR nin IS NULL)
                              AND b1.b1_as_type IN ('01', '02', '04')
                              AND b1.status_hist IN (1, 2)
                              AND b1.date_modified <= date_qry
                              AND b1.date_end > date_qry);
  
    RETURN(nvl(vol, 0));
  END;

  -- Кол-во размещенных акций эмитента на дату
  FUNCTION volOfPlacedShares(emitent_id NUMBER,
                             date_qry   DATE,
                             nin        VARCHAR2 := NULL) RETURN NUMBER
    DETERMINISTIC IS
    vol NUMBER;
  BEGIN
    SELECT /*INDEX (c3 D_C3_ACC_ASS_TYP)*/
     nvl(SUM(c3.c3_amount), 0) -- - sum(d.total_)
      INTO vol
      FROM d_c3_positions_h c3
      JOIN d_a2_accounts a2
        ON (c3.c3_account = a2.a2_id)
     WHERE a2.a2_acc_type IN (1, 2, 3, 0) --104
       AND c3.date_modified <= date_qry
       AND date_qry < c3.date_end
       AND c3.status_hist IN (1, 2)
       AND c3.status_hist IN (1, 2)
       AND c3.c3_asset IN (SELECT b1.b1_id
                             FROM d_b1_assets_h b1
                            WHERE b1.b1_client = emitent_id
                              AND (b1.b1_nin = nin OR nin IS NULL)
                              AND b1.b1_as_type IN ('01', '02', '04')
                              AND b1.status_hist IN (1, 2)
                              AND b1.date_modified <= date_qry
                              AND b1.date_end > date_qry);
  
    vol := vol + volOfReacquiredShares(emitent_id, date_qry, nin) -
           volOfReacquiredSecuritiesCD(emitent_id, date_qry, nin, '01,02') -
           volOfDeclaredSecuritiesCD(emitent_id, date_qry, nin, '01,02');
  
    RETURN(nvl(vol, 0));
  END;

  -- Кол-во размещенных простых акций эмитента на дату
  FUNCTION volOfPlacedSimpleShares(emitent_id NUMBER,
                                   date_qry   DATE,
                                   nin        VARCHAR2 := NULL) RETURN NUMBER IS
    vol NUMBER;
  BEGIN
    SELECT nvl(SUM(c3.c3_amount), 0) -- - sum(d.total_)
      INTO vol
      FROM d_a2_accounts a2
      JOIN d_c3_positions_h c3
        ON (c3.c3_account = a2.a2_id)
     WHERE a2.a2_acc_type IN (1, 2, 3, 0) -- счет выкупленных ЦБ
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2)
       AND c3.c3_asset IN (SELECT b1.b1_id
                             FROM d_b1_assets_h b1
                           --join D_S18_ASSET_TYPE s18 on (s18.s18_code = b1.b1_as_type)
                            WHERE b1.b1_client = emitent_id
                              AND (b1.b1_nin = nin OR nin IS NULL)
                              AND b1.b1_as_type = '01'
                              AND b1.status_hist IN (1, 2)
                              AND b1.date_modified <= date_qry
                              AND b1.date_end > date_qry);
  
    vol := vol + volOfReacquiredSimpleShares(emitent_id, date_qry, nin) -
           volOfReacquiredSecuritiesCD(emitent_id, date_qry, nin, '01') -
           volOfDeclaredSecuritiesCD(emitent_id, date_qry, nin, '01');
  
    RETURN(nvl(vol, 0));
  END;

  -- Кол-во размещенных привилегированных акций эмитента на дату
  FUNCTION volOfPlacedPrivShares(emitent_id NUMBER,
                                 date_qry   DATE,
                                 nin        VARCHAR2 := NULL) RETURN NUMBER IS
    vol NUMBER;
  BEGIN
    SELECT NVL(SUM(c3.c3_amount), 0)
      INTO vol
      FROM d_a2_accounts a2
      JOIN d_c3_positions_h c3
        ON (c3.c3_account = a2.a2_id)
     WHERE a2.a2_acc_type IN (1, 2, 3, 5, 0) -- счет выкупленных ЦБ
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2)
       AND c3.c3_asset IN (SELECT b1.b1_id
                             FROM d_b1_assets_h b1
                           --join D_S18_ASSET_TYPE s18 on (s18.s18_code = b1.b1_as_type)
                            WHERE b1.b1_client = emitent_id
                              AND (b1.b1_nin = nin OR nin IS NULL)
                              AND b1.b1_as_type = '02'
                              AND b1.status_hist IN (1, 2)
                              AND b1.date_modified <= date_qry
                              AND b1.date_end > date_qry
                           
                           );
  
    vol := vol + volOfReacquiredPrefShares(emitent_id, date_qry, nin) -
           volOfReacquiredSecuritiesCD(emitent_id, date_qry, nin, '02') -
           volOfDeclaredSecuritiesCD(emitent_id, date_qry, nin, '02');
    RETURN(nvl(vol, 0));
  END;

  -- Кол-во голосующих ЦБ
  FUNCTION volOfVotedSecurities(emitent_id NUMBER,
                                date_qry   DATE,
                                nin        VARCHAR2 := NULL,
                                rep_id     NUMBER := NULL) RETURN NUMBER
    DETERMINISTIC IS
    vol               NUMBER;
    volVotePlaced     NUMBER;
    volVoteReacquired NUMBER;
    sec_type          VARCHAR2(20);
    volHidden         NUMBER;
  BEGIN
  
    volVotePlaced     := 0;
    volVoteReacquired := 0;
  
    DECLARE
      CURSOR vote_shares IS
        SELECT /*+INDEX (b1 PK_D_B1_ASSETS_H)*/
         b1.b1_nin AS nin
          FROM d_b1_assets_h b1
         WHERE b1.b1_client = emitent_id
           AND b1.b1_vote = 1
           AND b1.b1_status IN ('OP', 'RS', 'US', 'BL')
           AND (b1.b1_nin = nin OR nin IS NULL)
           AND b1.status_hist IN (1, 2)
           AND b1.date_modified <= date_qry
           AND b1.date_end > date_qry
           AND b1.b1_as_type IN ('01', '02');
    
    BEGIN
      FOR vote_shares_rec IN vote_shares LOOP
        volVotePlaced     := volVotePlaced +
                             volOfPlacedShares(emitent_id,
                                               date_qry,
                                               vote_shares_rec.nin) -
                             volOfUnclaimed(emitent_id => emitent_id,
                                            date_qry   => date_qry,
                                            nin        => vote_shares_rec.nin);
        volVoteReacquired := volVoteReacquired +
                             volOfReacquiredShares(emitent_id,
                                                   date_qry,
                                                   vote_shares_rec.nin);
      END LOOP;
    END;
    IF rep_id IS NOT NULL THEN
      SELECT SUM(s.unit * b.b1_vote)
        INTO volHidden
        FROM fa_shareholders_sec_us s, d_b1_assets b
       WHERE s.refer_ =
             (SELECT cd_reference FROM d_p4_orderinfo WHERE id = rep_id)
         AND s.hold = '06'
         AND b.b1_nin = s.nsin;
    
    END IF;
  
    vol := volVotePlaced - volVoteReacquired - nvl(volHidden, 0);
  
    RETURN(nvl(vol, 0));
  END;

  -- Кол-во простых голосующих ЦБ
  FUNCTION volOfVotedSimpleSecurities(emitent_id NUMBER,
                                      date_qry   DATE,
                                      nin        VARCHAR2 := NULL,
                                      rep_id     NUMBER := NULL)
    RETURN NUMBER DETERMINISTIC IS
    vol               NUMBER;
    volVotePlaced     NUMBER;
    volVoteReacquired NUMBER;
    sec_type          VARCHAR2(20);
    volHidden         NUMBER;
  BEGIN
  
    volVotePlaced     := 0;
    volVoteReacquired := 0;
  
    DECLARE
      CURSOR vote_shares IS
        SELECT /*+INDEX (b1 PK_D_B1_ASSETS_H)*/
         b1.b1_nin AS nin
          FROM d_b1_assets_h b1
         WHERE b1.b1_client = emitent_id
           AND b1.b1_vote = 1
           AND b1.b1_status IN ('OP', 'RS', 'US', 'BL')
           AND (b1.b1_nin = nin OR nin IS NULL)
           AND b1.status_hist IN (1, 2)
           AND b1.date_modified <= date_qry
           AND b1.date_end > date_qry
           AND b1.b1_as_type IN ('01');
    
    BEGIN
      FOR vote_shares_rec IN vote_shares LOOP
        volVotePlaced     := volVotePlaced +
                             volOfPlacedShares(emitent_id,
                                               date_qry,
                                               vote_shares_rec.nin) -
                             volOfUnclaimed(emitent_id => emitent_id,
                                            date_qry   => date_qry,
                                            nin        => vote_shares_rec.nin);
        volVoteReacquired := volVoteReacquired +
                             volOfReacquiredShares(emitent_id,
                                                   date_qry,
                                                   vote_shares_rec.nin);
      END LOOP;
    END;
    IF rep_id IS NOT NULL THEN
      SELECT SUM(s.unit * b.b1_vote)
        INTO volHidden
        FROM fa_shareholders_sec_us s, d_b1_assets b
       WHERE s.refer_ =
             (SELECT cd_reference FROM d_p4_orderinfo WHERE id = rep_id)
         AND s.hold = '06'
         AND b.b1_nin = s.nsin;
    
    END IF;
  
    vol := volVotePlaced - volVoteReacquired - nvl(volHidden, 0);
  
    RETURN(nvl(vol, 0));
  END;

  -- Кол-во прив голосующих ЦБ
  FUNCTION volOfVotedPrefSecurities(emitent_id NUMBER,
                                    date_qry   DATE,
                                    nin        VARCHAR2 := NULL,
                                    rep_id     NUMBER := NULL) RETURN NUMBER
    DETERMINISTIC IS
    vol               NUMBER;
    volVotePlaced     NUMBER;
    volVoteReacquired NUMBER;
    sec_type          VARCHAR2(20);
    volHidden         NUMBER;
  BEGIN
  
    volVotePlaced     := 0;
    volVoteReacquired := 0;
  
    DECLARE
      CURSOR vote_shares IS
        SELECT /*+INDEX (b1 PK_D_B1_ASSETS_H)*/
         b1.b1_nin AS nin
          FROM d_b1_assets_h b1
         WHERE b1.b1_client = emitent_id
           AND b1.b1_vote = 1
           AND b1.b1_status IN ('OP', 'RS', 'US', 'BL')
           AND (b1.b1_nin = nin OR nin IS NULL)
           AND b1.status_hist IN (1, 2)
           AND b1.date_modified <= date_qry
           AND b1.date_end > date_qry
           AND b1.b1_as_type IN ('02');
    
    BEGIN
      FOR vote_shares_rec IN vote_shares LOOP
        volVotePlaced     := volVotePlaced +
                             volOfPlacedShares(emitent_id,
                                               date_qry,
                                               vote_shares_rec.nin) -
                             volOfUnclaimed(emitent_id => emitent_id,
                                            date_qry   => date_qry,
                                            nin        => vote_shares_rec.nin);
        volVoteReacquired := volVoteReacquired +
                             volOfReacquiredShares(emitent_id,
                                                   date_qry,
                                                   vote_shares_rec.nin);
      END LOOP;
    END;
    IF rep_id IS NOT NULL THEN
      SELECT SUM(s.unit * b.b1_vote)
        INTO volHidden
        FROM fa_shareholders_sec_us s, d_b1_assets b
       WHERE s.refer_ =
             (SELECT cd_reference FROM d_p4_orderinfo WHERE id = rep_id)
         AND s.hold = '06'
         AND b.b1_nin = s.nsin;
    
    END IF;
  
    vol := volVotePlaced - volVoteReacquired - nvl(volHidden, 0);
  
    RETURN(nvl(vol, 0));
  END;

  FUNCTION getListOfPlacedShares(emitent_id NUMBER, date_qry DATE)
    RETURN tbl_varchar IS
    nin_list VARCHAR2(4000);
    tbl_list tbl_varchar;
    str_qry  VARCHAR2(4000);
  BEGIN
    DECLARE
      CURSOR placed_shares IS
        SELECT b1.b1_nin AS nin
          FROM d_b1_assets_h b1
        --join D_S18_ASSET_TYPE s18 on (s18.s18_code = b1.b1_as_type)
         WHERE b1.b1_client = emitent_id
           AND b1.b1_status IN ('OP', 'RS', 'US', 'BL')
           AND b1.status_hist IN (1, 2)
           AND b1.date_modified <= date_qry
           AND b1.date_end > date_qry
           AND b1.b1_as_type IN ('01', '02');
    
    BEGIN
      FOR placed_shares_rec IN placed_shares LOOP
        nin_list := nin_list || placed_shares_rec.nin || ',';
      END LOOP;
    END;
    tbl_list := r_table.list_to_table_varchar(nin_list);
  
    RETURN(tbl_list);
  END;

  FUNCTION getEmitentIdByNIN(nin VARCHAR2) RETURN NUMBER IS
    emitent_id NUMBER;
  BEGIN
    SELECT b1.b1_client
      INTO emitent_id
      FROM d_b1_assets b1
     WHERE b1.b1_nin = nin;
  
    RETURN(emitent_id);
  END;

  FUNCTION Char2DateTime(chrdt VARCHAR2) RETURN DATE IS
  BEGIN
    RETURN(to_date(chrdt, 'dd.mm.yyyy HH24:mi:ss'));
  END;

  FUNCTION Char2Date(chrdt VARCHAR2) RETURN DATE IS
  BEGIN
    RETURN(to_date(chrdt, 'dd.mm.yyyy'));
  END;

  --
  FUNCTION Date2Char(dt DATE, tm NUMBER := NULL) RETURN VARCHAR2 IS
    RESULT VARCHAR2(100);
  BEGIN
    IF tm IS NULL THEN
      RESULT := to_char(dt, 'dd.mm.yyyy');
    ELSE
      RESULT := to_char(dt, 'dd.mm.yyyy HH24:MI:SS');
    END IF;
    IF RESULT = '01.01.1900' THEN
      RETURN NULL;
    ELSE
      RETURN(RESULT);
    END IF;
  
  END Date2Char;

  FUNCTION round8(val               NUMBER,
                  show_decimal_zero NUMBER := 0,
                  decimal_places    NUMBER := 8) RETURN VARCHAR2 IS
    RESULT VARCHAR2(100);
    rnd    NUMBER;
    trn    NUMBER;
    fmt    VARCHAR2(40);
  BEGIN
  
    fmt := CASE
             WHEN nvl(show_decimal_zero, 0) = 0 THEN
              'FM999G999G999G990D999999999'
             ELSE
              'FM999G999G999G990D099999999'
           END;
  
    IF nvl(val, 0) = 0 THEN
      RESULT := '0';
    ELSE
      rnd := round(val, decimal_places);
      trn := trunc(val);
      IF trn = trunc(rnd) THEN
        RESULT := to_char(rnd, fmt, 'nls_numeric_characters=''. ''');
      ELSE
        rnd    := trn + 0.99999998;
        RESULT := to_char(rnd, fmt, 'nls_numeric_characters=''. ''');
      END IF;
    END IF;
  
    IF nvl(show_decimal_zero, 0) = 0 AND rnd - trunc(rnd) = 0 THEN
      RESULT := REPLACE(RESULT, '.');
    END IF;
  
    RETURN(RESULT);
  END;

  FUNCTION to_number8(val VARCHAR2) RETURN NUMBER IS
    RESULT NUMBER;
  BEGIN
    IF val IS NULL THEN
      RESULT := 0;
    ELSE
      IF instr(val, ',') <> 0 THEN
        RESULT := to_number(REPLACE(val, ' ', ''),
                            '99999999999999D999999999',
                            'nls_numeric_characters='', ''');
      ELSE
        RESULT := to_number(REPLACE(val, ' ', ''),
                            '99999999999999D999999999',
                            'nls_numeric_characters=''. ''');
      END IF;
    END IF;
  
    RETURN(RESULT);
  END;

  --ХТ
  FUNCTION xt_getAccAmount(client_id NUMBER,
                           date_qry  DATE,
                           acc_type  NUMBER) RETURN NUMBER IS
    resUPR NUMBER;
    resCLN NUMBER;
  BEGIN
    SELECT SUM(CASE
                 WHEN acc_type = 110 THEN
                  -1 * c3.c3_amount
                 ELSE
                  c3.c3_amount
               END) AS balance
      INTO resCLN
      FROM d_c3_positions_h c3
      LEFT JOIN d_a2_accounts a2
        ON a2.a2_id = c3.c3_account
     WHERE c3.c3_client = client_id
       AND a2.a2_acc_type = acc_type --108
       AND c3.c3_type IN ('UPR', 'ZALOG', 'BLOCK')
       AND c3.c3_client = c3.c3_upr
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2);
  
    SELECT SUM(CASE
                 WHEN acc_type = 110 THEN
                  -1 * c3.c3_amount
                 ELSE
                  c3.c3_amount
               END) AS balance
      INTO resUPR
      FROM d_c3_positions_h c3
      LEFT JOIN d_a2_accounts a2
        ON a2.a2_id = c3.c3_account
     WHERE c3.c3_client = client_id
       AND a2.a2_acc_type = acc_type --108
       AND c3.c3_type IN ('UPR')
       AND c3.c3_client != c3.c3_upr
       AND c3.date_modified <= date_qry
       AND c3.date_end > date_qry
       AND c3.status_hist IN (1, 2);
  
    RETURN(nvl(resCLN, 0) + nvl(resUPR, 0));
  END;

  FUNCTION full_address(client_id       NUMBER,
                        address_type    VARCHAR2 := NULL,
                        i_date          DATE := SYSDATE,
                        i_index_visible NUMBER := 1) RETURN VARCHAR2 IS
    address VARCHAR2(4000);
    cl_type VARCHAR2(40);
    uc_id   NUMBER;
    cl_id   NUMBER;
  BEGIN
    SELECT a1.a1_cl_type, a1.a1_uc_id
      INTO cl_type, uc_id
      FROM d_a1_clients a1
     WHERE a1.a1_id = client_id;
  
    cl_id := CASE
               WHEN cl_type = 'P' THEN
                uc_id
               ELSE
                client_id
             END;
  
    IF nvl(upper(address_type), 'P') = 'P' THEN
      SELECT CASE
               WHEN TRIM(s3.s3_name) IS NULL THEN
                ''
               ELSE
                TRIM(s3.s3_name) || ', '
             END || CASE
               WHEN TRIM(s5.s5_name) IS NULL THEN
                ''
               ELSE
                TRIM(s5.s5_name) || ', '
             END ||
             
             CASE
               WHEN i_index_visible = 1 THEN
                CASE
                  WHEN TRIM(a1.a1_p_index) IS NULL THEN
                   ''
                  ELSE
                   TRIM(a1.a1_p_index) || ', '
                END
               ELSE
                ''
             END
             
             || nvl(a1.a1_p_address, '')
        INTO address
        FROM d_a1_clients a1
        LEFT JOIN d_s3_country s3
          ON (s3.s3_code = a1.a1_p_country)
        LEFT JOIN d_s5_region s5
          ON (s5.s5_code = a1.a1_p_region)
       WHERE a1.a1_id = cl_id
      /*AND a1.date_modified <= i_date
      AND a1.date_end > i_date
      AND a1.status_hist IN (1, 2)*/
      ;
    ELSE
      -- 'J'
      SELECT CASE
               WHEN TRIM(s3.s3_name) IS NULL THEN
                ''
               ELSE
                TRIM(s3.s3_name) || ', '
             END || CASE
               WHEN TRIM(s5.s5_name) IS NULL THEN
                ''
               ELSE
                TRIM(s5.s5_name) || ', '
             END || CASE
               WHEN i_index_visible = 1 THEN
                CASE
                  WHEN TRIM(a1.a1_j_index) IS NULL THEN
                   ''
                  ELSE
                   TRIM(a1.a1_j_index) || ', '
                
                END
               ELSE
                ''
             END || nvl(TRIM(a1.a1_j_address), '')
        INTO address
        FROM d_a1_clients a1
        LEFT JOIN d_s3_country s3
          ON (s3.s3_code = a1.a1_j_country)
        LEFT JOIN d_s5_region s5
          ON (s5.s5_code = a1.a1_j_region)
       WHERE a1.a1_id = cl_id
      /*AND a1.date_modified <= i_date
      AND a1.date_end > i_date
      AND a1.status_hist IN (1, 2)*/
      ;
    END IF;
  
    RETURN(address);
  EXCEPTION
    WHEN OTHERS THEN
      log_add(P_LOG_MESSAGE => dbms_utility.format_error_stack ||
                               dbms_utility.format_error_backtrace);
  END;

  FUNCTION client_docs(acc_id NUMBER) RETURN VARCHAR2 IS
    RESULT VARCHAR2(4000);
  BEGIN
    SELECT d_sys_utils.accountsys_11(a2.a2_account_num) || ' (' ||
           s11.s11_name || ') ' || s7.s7_name || ' ' || a1.a1_cl_doc_ser || ' ' ||
           a1.a1_cl_doc_nom || CASE
             WHEN a1.a1_cl_doc_dat IS NULL OR
                  Date2Char(a1.a1_cl_doc_dat) = '01.01.1900' OR
                  a1.a1_cl_doc_reg IS NULL THEN
              ''
             ELSE
              ' Кем, когда: ' || Date2Char(a1.a1_cl_doc_dat) || ' ' ||
              a1.a1_cl_doc_reg
           END || CASE
             WHEN a1.a1_idn NOT LIKE 'NR%' AND a1.a1_idn <> '000000000000' THEN
              CASE
                WHEN a1.a1_cl_type = 'F' THEN
                 nvl2(a1.a1_idn, ' ИИН:', '')
                ELSE
                 nvl2(a1.a1_idn, ' БИН:', '')
              END || a1.a1_idn
             ELSE
              ''
           END
      INTO RESULT
      FROM d_a2_accounts a2
      JOIN d_a1_clients a1
        ON (a2.a2_client = a1.a1_id)
      JOIN d_s11_cl_acc_type s11
        ON (s11.s11_code = a2.a2_acc_type)
      LEFT JOIN d_s7_doc_type s7
        ON (s7.s7_code = a1.a1_cl_doc_typ)
     WHERE a2.a2_id = acc_id;
  
    RETURN(RESULT);
  END;

  FUNCTION client_docs_spr(acc_id NUMBER) RETURN VARCHAR2 IS
    RESULT VARCHAR2(4000);
  BEGIN
    SELECT s7.s7_name || ' ' || a1.a1_cl_doc_ser || ' ' || a1.a1_cl_doc_nom || CASE
             WHEN a1.a1_cl_doc_dat IS NULL OR
                  Date2Char(a1.a1_cl_doc_dat) = '01.01.1900' OR
                  a1.a1_cl_doc_reg IS NULL THEN
              ''
             ELSE
              ' Кем, когда: ' || Date2Char(a1.a1_cl_doc_dat) || ' ' ||
              a1.a1_cl_doc_reg
           END || chr(10) || full_address(client_id => a1.a1_id) || CASE
             WHEN a1.a1_idn NOT LIKE 'NR%' AND a1.a1_idn <> '000000000000' THEN
              CASE
                WHEN a1.a1_cl_type = 'F' THEN
                 nvl2(a1.a1_idn, ' ИИН:', '')
                ELSE
                 nvl2(a1.a1_idn, ' БИН:', '')
              END || a1.a1_idn
             ELSE
              ''
           END
      INTO RESULT
      FROM d_a2_accounts a2
      JOIN d_a1_clients a1
        ON (a2.a2_client = a1.a1_id)
      LEFT JOIN d_s7_doc_type s7
        ON (s7.s7_code = a1.a1_cl_doc_typ)
     WHERE a2.a2_id = acc_id;
  
    RETURN(RESULT);
  END;

  FUNCTION acc_open_date(cl_account_id NUMBER) RETURN DATE IS
    RESULT DATE;
  BEGIN
  
    IF cl_account_id IS NULL THEN
      RESULT := to_date('01.01.1990', 'dd.mm.yyyy');
    ELSE
      SELECT a2.a2_open_date
        INTO RESULT
        FROM d_a2_accounts a2
       WHERE a2.a2_id = cl_account_id;
    END IF;
  
    RETURN(nvl(RESULT, to_date('01.01.1990', 'dd.mm.yyyy')));
  
  END;

  FUNCTION getRegName RETURN VARCHAR2 AS
  BEGIN
    RETURN 'АО "Единый регистратор ценных бумаг"';
  END;

  FUNCTION getRegInfo RETURN VARCHAR2 AS
    res VARCHAR2(512);
  BEGIN
    SELECT (SELECT t.pvalue FROM ADM_PARAM t WHERE t.code = 'POSTCODE') || ' ' ||
           (SELECT t.pvalue FROM ADM_PARAM t WHERE t.code = 'HQ_ADDRESS') || ' ' ||
           (SELECT t.pvalue FROM ADM_PARAM t WHERE t.code = 'TELEPHONEALL')
      INTO res
      FROM dual;
    RETURN res;
  END;

  FUNCTION getVidAndNin(p_asset_id NUMBER) RETURN VARCHAR2 AS
    res VARCHAR2(128);
  BEGIN
    SELECT (SELECT t.s18_name
              FROM d_s18_asset_type t
             WHERE t.s18_code = a.b1_as_type) || ' НИН: ' || a.b1_nin
      INTO res
      FROM d_b1_assets a
     WHERE a.b1_id = p_asset_id;
    RETURN res;
  END;

  --- Функция, возвращающая остаток на текущую дату по типу счета, инструменту и/или типу счета
  --@param p_asset_id   инструмент, можно передавать несколько через запятую
  --@param p_client_id  ID клиента
  --@param p_acc_type   тип счета, можно передавать несколько через запятую
  --{*}  Перед вызовом необходимо заполнить таблицу d_c3_positions_h_t
  FUNCTION getBalance(p_asset_id  VARCHAR2 := NULL,
                      p_client_id NUMBER := NULL,
                      p_acc_type  VARCHAR2 := NULL) RETURN NUMBER AS
    res NUMBER;
  BEGIN
    SELECT SUM(c3.c3_amount * (CASE
                 WHEN nvl(a2.a2_acc_type, 0) IN (7, 104) THEN
                  -1
                 ELSE
                  1
               END))
      INTO res
      FROM d_c3_positions c3
      JOIN d_b1_assets b1
        ON (b1.b1_id = c3.c3_asset)
      LEFT JOIN d_a2_accounts a2
        ON (a2.a2_id = c3.c3_account)
     WHERE (a2.a2_acc_type IN
           (SELECT column_value FROM TABLE(cfg_utils.in_list(p_acc_type))) OR
           p_acc_type IS NULL)
       AND c3.c3_asset = b1.b1_id
       AND (c3.c3_client = p_client_id OR p_client_id IS NULL)
       AND (c3.c3_asset IN
           (SELECT column_value FROM TABLE(cfg_utils.in_list(p_asset_id))) OR
           p_asset_id IS NULL);
    RETURN res;
  END;

  --- Функция, возвращающая остаток на дату по типу счета, инструменту и/или типу счета
  --@param p_date       дата
  --@param p_asset_id   инструмент
  --@param p_client_id  ID клиента
  --@param p_acc_type   тип счета, можно передавать несколько через запятую
  --@param p_cb_type    тип инструмента, можно передавать несколько через запятую
  --{*}  Перед вызовом необходимо заполнить таблицу d_c3_positions_h_t

  FUNCTION getBalanceOnDate(p_date       DATE,
                            p_asset_id   VARCHAR2 := NULL,
                            p_client_id  NUMBER := NULL,
                            p_acc_type   VARCHAR2 := NULL,
                            p_cb_type    VARCHAR2 := NULL,
                            p_emitent_id NUMBER := NULL) RETURN NUMBER AS
    res NUMBER;
  BEGIN
    SELECT SUM(c3.c3_amount * (CASE
                 WHEN nvl(a2.a2_acc_type, 0) IN (7, 104, 110) THEN
                  -1
                 ELSE
                  1
               END))
      INTO res
      FROM (SELECT *
              FROM d_c3_positions_h c3
             WHERE c3.status_hist IN (1, 2)
               AND c3.date_modified <= p_date
               AND c3.date_end > p_date) c3
    
      JOIN d_b1_assets_h b1
        ON (b1.b1_id = c3.c3_asset)
      LEFT JOIN d_a2_accounts a2
        ON (a2.a2_id = c3.c3_account)
     WHERE (a2.a2_acc_type IN
           (SELECT column_value FROM TABLE(cfg_utils.in_list(p_acc_type))) OR
           p_acc_type IS NULL)
       AND c3.date_modified <= p_date
       AND c3.date_end > p_date
       AND c3.status_hist IN (1, 2)
       AND c3.c3_asset = b1.b1_id
       AND (b1.b1_client = p_emitent_id OR p_emitent_id IS NULL)
       AND (b1.b1_as_type IN
           (SELECT column_value FROM TABLE(cfg_utils.in_list(p_cb_type))) OR
           p_cb_type IS NULL)
       AND (c3.c3_client = p_client_id OR p_client_id IS NULL)
       AND (c3.c3_asset IN
           (SELECT column_value FROM TABLE(cfg_utils.in_list(p_asset_id))) OR
           p_asset_id IS NULL)
       AND b1.status_hist IN (1, 2)
       AND b1.date_modified <= p_date
       AND b1.date_end > p_date;
    RETURN nvl(res, 0);
  END;

  --- Функция, возвращающая остаток на дату по типу счета, инструменту и/или типу счета
  --@param p_date       дата
  --@param p_asset_id   инструмент
  --@param p_client_id  ID клиента
  --@param p_acc_type   тип счета, можно передавать несколько через запятую
  --@param p_cb_type    тип инструмента, можно передавать несколько через запятую
  --{*}  Перед вызовом необходимо заполнить таблицу d_c3_positions_h_t

  FUNCTION getBalanceOnDateT(p_date       DATE,
                             p_asset_id   VARCHAR2 := NULL,
                             p_client_id  NUMBER := NULL,
                             p_acc_type   VARCHAR2 := NULL,
                             p_cb_type    VARCHAR2 := NULL,
                             p_emitent_id NUMBER := NULL,
                             p_vote       NUMBER := NULL) RETURN NUMBER AS
    res NUMBER;
  BEGIN
    SELECT SUM(c3.c3_amount * (CASE
                 WHEN nvl(a2.a2_acc_type, 0) IN (7, 104, 110) THEN
                  -1
                 ELSE
                  1
               END))
      INTO res
      FROM d_c3_positions_h_t c3
      JOIN d_b1_assets_h b1
        ON (b1.b1_id = c3.c3_asset)
      LEFT JOIN d_a2_accounts a2
        ON (a2.a2_id = c3.c3_account)
     WHERE (a2.a2_acc_type IN
           (SELECT column_value FROM TABLE(cfg_utils.in_list(p_acc_type))) OR
           p_acc_type IS NULL)
       AND c3.date_modified <= p_date
       AND c3.date_end > p_date
       AND c3.status_hist IN (1, 2)
       AND c3.c3_asset = b1.b1_id
       AND (b1.b1_client = p_emitent_id OR p_emitent_id IS NULL)
       AND (b1.b1_as_type IN
           (SELECT column_value FROM TABLE(cfg_utils.in_list(p_cb_type))) OR
           p_cb_type IS NULL)
       AND (c3.c3_client = p_client_id OR p_client_id IS NULL)
       AND (c3.c3_asset IN
           (SELECT column_value FROM TABLE(cfg_utils.in_list(p_asset_id))) OR
           p_asset_id IS NULL)
       AND b1.status_hist IN (1, 2)
       AND b1.date_modified <= p_date
       AND b1.date_end > p_date;
    RETURN nvl(res, 0);
  END;

  FUNCTION fee_type_name(i_FEECALCLOGID NUMBER) RETURN VARCHAR2 AS
    p_t VARCHAR2(1000);
  BEGIN
    SELECT MAX(t.name)
      INTO p_t
      FROM fee_calc_log q, fee_conditions_sets s
      LEFT JOIN fee_type t
        ON s.fee_type = t.id
     WHERE 1 = 1
       AND q.condition_set_id = s.id
       AND q.id = i_FEECALCLOGID;
    RETURN p_t;
  
  END;

  FUNCTION get_adm_param(i_param VARCHAR2) RETURN VARCHAR2 AS
    res VARCHAR2(1000);
  
  BEGIN
    SELECT MAX(a.pvalue) INTO res FROM adm_param a WHERE a.code = i_param;
  
    RETURN res;
  END;

  FUNCTION GetBlockReasonISsue(P_ASSET_ID NUMBER, P_date DATE)
    RETURN VARCHAR2 AS
    res VARCHAR2(2000);
  BEGIN
    SELECT p.p2_tmemo
      INTO res
      FROM d_p2_orderasset p
     WHERE p.p2_id = (SELECT MAX(p2_id)
                        FROM d_p2_orderasset p2
                       WHERE p2.p2_ord_type IN (103, 623)
                         AND p2.p2_status = 0
                         AND p2.p2_ord_date <= p_date
                         AND p2.p2_asset = P_ASSET_ID);
  
    RETURN res;
  EXCEPTION
    WHEN no_data_found THEN
      RETURN NULL;
  END;

  FUNCTION full_address_add(client_id NUMBER) RETURN VARCHAR2 IS
    address VARCHAR2(4000);
    cl_type VARCHAR2(40);
    uc_id   NUMBER;
    cl_id   NUMBER;
  BEGIN
  
    SELECT a1.a1_cl_type, a1.a1_uc_id
      INTO cl_type, uc_id
      FROM d_a1_clients a1
     WHERE a1.a1_id = client_id;
  
    cl_id := CASE
               WHEN cl_type = 'P' THEN
                uc_id
               ELSE
                client_id
             END;
  
    SELECT CASE
             WHEN TRIM(s3.s3_name) IS NULL THEN
              ''
             ELSE
              TRIM(s3.s3_name) || ', '
           END || CASE
             WHEN TRIM(s5.s5_name) IS NULL THEN
              ''
             ELSE
              TRIM(s5.s5_name) || ', '
           END ||
           
           CASE
             WHEN TRIM(a1.a1_p_index) IS NULL THEN
              ''
             ELSE
              TRIM(a1.a1_p_index) || ', '
           END
           
           || nvl(a1.a1_p_address, '') || chr(10)
      INTO address
      FROM d_a1_clients a1
      LEFT JOIN d_s3_country s3
        ON (s3.s3_code = a1.a1_p_country)
      LEFT JOIN d_s5_region s5
        ON (s5.s5_code = a1.a1_p_region)
     WHERE a1.a1_id = cl_id;
  
    RETURN(address);
  EXCEPTION
    WHEN OTHERS THEN
      log_add(P_LOG_MESSAGE => dbms_utility.format_error_stack ||
                               dbms_utility.format_error_backtrace);
  END;

  FUNCTION GetReestrAddInfoCD(P_ID NUMBER, P_ADD_INFO_LIST VARCHAR2)
    RETURN VARCHAR2 AS
    res   VARCHAR2(4000);
    v_row fa_shareholders_sec_us%ROWTYPE;
  BEGIN
  
    SELECT * INTO v_row FROM fa_shareholders_sec_us s WHERE s.id = p_id;
  
    FOR rec IN (SELECT column_value AS c, r.name
                  FROM TABLE (SELECT cfg_utils.in_list(P_ADD_INFO_LIST)
                                FROM dual),
                       ref_reestr_add_info r
                 WHERE r.code = column_value) LOOP
    
      CASE
        WHEN rec.c = 'POST_ADDR' AND v_row.addr IS NOT NULL THEN
          res := res || rec.name || ': ' || v_row.addr || chr(10);
          /*when rec.code = 'CONTACT' then
          res := res || rec.name || ': ' || getClContactInfo(P_CLIENT_ID) ||
                 chr(10) || chr(13);*/
      /*when rec.code = 'RNN' then
                                                                                                                                                                                                                                                                                                                      res := res || rec.name || ': ' || v_row. ||
                                                                                                                                                                                                                                                                                                                             chr(10) || chr(13);*/
        WHEN rec.c = 'BANK_REQ' AND getClBankReqCD(p_id) IS NOT NULL THEN
          res := res || rec.name || ': ' || getClBankReqCD(p_id) || chr(10) ||
                 chr(10);
        WHEN rec.c = 'RESIDENT' THEN
          res := res || GetClResidentCD(v_row.irs) || chr(10);
          /*when rec.code = 'COUNTRY_REG' then
          res := res || rec.name || ': ' || GetClCountryReg(P_CLIENT_ID) ||
                 chr(10) || chr(13);*/
        ELSE
          res := res;
      END CASE;
    END LOOP;
    RETURN nvl(res, ' ');
  END;

  FUNCTION GetReestrAddInfo(P_CLIENT_ID     NUMBER,
                            P_ADD_INFO_LIST VARCHAR2,
                            P_DATE          DATE) RETURN VARCHAR2 AS
    res VARCHAR2(4000);
  BEGIN
    FOR rec IN (SELECT column_value AS code, r.name
                  FROM TABLE (SELECT cfg_utils.in_list(P_ADD_INFO_LIST)
                                FROM dual),
                       ref_reestr_add_info r
                 WHERE r.code = column_value) LOOP
    
      CASE
        WHEN rec.code = 'POST_ADDR' AND
             full_address_add(client_id => P_CLIENT_ID) IS NOT NULL THEN
          res := res || rec.name || ': ' ||
                 full_address_add(client_id => P_CLIENT_ID) || chr(10);
          /* res := res || rec.name || ': ' ||
          full_address(client_id    => P_CLIENT_ID,
                       address_type => 'P',
                       i_date       => P_DATE) || chr(10);*/
        WHEN rec.code = 'CONTACT' AND
             getClContactInfo(P_CLIENT_ID) IS NOT NULL THEN
          res := res || rec.name || ': ' || getClContactInfo(P_CLIENT_ID) ||
                 chr(10);
        WHEN rec.code = 'RNN' AND GetClRnn(P_CLIENT_ID) IS NOT NULL THEN
          res := res || rec.name || ': ' || GetClRnn(P_CLIENT_ID) ||
                 chr(10);
        WHEN rec.code = 'BANK_REQ' AND
             TRIM(REPLACE(getClBankReq(P_CLIENT_ID), chr(10), '')) IS NOT NULL THEN
          res := res || rec.name || ': ' || getClBankReq(P_CLIENT_ID) ||
                 chr(10);
        WHEN rec.code = 'RESIDENT' THEN
          res := res || GetClResident(P_CLIENT_ID) || chr(10);
        WHEN rec.code = 'DATEBIRTH' AND
             GetClDateBirth(P_CLIENT_ID) IS NOT NULL THEN
          res := res || rec.name || ': ' || GetClDateBirth(P_CLIENT_ID) ||
                 chr(10);
        WHEN rec.code = 'COUNTRY_REG' AND
             GetClCountryReg(P_CLIENT_ID) IS NOT NULL THEN
          res := res || rec.name || ': ' || GetClCountryReg(P_CLIENT_ID) ||
                 chr(10);
        WHEN rec.code = 'ACC_STATUS' AND
             getClAccStatus(P_CLIENT_ID) IS NOT NULL THEN
          res := res || rec.name || ': ' || getClAccStatus(P_CLIENT_ID) ||
                 chr(10);
        ELSE
          NULL;
      END CASE;
    END LOOP;
    RETURN res;
  END;

  FUNCTION GetCDAccID RETURN NUMBER AS
    res NUMBER;
  BEGIN
    SELECT a2.a2_id
      INTO res
      FROM d_a2_accounts a2
     WHERE a2.a2_account_num =
           d_sys_utils.accountsys_num(adm_pkg.get_param_value('KACD_ACC'));
    RETURN res;
  END;

  FUNCTION GetCDID RETURN NUMBER AS
    res NUMBER;
  BEGIN
    SELECT a2.a2_client
      INTO res
      FROM d_a2_accounts a2
     WHERE a2.a2_account_num =
           d_sys_utils.accountsys_num(adm_pkg.get_param_value('KACD_ACC'));
    RETURN res;
  END;

  FUNCTION GetListOfCommonRepr(P_CLIENT_ID NUMBER) RETURN VARCHAR2 AS
    res VARCHAR2(4000);
  BEGIN
    SELECT listagg(rownum || ') ' || g.a4_name || ' - ' ||
                   to_char(g.a4_value, 'FM99999999999990.99999'),
                   chr(10)) WITHIN GROUP(ORDER BY rownum)
      INTO res
      FROM d_a4_clients_group g
     WHERE g.a4_client_root = P_CLIENT_ID;
  
    RETURN('Участники общей собственности: ' || chr(10) || res);
  EXCEPTION
    WHEN no_data_found THEN
      RETURN NULL;
  END;

  FUNCTION getClContactInfo(p_client_id NUMBER) RETURN VARCHAR2 AS
    res VARCHAR2(1000);
  BEGIN
    SELECT nvl2(TRIM(a.a1_phone1), 'Тел_1: ' || a.a1_phone1 || ' ', '') ||
           nvl2(TRIM(a.a1_phone2), 'Тел_2: ' || a.a1_phone2 || ' ', '') ||
           nvl2(TRIM(a.a1_fax), 'Факс: ' || a.a1_fax || ' ', '') ||
           nvl2(TRIM(a.a1_addr_email), 'E-Mail: ' || a.a1_addr_email, '')
      INTO res
      FROM d_a1_clients a
     WHERE a.a1_id = p_client_id;
  
    RETURN res;
  END;

  FUNCTION getClAccStatus(p_client_id NUMBER) RETURN VARCHAR2 AS
    res VARCHAR2(64);
  BEGIN
    SELECT s.s1_name
      INTO res
      FROM d_a1_clients a
      JOIN d_s1_status s
        ON s.s1_code = a.a1_status
     WHERE a.a1_id = p_client_id
       AND s.s1_type = 'ACC';
  
    RETURN res;
  END;

  FUNCTION getClBankReq(p_client_id NUMBER) RETURN VARCHAR2 AS
    res VARCHAR2(1000);
  BEGIN
    SELECT nvl2(TRIM(a.a1_bank_name),
                'Банк: ' || a.a1_bank_name || ' ',
                '') || chr(10) ||
           nvl2(TRIM(a.a1_bank_mfo), 'Бик: ' || a.a1_bank_mfo || ' ', '') || ' ' ||
           nvl2(TRIM(a.a1_bank_code),
                'КБе: ' || a.a1_bank_code || ' ',
                '') || chr(10) ||
           nvl2(TRIM(a.a1_b_account), 'ИИК: ' || a.a1_b_account, '') ||
           chr(10) || nvl2(TRIM(a.a1_bank_info),
                           'Доп. информация: ' || a.a1_bank_info,
                           '') || CASE
             WHEN a.a1_idn <> a.a1_rec_idn THEN
             
              nvl2(TRIM(a.a1_rec_idn),
                   'ФИО получателя: ' || a.a1_rec_fullname || chr(10) ||
                   
                   'ИИН получателя: ' || a.a1_rec_idn,
                   '')
             ELSE
              ''
           END
      INTO res
      FROM d_a1_clients a
     WHERE a.a1_id = p_client_id;
  
    RETURN res;
  END;

  FUNCTION getClBankReqCD(p_id NUMBER) RETURN VARCHAR2 AS
    res VARCHAR2(4000);
  BEGIN
    SELECT nvl2(TRIM(a.benf), 'Бенефициар: ' || TRIM(a.benf), '') ||
           chr(10) || nvl2(TRIM(a.benf_idn), 'БИН: ' || a.benf_idn, '') ||
           chr(10) || nvl2(TRIM(a.bank), 'Банк: ' || a.bank || ' ', '') ||
           chr(10) || nvl2(TRIM(a.bik), 'Бик: ' || a.bik || ' ', '') || ' ' ||
           nvl2(a.irs || a.seco, 'КБе: ' || a.irs || a.seco || ' ', '') ||
           chr(10) || nvl2(TRIM(a.iik), 'ИИК: ' || a.iik, '')
      INTO res
      FROM fa_shareholders_sec_us a
     WHERE a.id = p_id;
  
    RETURN res;
  EXCEPTION
    WHEN OTHERS THEN
      RETURN '';
  END;

  FUNCTION GetClRnn(P_client_id NUMBER) RETURN VARCHAR2 AS
    res VARCHAR2(36);
  BEGIN
    SELECT TRIM(a.a1_rnn)
      INTO res
      FROM d_a1_clients a
     WHERE a.a1_id = p_client_id;
    RETURN res;
  END;

  FUNCTION GetClDateBirth(P_client_id NUMBER) RETURN VARCHAR2 AS
    res VARCHAR2(36);
  BEGIN
    SELECT CASE
             WHEN a.a1_cl_type = 'F' THEN
              to_char(a.a1_born, 'dd.mm.yyyy')
             ELSE
              NULL
           END
      INTO res
      FROM d_a1_clients a
     WHERE a.a1_id = p_client_id;
    RETURN res;
  END;

  FUNCTION GetClCountryReg(P_client_id NUMBER) RETURN VARCHAR2 AS
    res VARCHAR2(128);
  BEGIN
    SELECT TRIM(c.s3_name)
      INTO res
      FROM d_a1_clients a
      LEFT JOIN d_s3_country c
        ON c.s3_code = a.a1_country
     WHERE a.a1_id = p_client_id;
    RETURN res;
  END;

  FUNCTION GetClResident(P_client_id NUMBER) RETURN VARCHAR2 AS
    res VARCHAR2(36);
  BEGIN
    SELECT CASE nvl(a.a1_resident, 0)
             WHEN 0 THEN
              'Нерезидент'
             ELSE
              'Резидент'
           END
      INTO res
      FROM d_a1_clients a
     WHERE a.a1_id = p_client_id;
    RETURN res;
  END;

  FUNCTION GetClResidentCD(P_RESIDENT NUMBER) RETURN VARCHAR2 AS
    res VARCHAR2(36);
  BEGIN
    SELECT CASE nvl(P_RESIDENT, 0)
             WHEN 0 THEN
              'Нерезидент'
             ELSE
              'Резидент'
           END
      INTO res
      FROM dual;
    RETURN res;
  END;

  FUNCTION VolOfZalogUprBlock(i_type   VARCHAR, -- BLOCK, DOV, ZALOG
                              acc_id   NUMBER,
                              date_qry DATE,
                              asset_id NUMBER,
                              i_c3_id  NUMBER := NULL) RETURN NUMBER IS
  
    p_sum   NUMBER;
    p_st    VARCHAR(1000);
    i       NUMBER;
    p_c3_id NUMBER;
  BEGIN
  
    SELECT COUNT(*)
      INTO i
      FROM d_c3_positions_h z3
     WHERE 1 = 1
       AND z3.date_modified <= date_qry
       AND z3.date_end > date_qry
       AND z3.c3_account = acc_id
       AND z3.status_hist IN (1, 2)
       AND z3.c3_asset = asset_id
       AND CASE
             WHEN z3.c3_client != z3.c3_upr AND z3.c3_type = 'UPR' THEN
              'DOV'
             ELSE
              z3.c3_type
           END = i_type;
  
    IF i = 0 THEN
      RETURN 0;
    END IF;
  
    SELECT nvl(i_c3_id, z3.c3_id) -- если указан i_c3_id,
      INTO p_c3_id
      FROM d_c3_positions_h z3
     WHERE 1 = 1
       AND z3.date_modified <= date_qry
       AND z3.date_end > date_qry
       AND z3.c3_account = acc_id
       AND z3.status_hist IN (1, 2)
       AND (z3.c3_asset = asset_id)
       AND c3_type = 'UPR'
       AND c3_client = c3_upr;
  
    SELECT SUM(summa)
      INTO p_sum
      FROM (
            
            SELECT c3_subparent_id,
                    SYS_CONNECT_BY_PATH(c3_type, '/'),
                    CONNECT_BY_ISLEAF AS isleaf,
                    (SELECT SUM(f.c3_amount)
                       FROM (SELECT *
                               FROM d_c3_positions_h f
                              WHERE f.date_modified <= date_qry
                                AND f.date_end > date_qry
                                AND f.c3_account = acc_id
                                AND f.status_hist IN (1, 2)
                                AND f.c3_asset = asset_id) f
                      START WITH f.c3_id = a.c3_id
                     CONNECT BY PRIOR f.c3_id = f.c3_subparent_id) AS summa,
                    
                    (SELECT SUM(CASE
                                  WHEN ptype = i_type THEN
                                   1
                                  ELSE
                                   0
                                END)
                       FROM (SELECT CASE
                                      WHEN f.c3_client != f.c3_upr AND
                                           f.c3_type = 'UPR' THEN
                                       'DOV'
                                      ELSE
                                       f.c3_type
                                    END AS ptype,
                                    f.*
                               FROM d_c3_positions_h f
                              WHERE f.date_modified <= date_qry
                                AND f.date_end > date_qry
                                AND f.c3_account = acc_id
                                AND f.status_hist IN (1, 2)
                                AND f.c3_asset = asset_id) f
                      START WITH f.c3_id = a.c3_id
                     CONNECT BY PRIOR f.c3_id = f.c3_subparent_id) AS qq,
                    
                    a.*
              FROM (SELECT CASE
                              WHEN z3.c3_client != z3.c3_upr AND
                                   z3.c3_type = 'UPR' THEN
                               'DOV'
                              ELSE
                               z3.c3_type
                            END AS ptype,
                            z3.*
                       FROM d_c3_positions_h z3
                      WHERE 1 = 1
                        AND z3.date_modified <= date_qry
                        AND z3.date_end > date_qry
                        AND z3.c3_account = acc_id
                        AND z3.status_hist IN (1, 2)
                        AND z3.c3_asset = asset_id) a
            --where a.c3_type = 'UPR'
            -- and a.c3_client <> a.c3_upr
             START WITH c3_id = p_c3_id
            CONNECT BY PRIOR c3_id = c3_subparent_id --and c3_type!='BLOCK'
            )
    
     WHERE ptype = i_type
       AND qq = 1;
  
    RETURN p_sum;
  
  END;

  FUNCTION VolOfZalogUprBlockT(i_type   VARCHAR, -- BLOCK, DOV, ZALOG
                               acc_id   NUMBER,
                               date_qry DATE,
                               asset_id NUMBER) RETURN NUMBER IS
  
    p_sum   NUMBER;
    p_st    VARCHAR(4000);
    i       NUMBER;
    p_c3_id NUMBER;
  BEGIN
  
    SELECT COUNT(*)
      INTO i
      FROM d_c3_positions_h_t z3
     WHERE 1 = 1
       AND z3.date_modified <= date_qry
       AND z3.date_end > date_qry
       AND z3.c3_account = acc_id
       AND z3.status_hist IN (1, 2)
       AND z3.c3_asset = asset_id
       AND CASE
             WHEN z3.c3_client != z3.c3_upr AND z3.c3_type = 'UPR' THEN
              'DOV'
             ELSE
              z3.c3_type
           END = i_type;
  
    IF i = 0 THEN
      RETURN 0;
    END IF;
  
    SELECT z3.c3_id
      INTO p_c3_id
      FROM d_c3_positions_h_t z3
     WHERE 1 = 1
       AND z3.date_modified <= date_qry
       AND z3.date_end > date_qry
       AND z3.c3_account = acc_id
       AND z3.status_hist IN (1, 2)
       AND (z3.c3_asset = asset_id)
       AND c3_type = 'UPR'
       AND c3_client = c3_upr;
  
    SELECT SUM(summa)
      INTO p_sum
      FROM (
            
            SELECT c3_subparent_id,
                    SYS_CONNECT_BY_PATH(c3_type, '/'),
                    CONNECT_BY_ISLEAF AS isleaf,
                    (SELECT SUM(f.c3_amount)
                       FROM (SELECT *
                               FROM d_c3_positions_h_t f
                              WHERE f.date_modified <= date_qry
                                AND f.date_end > date_qry
                                AND f.c3_account = acc_id
                                AND f.status_hist IN (1, 2)
                                AND f.c3_asset = asset_id) f
                      START WITH f.c3_id = a.c3_id
                     CONNECT BY PRIOR f.c3_id = f.c3_subparent_id) AS summa,
                    
                    (SELECT SUM(CASE
                                  WHEN ptype = i_type THEN
                                   1
                                  ELSE
                                   0
                                END)
                       FROM (SELECT CASE
                                      WHEN f.c3_client != f.c3_upr AND
                                           f.c3_type = 'UPR' THEN
                                       'DOV'
                                      ELSE
                                       f.c3_type
                                    END AS ptype,
                                    f.*
                               FROM d_c3_positions_h_t f
                              WHERE f.date_modified <= date_qry
                                AND f.date_end > date_qry
                                AND f.c3_account = acc_id
                                AND f.status_hist IN (1, 2)
                                AND f.c3_asset = asset_id) f
                      START WITH f.c3_id = a.c3_id
                     CONNECT BY PRIOR f.c3_id = f.c3_subparent_id) AS qq,
                    
                    a.*
              FROM (SELECT CASE
                              WHEN z3.c3_client != z3.c3_upr AND
                                   z3.c3_type = 'UPR' THEN
                               'DOV'
                              ELSE
                               z3.c3_type
                            END AS ptype,
                            z3.*
                       FROM d_c3_positions_h_t z3
                      WHERE 1 = 1
                        AND z3.date_modified <= date_qry
                        AND z3.date_end > date_qry
                        AND z3.c3_account = acc_id
                        AND z3.status_hist IN (1, 2)
                        AND z3.c3_asset = asset_id) a
            --where a.c3_type = 'UPR'
            -- and a.c3_client <> a.c3_upr
             START WITH c3_id = p_c3_id
            CONNECT BY PRIOR c3_id = c3_subparent_id --and c3_type!='BLOCK'
            )
    
     WHERE ptype = i_type
       AND qq = 1;
  
    RETURN p_sum;
  
  END;

  FUNCTION ListOfZalogUprBlock(i_type      VARCHAR, -- BLOCK, DOV, ZALOG
                               acc_id      NUMBER,
                               date_qry    DATE,
                               asset_id    NUMBER,
                               p_is_holder NUMBER := 0) RETURN VARCHAR2 IS
  
    p_st    VARCHAR(4000);
    i       NUMBER;
    p_c3_id NUMBER;
  BEGIN
  
    SELECT COUNT(*)
      INTO i
      FROM d_c3_positions_h z3
     WHERE 1 = 1
       AND z3.date_modified <= date_qry
       AND z3.date_end > date_qry
       AND z3.c3_account = acc_id
       AND z3.status_hist IN (1, 2)
       AND z3.c3_asset = asset_id
       AND CASE
             WHEN z3.c3_client != z3.c3_upr AND z3.c3_type = 'UPR' THEN
              'DOV'
             ELSE
              z3.c3_type
           END = i_type;
  
    IF i = 0 THEN
      IF i_type <> 'BLOCK' THEN
        RETURN 0;
      ELSE
        RETURN ' ';
      END IF;
    END IF;
  
    SELECT z3.c3_id
      INTO p_c3_id
      FROM d_c3_positions_h z3
     WHERE 1 = 1
       AND z3.date_modified <= date_qry
       AND z3.date_end > date_qry
       AND z3.c3_account = acc_id
       AND z3.status_hist IN (1, 2)
       AND (z3.c3_asset = asset_id)
       AND c3_type = 'UPR'
       AND c3_client = c3_upr;
  
    SELECT bv_listagg(upr)
      INTO p_st
      FROM (
            
            SELECT DISTINCT CASE
                               WHEN summa = 0 THEN
                                '0'
                               WHEN i_type <> 'BLOCK' THEN
                                chr(10) || round8(summa) || '-' ||
                                (SELECT a1.a1_cl_fullname
                                   FROM d_a1_clients a1
                                  WHERE a1.a1_id = CASE
                                          WHEN i_type = 'DOV' THEN
                                           c3_upr
                                          WHEN i_type = 'ZALOG' THEN
                                           c3_ca
                                          ELSE
                                           c3_upr
                                        END)
                               WHEN i_type = 'BLOCK' THEN
                                chr(10) || CASE
                                  WHEN p_is_holder = 0 THEN
                                   (SELECT a1.a1_cl_name_short
                                      FROM d_a1_clients a1
                                     WHERE a1.a1_id = c3_client)
                                  ELSE
                                   (SELECT b1_nin
                                      FROM d_b1_assets b
                                     WHERE b.b1_id = c3_asset)
                                END || ' Блокировано - ' || round8(summa) ||
                                '. Основание блокирования: ' ||
                                (SELECT p3.p3_tmemo
                                   FROM d_p3_order_stock p3
                                  WHERE p3.p3_id = c3_parent_id)
                             END AS upr,
                             c3_id
              FROM (SELECT c3_subparent_id,
                            SYS_CONNECT_BY_PATH(c3_type, '/'),
                            CONNECT_BY_ISLEAF AS isleaf,
                            (SELECT SUM(f.c3_amount)
                               FROM (SELECT *
                                       FROM d_c3_positions_h f
                                      WHERE f.date_modified <= date_qry
                                        AND f.date_end > date_qry
                                        AND f.c3_account = acc_id
                                        AND f.status_hist IN (1, 2)
                                        AND f.c3_asset = asset_id) f
                              START WITH f.c3_id = a.c3_id
                             CONNECT BY PRIOR f.c3_id = f.c3_subparent_id) AS summa,
                            
                            (SELECT SUM(CASE
                                          WHEN ptype = i_type THEN
                                           1
                                          ELSE
                                           0
                                        END)
                               FROM (SELECT CASE
                                              WHEN f.c3_client != f.c3_upr AND
                                                   f.c3_type = 'UPR' THEN
                                               'DOV'
                                              ELSE
                                               f.c3_type
                                            END AS ptype,
                                            f.*
                                       FROM d_c3_positions_h f
                                      WHERE f.date_modified <= date_qry
                                        AND f.date_end > date_qry
                                        AND f.c3_account = acc_id
                                        AND f.status_hist IN (1, 2)
                                        AND f.c3_asset = asset_id) f
                              START WITH f.c3_id = a.c3_id
                             CONNECT BY PRIOR f.c3_id = f.c3_subparent_id) AS qq,
                            
                            a.*
                       FROM (SELECT CASE
                                      WHEN z3.c3_client != z3.c3_upr AND
                                           z3.c3_type = 'UPR' THEN
                                       'DOV'
                                      ELSE
                                       z3.c3_type
                                    END AS ptype,
                                    z3.*
                               FROM d_c3_positions_h z3
                              WHERE 1 = 1
                                AND z3.date_modified <= date_qry
                                AND z3.date_end > date_qry
                                AND z3.c3_account = acc_id
                                AND z3.status_hist IN (1, 2)
                                AND z3.c3_asset = asset_id) a
                     --where a.c3_type = 'UPR'
                     -- and a.c3_client <> a.c3_upr
                      START WITH c3_id = p_c3_id
                     CONNECT BY PRIOR c3_id = c3_subparent_id --and c3_type!='BLOCK'
                     )
            
             WHERE ptype = i_type)
    --and qq = 1
    ;
    IF instr(p_st, ',') <> 0 THEN
      RETURN substr(p_st, 2);
    ELSE
      RETURN p_st;
    END IF;
  
  END;

  FUNCTION ListOfZalogUprBlockT(i_type      VARCHAR, -- BLOCK, DOV, ZALOG
                                acc_id      NUMBER,
                                date_qry    DATE,
                                asset_id    NUMBER,
                                p_is_holder NUMBER := 0) RETURN VARCHAR2 IS
  
    p_st    VARCHAR(4000);
    i       NUMBER;
    p_c3_id NUMBER;
  BEGIN
  
    SELECT COUNT(*)
      INTO i
      FROM d_c3_positions_h_t z3
     WHERE 1 = 1
       AND z3.date_modified <= date_qry
       AND z3.date_end > date_qry
       AND z3.c3_account = acc_id
       AND z3.status_hist IN (1, 2)
       AND z3.c3_asset = asset_id
       AND CASE
             WHEN z3.c3_client != z3.c3_upr AND z3.c3_type = 'UPR' THEN
              'DOV'
             ELSE
              z3.c3_type
           END = i_type;
  
    IF i = 0 THEN
      IF i_type <> 'BLOCK' THEN
        RETURN 0;
      ELSE
        RETURN ' ';
      END IF;
    END IF;
  
    SELECT z3.c3_id
      INTO p_c3_id
      FROM d_c3_positions_h_t z3
     WHERE 1 = 1
       AND z3.date_modified <= date_qry
       AND z3.date_end > date_qry
       AND z3.c3_account = acc_id
       AND z3.status_hist IN (1, 2)
       AND (z3.c3_asset = asset_id)
       AND c3_type = 'UPR'
       AND c3_client = c3_upr;
  
    SELECT bv_listagg(upr)
      INTO p_st
      FROM (
            
            SELECT DISTINCT CASE
                               WHEN summa = 0 THEN
                                '0'
                               WHEN i_type <> 'BLOCK' THEN
                                chr(10) || round8(summa) || '-' ||
                                (SELECT a1.a1_cl_fullname
                                   FROM d_a1_clients a1
                                  WHERE a1.a1_id = CASE
                                          WHEN i_type = 'DOV' THEN
                                           c3_upr
                                          WHEN i_type = 'ZALOG' THEN
                                           c3_ca
                                          ELSE
                                           c3_upr
                                        END)
                               WHEN i_type = 'BLOCK' THEN
                                chr(10) || CASE
                                  WHEN p_is_holder = 0 THEN
                                   (SELECT a1.a1_cl_name_short
                                      FROM d_a1_clients a1
                                     WHERE a1.a1_id = c3_client)
                                  ELSE
                                   (SELECT b1_nin
                                      FROM d_b1_assets b
                                     WHERE b.b1_id = c3_asset)
                                END || ' Блокировано - ' || round8(summa) ||
                                '. Основание блокирования: ' ||
                                (SELECT p3.p3_tmemo
                                   FROM d_p3_order_stock p3
                                  WHERE p3.p3_id = c3_parent_id)
                             END AS upr,
                             c3_id
            
              FROM (
                     
                     SELECT c3_subparent_id,
                             SYS_CONNECT_BY_PATH(c3_type, '/'),
                             CONNECT_BY_ISLEAF AS isleaf,
                             (SELECT SUM(f.c3_amount)
                                FROM (SELECT *
                                        FROM d_c3_positions_h_t f
                                       WHERE f.date_modified <= date_qry
                                         AND f.date_end > date_qry
                                         AND f.c3_account = acc_id
                                         AND f.status_hist IN (1, 2)
                                         AND f.c3_asset = asset_id) f
                               START WITH f.c3_id = a.c3_id
                              CONNECT BY PRIOR f.c3_id = f.c3_subparent_id) AS summa,
                             
                             (SELECT SUM(CASE
                                           WHEN ptype = i_type THEN
                                            1
                                           ELSE
                                            0
                                         END)
                                FROM (SELECT CASE
                                               WHEN f.c3_client != f.c3_upr AND
                                                    f.c3_type = 'UPR' THEN
                                                'DOV'
                                               ELSE
                                                f.c3_type
                                             END AS ptype,
                                             f.*
                                        FROM d_c3_positions_h_t f
                                       WHERE f.date_modified <= date_qry
                                         AND f.date_end > date_qry
                                         AND f.c3_account = acc_id
                                         AND f.status_hist IN (1, 2)
                                         AND f.c3_asset = asset_id) f
                               START WITH f.c3_id = a.c3_id
                              CONNECT BY PRIOR f.c3_id = f.c3_subparent_id) AS qq,
                             
                             a.*
                       FROM (SELECT CASE
                                       WHEN z3.c3_client != z3.c3_upr AND
                                            z3.c3_type = 'UPR' THEN
                                        'DOV'
                                       ELSE
                                        z3.c3_type
                                     END AS ptype,
                                     z3.*
                                FROM d_c3_positions_h_t z3
                               WHERE 1 = 1
                                 AND z3.date_modified <= date_qry
                                 AND z3.date_end > date_qry
                                 AND z3.c3_account = acc_id
                                 AND z3.status_hist IN (1, 2)
                                 AND z3.c3_asset = asset_id) a
                     --where a.c3_type = 'UPR'
                     -- and a.c3_client <> a.c3_upr
                      START WITH c3_id = p_c3_id
                     CONNECT BY PRIOR c3_id = c3_subparent_id --and c3_type!='BLOCK'
                     )
            
             WHERE ptype = i_type
               AND summa <> 0)
    --and qq = 1
    ;
  
    RETURN substr(p_st, 2);
  
  END;

  FUNCTION GetNINOnDate(p_nin VARCHAR2, p_date DATE) RETURN VARCHAR2 AS
    res VARCHAR2(36);
  BEGIN
    SELECT b1_nin
      INTO res
      FROM d_b1_assets_h b
     WHERE b.b1_id =
           (SELECT a.b1_id FROM d_b1_assets a WHERE a.b1_nin = p_nin)
       AND b.date_modified <= p_date
       AND b.date_end > p_date;
    RETURN res;
  EXCEPTION
    WHEN no_data_found THEN
      RETURN p_nin;
  END;

  FUNCTION GetDateNin(p_nin VARCHAR2, p_date DATE) RETURN DATE AS
    res DATE;
    i   NUMBER;
  BEGIN
    SELECT COUNT(*)
      INTO i
      FROM d_b1_assets_h a
     WHERE a.b1_nin = p_nin
       AND a.date_modified <= p_date
       AND a.date_end > p_date;
    IF i = 0 THEN
      SELECT MIN(date_modified)
        INTO res
        FROM d_b1_assets_h
       WHERE b1_nin = p_nin;
    ELSE
      res := p_date;
    END IF;
    RETURN res;
  END;

  FUNCTION GetCancellationDesc(p_asset_id   NUMBER,
                               p_emitent_id NUMBER := NULL) RETURN VARCHAR2 AS
    res VARCHAR2(555);
    i   NUMBER;
  BEGIN
    SELECT COUNT(*)
      INTO i
      FROM d_p2_orderasset p
     WHERE (p.p2_asset = p_asset_id OR
           (p_asset_id IS NULL AND p.p2_client = p_emitent_id))
       AND p.p2_ord_type = 105;
  
    IF i <> 0 THEN
      SELECT MAX('Выпуск ценных бумаг аннулирован ' ||
                 to_char(p.p2_exec_date, 'dd.mm.yyyy'))
        INTO res
        FROM d_p2_orderasset p
       WHERE (p.p2_asset = p_asset_id OR
             (p_asset_id IS NULL AND p.p2_client = p_emitent_id))
         AND p.p2_ord_type = 105
         AND p.p2_status = 0;
    END IF;
  
    RETURN nvl(res, ' ');
  END;

  FUNCTION IsShowSigner(P_ID NUMBER) RETURN NUMBER AS
    vRes NUMBER;
  BEGIN
    SELECT COUNT(*)
      INTO vRes
      FROM d_p4_orderinfo
     WHERE id = p_id
       AND branch = 'LK';
  
    IF vRes > 0 THEN
      RETURN 0;
    ELSE
      RETURN 1;
    END IF;
  END;

  FUNCTION ercbAddress RETURN VARCHAR2 AS
  BEGIN
    RETURN adm_pkg.get_param_value('ADDRESS');
  END;

  FUNCTION GetDealHistoryTitle(P_ID NUMBER) RETURN VARCHAR2 AS
    res VARCHAR2(2000);
  BEGIN
    -- История сделок с ценными бумагами Наименование эмитента (НИН) за период с      по
    SELECT CASE
             WHEN p4.order_type IN (561.1, 61.1) THEN
              'История сделок с ' || CASE
                WHEN a.b1_as_type = '05' THEN
                 'долями'
                ELSE
                 'ценными бумагами'
              END || chr(10) || CASE
                WHEN p4.p4_nsin IS NOT NULL THEN
                 (SELECT a1_cl_name_short
                    FROM d_a1_clients
                   WHERE a1_id = (SELECT b1_client
                                    FROM d_b1_assets
                                   WHERE b1_nin = p4.p4_nsin)) || ' (' ||
                 p4.p4_nsin || ')'
                ELSE
                 ''
              END || CASE
                WHEN p4.begdate IS NULL AND p4.enddate IS NULL THEN
                 ' за период с ' ||
                 to_char(a.b1_date_reg_ercb, 'dd.mm.yyyy hh24:mi:ss') || ' по ' ||
                 to_char(nvl(p4.user_exec_date, SYSDATE),
                         'dd.mm.yyyy hh24:mi:ss')
                ELSE
                 ' за период с ' ||
                 to_char(p4.begdate, 'dd.mm.yyyy hh24:mi:ss') || ' по ' ||
                 to_char(p4.enddate, 'dd.mm.yyyy hh24:mi:ss')
              END
             WHEN p4.order_type = 62.2 THEN
              'История сделок с долями товарищества ' || chr(10) || /* case
                                                                                                        when p4.p4_nsin is not null then
                                                                                                         (select a1_cl_name_short
                                                                                                            from d_a1_clients
                                                                                                           where a1_id = (select b1_client
                                                                                                                            from d_b1_assets
                                                                                                                           where b1_nin = p4.p4_nsin)) || ' (' ||
                                                                                                         p4.p4_nsin || ') '
                                                                                                        else
                                                                                                         ''
                                                                                                      end || 'по лицевому счету ' || a1.a1_cl_name_short || chr(10) ||*/
              CASE
                WHEN p4.begdate IS NULL AND p4.enddate IS NULL THEN
                 ' за весь период обслуживания'
                ELSE
                 ' за период с ' ||
                 to_char(p4.begdate, 'dd.mm.yyyy hh24:mi:ss') || ' по ' ||
                 to_char(p4.enddate, 'dd.mm.yyyy hh24:mi:ss')
              END
             ELSE
             
              'История сделок с ' || CASE
                WHEN a.b1_as_type = '05' THEN
                 'долями'
                ELSE
                 'ценными бумагами'
              END || chr(10) || CASE
                WHEN p4.p4_nsin IS NOT NULL THEN
                 (SELECT a1_cl_name_short
                    FROM d_a1_clients
                   WHERE a1_id = (SELECT b1_client
                                    FROM d_b1_assets
                                   WHERE b1_nin = p4.p4_nsin)) || CASE
                   WHEN p4.order_type IN (562.2) THEN
                    ''
                   ELSE
                    ' (' || p4.p4_nsin || ') '
                 END
                ELSE
                 ''
              END || CASE
                WHEN p4.order_type IN (562.2) THEN
                 ''
                ELSE
                 'по лицевому счету ' || a1.a1_cl_name_short
              END || chr(10) || CASE
                WHEN p4.begdate IS NULL AND p4.enddate IS NULL THEN
                 ' за весь период обслуживания'
                ELSE
                 ' за период с ' ||
                 to_char(p4.begdate, 'dd.mm.yyyy hh24:mi:ss') || ' по ' ||
                 to_char(p4.enddate, 'dd.mm.yyyy hh24:mi:ss')
              END
           END AS title
      INTO res
      FROM d_p4_orderinfo p4
      JOIN d_a1_clients a1
        ON (a1.a1_id = p4.client)
      LEFT JOIN d_b1_assets a
        ON a.b1_id = p4.asset
     WHERE id = p_id;
  
    RETURN res;
  END;

  FUNCTION GetLinkedAssetID(p_id NUMBER) RETURN NUMBER AS
    vRes NUMBER;
  BEGIN
    SELECT CASE
             WHEN a1.b1_as_type = '06' THEN
              a1.b1_linked_asset_id
             ELSE
              a1.b1_id
           END
      INTO vRes
      FROM d_b1_assets a1
     WHERE a1.b1_id = p_id;
    RETURN vRes;
  END;

  FUNCTION GetLinkedAssetNIN(p_id NUMBER) RETURN VARCHAR2 AS
    vRes VARCHAR2(12);
  BEGIN
    SELECT CASE
             WHEN a1.b1_as_type = '06' THEN
              (SELECT b1_nin
                 FROM d_b1_assets a
                WHERE a.b1_linked_asset_id = p_id)
             ELSE
              a1.b1_nin
           END
      INTO vRes
      FROM d_b1_assets a1
     WHERE a1.b1_id = p_id;
    RETURN vRes;
  END;

END TISR_JASPER_PKG;
/
