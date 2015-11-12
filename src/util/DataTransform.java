package util;



import java.math.BigDecimal;
import java.sql.Time;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class DataTransform {


    ///private List<Sbor> sbors;

    private Date dateSbor;
    private String idTrenirvki;
    private Time timeUpragnenie;
    private Integer puls;


    public static String getFrmtNumb(Integer nmber) {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.getDefault());
        //decimalFormat.setGroupingSize(3);
        symbols.setGroupingSeparator(' ');
        String pattern = "#,###.###";
        DecimalFormat decimalFormat = new DecimalFormat(pattern, symbols);
        //System.out.println("nmber="+nmber);
        String number = decimalFormat.format(nmber);
        //System.out.println("getfmtnumb number="+number);
        return number;
    }

    public static String getFrmtLong(Long nmber) {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.getDefault());
        //decimalFormat.setGroupingSize(3);
        symbols.setGroupingSeparator(' ');
        String pattern = "#,###.###";
        DecimalFormat decimalFormat = new DecimalFormat(pattern, symbols);
        //System.out.println("nmber="+nmber);
        String number = decimalFormat.format(nmber);
        //System.out.println("getfmtnumb number="+number);
        return number;
    }

    public static String getFrmtDcml(BigDecimal nmber) {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.getDefault());
        //decimalFormat.setGroupingSize(3);
        symbols.setGroupingSeparator(' ');
        String pattern = "###,###.00";
        DecimalFormat decimalFormat = new DecimalFormat(pattern, symbols);
        //System.out.println("getfmt dec  Dcml nmber="+nmber);
        if (nmber == null) {
            return null;
        }
        String number = decimalFormat.format(nmber);

        //System.out.println("Dcml number="+number);
        return number;
    }


    public static String getRusCod(String engCod) {
        //System.out.println("engCod="+engCod);
        if (engCod.contains("JURRZ")) {
            //System.out.println(" ur lico   ");
            return "Юр.лицо    " + "\n" + " (резидент РК)";
        }
        if (engCod.contains("FIZRZ")) {
            return "Физ.лицо (резидент РК)";
        }
        if (engCod.contains("JURNN")) {
            return "Юр.лицо       \"+\"\\n\"+\" (нерезидент)";
        }
        if (engCod.contains("FIZNN")) {
            return "Физ.лицо (нерезидент)";
        }

        if (engCod.contains("STBNK")) {
            return "Банк второго уровня РК";
        }
        if (engCod.contains("INSOR")) {
            return "Страховая организация РК";
        }


        return engCod;
    }


    /*
    public static ArrayList<String[]> getTWLTCSTATUS(ArrayList<TWLTCSTATUS> arrayList) {

        //"Sbori","name","data_sbora"
        System.out.println("getgetTWLTCSTATUS=" + arrayList);

        int k = 0;
        TWLTCSTATUS twltcstatus;
        String str;
        int size=arrayList.size();
        ArrayList<String[]> arrRez=new ArrayList();

        for (int i = 0; i < size; i++) {
            twltcstatus=arrayList.get(i);
            String[] arrV=new String[size];
            arrV[0]=twltcstatus.getId();
            arrV[1]=twltcstatus.getvTCSTATUS();
            arrV[2]=twltcstatus.getvTCSTATUS_RU();
            System.out.println("arrV="+arrV);
            arrRez.add(arrV);
        }



        System.out.println("-----------");
        //System.out.println(listTisr_non_market);

        return arrRez;

    }

    public static ArrayList<String[]> getTTCPERSONAL(ArrayList<TTCPERSONAL> arrayList) {

        //"Sbori","name","data_sbora"
        System.out.println("getgetTTCPERSONAL=" + arrayList);

        int k = 0;
        TTCPERSONAL tTCPERSONAL;
        String str;
        int size=arrayList.size();
        ArrayList<String[]> arrRez=new ArrayList();

        for (int i = 0; i < size; i++) {
            tTCPERSONAL=arrayList.get(i);
            String[] arrV=new String[size];
            arrV[0]=tTCPERSONAL.getId();
            arrV[2]=tTCPERSONAL.getvFIRSTNAME();
            arrV[3]=tTCPERSONAL.getvMIDDLENAME();
            arrV[1]=tTCPERSONAL.getvSURNAME();

            System.out.println("arrV="+arrV);
            arrRez.add(arrV);
        }



        System.out.println("-----------");
        //System.out.println(listTisr_non_market);

        return arrRez;

    }

    public static ArrayList<String[]> getTWLMVALUES(ArrayList<TWLMVALUES> arrayList) {

        //"Sbori","name","data_sbora"
        System.out.println("getgetTWLMVALUES=" + arrayList);

        int k = 0;
        TWLMVALUES tTWLMVALUES;
        String str;
        int size=arrayList.size();
        ArrayList<String[]> arrRez=new ArrayList();

        for (int i = 0; i < size; i++) {
            tTWLMVALUES=arrayList.get(i);
            String[] arrV=new String[size];
            arrV[0]=tTWLMVALUES.getId();
            arrV[1]=tTWLMVALUES.getvMPULSEP10S_b();
            arrV[2]=tTWLMVALUES.getvTCAMPID();
            arrV[3]=tTWLMVALUES.getvTCSID();
            arrV[4]=tTWLMVALUES.getvTCAMPID();
            arrV[5]=tTWLMVALUES.getvTCTID();
            arrV[6]=tTWLMVALUES.getvTRAININGDATE();
            arrV[7]=tTWLMVALUES.getvTRAININGDUR_V();
            arrV[8]=tTWLMVALUES.getvTRAININGID();
            arrV[9]=tTWLMVALUES.getvTTSEQUENCE();




            System.out.println("arrV="+arrV);
            arrRez.add(arrV);
        }



        System.out.println("-----------");
        //System.out.println(listTisr_non_market);

        return arrRez;

    }




    public static ArrayList<String[]> getSbor(ArrayList<Sbor> sborArrayList) {

        //"Sbori","name","data_sbora"
        System.out.println("getSbor=" + sborArrayList);

        int k = 0;
        Sbor sbor;
        String str;
        int size=sborArrayList.size();
        ArrayList<String[]> arrRez=new ArrayList();

        for (int i = 0; i < size; i++) {
            sbor=sborArrayList.get(i);
            String[] arrV=new String[size];
            arrV[0]=sbor.getId();
            arrV[1]=sbor.getName();
            arrV[2]= DataTransform.getDateToStr(sbor.getData_sbora());
            System.out.println("arrV="+arrV);
            arrRez.add(arrV);
        }



        System.out.println("-----------");
        //System.out.println(listTisr_non_market);

        return arrRez;

    }


    public static ArrayList<String> getSborCsv(ArrayList<Sbor> sborArrayList) {

        ArrayList<String> arrRez=new ArrayList<>();
        //"Sbori","name","data_sbora"
        System.out.println("getSborScv=" + sborArrayList);

            int k = 0;
        Sbor sbor;
        String str;

        for (int i = 0; i < sborArrayList.size(); i++) {
            sbor=sborArrayList.get(i);
            str=sbor.getId()+";"+sbor.getName()+";"+ DataTransform.getDateToStr(sbor.getData_sbora());
            System.out.println("str="+str);
            arrRez.add(str);
        }



        System.out.println("-----------");
        //System.out.println(listTisr_non_market);

        return arrRez;

    }

*/



    public void setDate(String date) {
        this.date = date;
    }

    private String date;

    public static String getDateToStr(Date dt) {
        String rez=null;
        if (dt==null){rez="- - -";return rez;};
        SimpleDateFormat dt1 = new SimpleDateFormat("dd.MM.yyyy");
        rez=dt1.format(dt);
        return rez;
    }

    public static Date getStrToDate(String dt) {
        Date rez=null;
        if (!dt.contains(".")){
            System.out.println("date inccorect");
            return rez;};
        SimpleDateFormat dt1 = new SimpleDateFormat("dd.MM.yyyy");
        try {
            rez=dt1.parse(dt);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return rez;
    }
}
