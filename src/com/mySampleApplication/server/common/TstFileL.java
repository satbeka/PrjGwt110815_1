package com.mySampleApplication.server.common;


public class TstFileL {
    public static void main(String[] args) {


        String url_test="http://www.kase.kz/files/for_shareholders/ustav.pdf";
        //String save_path="C:\\idea prj\\888";

        FileLoad.download(url_test);
    }
}
