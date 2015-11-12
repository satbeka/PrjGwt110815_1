package common;


import org.sqlite.JDBC;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLiteDB {

    private static String SYSTEM_DB = null;
    private static String DB_PWD=null;
    private static String DB_USERNAME=null;

    public static String getSystemDb()
    {
        if (SYSTEM_DB == null) {
            SYSTEM_DB = PropertiesBuilder.getProperty("urlSQLiteJDBC");
        }
        return SYSTEM_DB;
    }

    public static String getDbPwd()
    {
        if (DB_PWD == null) {
            DB_PWD = PropertiesBuilder.getProperty("password");
        }
        return DB_PWD;
    }

    public static String getDbUsername()
    {
        if (DB_USERNAME == null) {
            DB_USERNAME = PropertiesBuilder.getProperty("username");
        }
        return DB_USERNAME;
    }


    // --------ПОДКЛЮЧЕНИЕ К БАЗЕ ДАННЫХ--------
    public static Connection connectDB() //throws ClassNotFoundException, SQLException
    {
        Connection conn;
        conn = null;


        Driver myDriver = new org.sqlite.JDBC();
        try {
            DriverManager.registerDriver(myDriver);
        } catch (SQLException e) {
            System.out.println("connDB excep=" + e.getMessage().toString());
        }

        try {
            conn = DriverManager.getConnection(getSystemDb());
            System.out.println(getSystemDb());
            //DriverManager.getConnection("jdbc:sqlite:C:/work/mydatabase.db");
        } catch (SQLException e) {
            System.out.println("connDB 2  excep=" + e.getMessage().toString());
        }

        /*
        try {

            try {
                //Class.forName("org.sqlite.JDBC");
                Class.forName("org.sqlite.JDBC");
            } catch (ClassNotFoundException e) {
                System.out.println("connDB excep="+e.getMessage().toString());
            }

            conn = DriverManager.getConnection(getSystemDb());
        } catch (SQLException e) {
            System.out.println("connDB SQL excep=" + e.getMessage());
        }
*/

        System.out.println("DB connect!"+conn);
        return conn;
    }

}
