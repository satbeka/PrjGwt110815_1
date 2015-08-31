package com.mySampleApplication.server;



import com.mySampleApplication.server.common.FileLoad;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.Hashtable;


public class DownloadFileServlet extends HttpServlet {
    private static final long serialVersionUID = 1000L;
    static final private String CONTENT_TYPE_CHARSET = "charset=windows-1251";
    public static Hashtable<String, FileItemMy> sendFiles = new Hashtable<String, FileItemMy>();


    protected void doGet( HttpServletRequest req, HttpServletResponse resp ) throws ServletException, IOException
    {
        //String fileName = req.getParameter( "fileInfo1" );
        String url = req.getParameter( "fileURL" );
        System.out.println("url="+url);

        //FileLoad.download(url);

        /*
        int BUFFER = 1024 * 100;
        //resp.setContentType("application/octet-stream");
        resp.setContentType("pdf"+ "; " + CONTENT_TYPE_CHARSET);

        //resp.setHeader( "Content-Disposition:", "attachment;filename=" + "\"" + fileName + "\"" );
        resp.setHeader( "Content-Disposition:", "attachment;filename=ustav.pdf" );
        ServletOutputStream outputStream = resp.getOutputStream();
        resp.setContentLength( Long.valueOf( FileLoad.getFileName(fileName).length() ).intValue() );
        resp.setBufferSize( BUFFER );
        //Your IO code goes here to create a file and set to outputStream//
        */

    }



    protected void doGet22(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //resp.setContentType("text/csv"); // Tell browser what content type the response body represents, so that it can associate it with e.g. MS Excel, if necessary.
        //resp.setHeader("Content-Disposition", "attachment; filename=name.csv"); // Force "Save As" dialogue.
        //resp.getWriter().write(csvAsString); // Write CSV file to response. This will be saved in the location specified by the user.


        try {
            String type = req.getParameter("type");
            String delete = req.getParameter("delete");
            String uuid = req.getParameter("uuid");
            System.out.println("Получена команда doGet, type=" + type + ", uuid=" + uuid);


            if (type.equals("LoadFile")) {
                FileItemMy fileItemMy = sendFiles.get(uuid);
                if (fileItemMy == null) {
                    System.out.println("не найден файл с GUID=" );

                }

                String fileName = fileItemMy.getFileName();

                //todo разобраться почему файлы приходят не на русском языке
                //      fileName = new String(fileName.getBytes("windows-1251"), Charset.forName("windows-1251"));

                String fileNameTemp = fileItemMy.getFileNameTemp();

                String sContentType = fileItemMy.getContentType();

                //  Log.wInfo("Найдено описание файла fileName=" + fileName + ", fileNameTemp=" + fileNameTemp + ", sContentType=" + sContentType + ", GUID=" + uuid + ",sendFiles.size=" + sendFiles.size());
                resp.setContentType(sContentType + "; " + CONTENT_TYPE_CHARSET);


                fileName = new String(fileName.getBytes("Cp1251"), "Cp1252");
                //fileName = URLEncoder.encode(fileName, "utf-8");
                //resp.setHeader("Content-Disposition", "attachment; filename*="+URLEncoder.encode(fileName, "utf-8"));
                resp.setHeader("Content-Disposition", "attachment; filename=" + fileName);


                // fileName = new String(fileName.getBytes("Cp1251"),"Cp1252");

                //resp.setHeader("Content-Disposition", "attachment; filename*=\"utf-8''" + fileName + "");
                // resp.setHeader("Content-Disposition", "attachment; filename*=\"'windows-1252''" + fileName + "");

                InputStream stream = new FileInputStream(fileNameTemp);
                //copyFromInputStreamToOutputStream(stream, resp.getOutputStream());

                if (fileItemMy != null) {
                    sendFiles.remove(fileItemMy);
                    File file = new File(fileNameTemp);
                    /*if (file.delete()) {
                        Log.wInfo("Временный файл удален =" + fileNameTemp);
                    }
                    */
                    System.out.println("sendFiles.size=" + sendFiles.size());
                }

                System.out.println("Данные скопированны в поток ");
            } else if (type.equals("MobileTest")) {
                ArrayList<String> list = new ArrayList<String>();
                list.add("КФБ");
                list.add("Международный рынок");
                list.add("Мой портфель");
                list.add(uuid);


                // write to byte array
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                DataOutputStream out = new DataOutputStream(baos);
                for (String element : list) {
                    out.writeUTF(element);
                }
                byte[] bytes = baos.toByteArray();

// read from byte array
                InputStream bais = new ByteArrayInputStream(bytes);
                /*DataInputStream in = new DataInputStream(bais);
                while (in.available() > 0) {
                    String element = in.readUTF();
                    System.out.println(element);
                }
                */
                resp.setContentType(req.getParameter("ContentType"));
                resp.setHeader("Content-Disposition", "uuid=" + uuid);

                //copyFromInputStreamToOutputStream(bais, resp.getOutputStream());
                resp.getBufferSize();
            }
        } catch (Exception e) {
            System.out.println(e);
        }






    }


}

