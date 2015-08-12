package com.mySampleApplication.client.common;

/**
 * Created by SAbdikalikov on 12.08.2015.
 */
public class TstFileL {
    public static void main(String[] args) {


        String url_test="http://www.kase.kz/files/for_shareholders/ustav.pdf";
        String save_path="C:\\idea prj\\888";
        FileLoad.download(url_test, save_path);
    }
}
