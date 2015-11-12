package common;


public class SQLiteSQL {

    private static String SQLselListSbor = null;
    private static String SQLinsSbor=null;
    private static String SQLselMaxIdSbor=null;

    private static String SQLselListTrenirvka=null;
    private static String SQLselListUpragnenie=null;
    private static String SQLselLitogo=null;

    private static String SQLupdSbor=null;
    private static String SQLdelSbor=null;
    private static String SQLinsSprotsmens=null;
    private static String SQLupdSprotsmens=null;
    private static String SQLdelSprotsmens=null;

    private static String SQLselSprotsmens=null;


    private static String SQLselListTWLTCSTATUS=null;
    private static String SQLselMaxIdTWLTCSTATUS=null;
    private static String SQLinsTWLTCSTATUS=null;
    private static String SQLupdTWLTCSTATUS=null;
    private static String SQLdelTWLTCSTATUS=null;

    private static String SQLselListTTCPERSONAL=null;
    private static String SQLselMaxIdTTCPERSONAL=null;
    private static String SQLinsTTCPERSONAL=null;
    private static String SQLupdTTCPERSONAL=null;
    private static String SQLdelTTCPERSONAL=null;
    private static String SQLselIdTTCPERSONAL=null;

    private static String SQLselListTWLMVALUES=null;
    private static String SQLselMaxIdTWLMVALUES=null;
    private static String SQLinsTWLMVALUES=null;
    private static String SQLupdTWLMVALUES=null;
    private static String SQLdelTWLMVALUES=null;
    private static String SQLselListTWLMVALUES_wherePersAndTeam=null;


    private static String SQLselListTTCTEAMS=null;
    private static String SQLselMaxIdTTCTEAMS=null;
    private static String SQLinsTTCTEAMS=null;
    private static String SQLupdTTCTEAMS=null;
    private static String SQLdelTTCTEAMS=null;
    private static String SQLselIdTTCTEAMS=null;



    public static String getSQLselListTWLTCSTATUS()
    {
        if (SQLselListTWLTCSTATUS == null) {
            SQLselListTWLTCSTATUS = PropertiesBuilder.getProperty("SQLselListTWLTCSTATUS");
        }
        return SQLselListTWLTCSTATUS;
    }

    public static String SQLselMaxIdTWLTCSTATUS()
    {
        if (SQLselMaxIdTWLTCSTATUS == null) {
            SQLselMaxIdTWLTCSTATUS = PropertiesBuilder.getProperty("SQLselMaxIdTWLTCSTATUS");
        }
        return SQLselMaxIdTWLTCSTATUS;
    }

    public static String SQLinsTWLTCSTATUS()
    {
        if (SQLinsTWLTCSTATUS == null) {
            SQLinsTWLTCSTATUS = PropertiesBuilder.getProperty("SQLinsTWLTCSTATUS");
        }
        return SQLinsTWLTCSTATUS;
    }

    public static String SQLupdTWLTCSTATUS()
    {
        if (SQLupdTWLTCSTATUS == null) {
            SQLupdTWLTCSTATUS = PropertiesBuilder.getProperty("SQLupdTWLTCSTATUS");
        }
        return SQLupdTWLTCSTATUS;
    }

    public static String SQLdelTWLTCSTATUS()
    {
        if (SQLdelTWLTCSTATUS == null) {
            SQLdelTWLTCSTATUS = PropertiesBuilder.getProperty("SQLdelTWLTCSTATUS");
        }
        return SQLdelTWLTCSTATUS;
    }

    public static String getSQLselListTTCTEAMS()
    {
        if (SQLselListTTCTEAMS == null) {
            SQLselListTTCTEAMS = PropertiesBuilder.getProperty("SQLselListTTCTEAMS");
        }
        return SQLselListTTCTEAMS;
    }

    public static String SQLselMaxIdTTCTEAMS()
    {
        if (SQLselMaxIdTTCTEAMS == null) {
            SQLselMaxIdTTCTEAMS = PropertiesBuilder.getProperty("SQLselMaxIdTTCTEAMS");
        }
        return SQLselMaxIdTTCTEAMS;
    }

    public static String SQLinsTTCTEAMS()
    {
        if (SQLinsTTCTEAMS == null) {
            SQLinsTTCTEAMS = PropertiesBuilder.getProperty("SQLinsTTCTEAMS");
        }
        return SQLinsTTCTEAMS;
    }

    public static String SQLupdTTCTEAMS()
    {
        if (SQLupdTTCTEAMS == null) {
            SQLupdTTCTEAMS = PropertiesBuilder.getProperty("SQLupdTTCTEAMS");
        }
        return SQLupdTTCTEAMS;
    }

    public static String SQLdelTTCTEAMS()
    {
        if (SQLdelTTCTEAMS == null) {
            SQLdelTTCTEAMS = PropertiesBuilder.getProperty("SQLdelTTCTEAMS");
        }
        return SQLdelTTCTEAMS;
    }

    public static String SQLselIdTTCTEAMS()
    {
        if (SQLselIdTTCTEAMS == null) {
            SQLselIdTTCTEAMS = PropertiesBuilder.getProperty("SQLselIdTTCTEAMS");
        }
        return SQLselIdTTCTEAMS;
    }



    public static String getSQLselListTTCPERSONAL()
    {
        if (SQLselListTTCPERSONAL == null) {
            SQLselListTTCPERSONAL = PropertiesBuilder.getProperty("SQLselListTTCPERSONAL");
        }
        return SQLselListTTCPERSONAL;
    }

    public static String SQLselMaxIdTTCPERSONAL()
    {
        if (SQLselMaxIdTTCPERSONAL == null) {
            SQLselMaxIdTTCPERSONAL = PropertiesBuilder.getProperty("SQLselMaxIdTTCPERSONAL");
        }
        return SQLselMaxIdTTCPERSONAL;
    }

    public static String SQLinsTTCPERSONAL()
    {
        if (SQLinsTTCPERSONAL == null) {
            SQLinsTTCPERSONAL = PropertiesBuilder.getProperty("SQLinsTTCPERSONAL");
        }
        return SQLinsTTCPERSONAL;
    }

    public static String SQLupdTTCPERSONAL()
    {
        if (SQLupdTTCPERSONAL == null) {
            SQLupdTTCPERSONAL = PropertiesBuilder.getProperty("SQLupdTTCPERSONAL");
        }
        return SQLupdTTCPERSONAL;
    }

    public static String SQLdelTTCPERSONAL()
    {
        if (SQLdelTTCPERSONAL == null) {
            SQLdelTTCPERSONAL = PropertiesBuilder.getProperty("SQLdelTTCPERSONAL");
        }
        return SQLdelTTCPERSONAL;
    }


    public static String SQLselIdTTCPERSONAL()
    {
        if (SQLselIdTTCPERSONAL == null) {
            SQLselIdTTCPERSONAL = PropertiesBuilder.getProperty("SQLselIdTTCPERSONAL");
        }
        return SQLselIdTTCPERSONAL;
    }



    public static String SQLselListTWLMVALUES_wherePersAndTeam()
    {
        if (SQLselListTWLMVALUES_wherePersAndTeam == null) {
            SQLselListTWLMVALUES_wherePersAndTeam = PropertiesBuilder.getProperty("SQLselListTWLMVALUES_wherePersAndTeam");
        }
        return SQLselListTWLMVALUES_wherePersAndTeam;
    }

    public static String getSQLselListTWLMVALUES()
    {
        if (SQLselListTWLMVALUES == null) {
            SQLselListTWLMVALUES = PropertiesBuilder.getProperty("SQLselListTWLMVALUES");
        }
        return SQLselListTWLMVALUES;
    }

    public static String SQLselMaxIdTWLMVALUES()
    {
        if (SQLselMaxIdTWLMVALUES == null) {
            SQLselMaxIdTWLMVALUES = PropertiesBuilder.getProperty("SQLselMaxIdTWLMVALUES");
        }
        return SQLselMaxIdTTCPERSONAL;
    }

    public static String SQLinsTWLMVALUES()
    {
        if (SQLinsTWLMVALUES == null) {
            SQLinsTWLMVALUES = PropertiesBuilder.getProperty("SQLinsTWLMVALUES");
        }
        return SQLinsTWLMVALUES;
    }

    public static String SQLupdTWLMVALUES()
    {
        if (SQLupdTWLMVALUES == null) {
            SQLupdTWLMVALUES = PropertiesBuilder.getProperty("SQLupdTWLMVALUES");
        }
        return SQLupdTWLMVALUES;
    }

    public static String SQLdelTWLMVALUES()
    {
        if (SQLdelTWLMVALUES == null) {
            SQLdelTWLMVALUES = PropertiesBuilder.getProperty("SQLdelTWLMVALUES");
        }
        return SQLdelTWLMVALUES;
    }



    public static String getSQLinsSbor()
    {
        if (SQLinsSbor == null) {
            SQLinsSbor = PropertiesBuilder.getProperty("SQLinsSbor");
        }
        return SQLinsSbor;
    }

    public static String SQLselMaxIdSbor()
    {
        if (SQLselMaxIdSbor == null) {
            SQLselMaxIdSbor = PropertiesBuilder.getProperty("SQLselMaxIdSbor");
        }
        return SQLselMaxIdSbor;
    }

    public static String SQLupdSbor()
    {
        if (SQLupdSbor == null) {
            SQLupdSbor = PropertiesBuilder.getProperty("SQLupdSbor");
        }
        return SQLupdSbor;
    }

    public static String SQLdelSbor()
    {
        if (SQLdelSbor == null) {
            SQLdelSbor = PropertiesBuilder.getProperty("SQLdelSbor");
        }
        return SQLdelSbor;
    }


    public static String getSQLselListSbor()
    {
        if (SQLselListSbor == null) {
            SQLselListSbor = PropertiesBuilder.getProperty("SQLselListSbor");
        }
        return SQLselListSbor;
    }

    public static String getSQLselSprotsmens()
    {
        if (SQLselSprotsmens == null) {
            SQLselSprotsmens = PropertiesBuilder.getProperty("SQLselSprotsmens");
        }
        return SQLselSprotsmens;
    }

    public static String getSQLselListTrenirvka()
    {
        if (SQLselListTrenirvka == null) {
            SQLselListTrenirvka = PropertiesBuilder.getProperty("SQLselListTrenirvka");
        }
        return SQLselListTrenirvka;
    }

    public static String getSQLselListUpragnenie()
    {
        if (SQLselListUpragnenie == null) {
            SQLselListUpragnenie = PropertiesBuilder.getProperty("SQLselListUpragnenie");
        }
        return SQLselListUpragnenie;
    }

}