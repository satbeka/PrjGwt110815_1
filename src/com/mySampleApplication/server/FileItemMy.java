package com.mySampleApplication.server;

import java.io.Serializable;



public class FileItemMy implements Serializable {
    private String contentType;
    private String fileName;
    private String fileNameTemp;
    private String fileNameTempSource;


    public FileItemMy(String contentType, String fileName) {
        this.contentType = contentType;
        this.fileName = fileName;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileNameTemp() {
        return fileNameTemp;
    }

    public void setFileNameTemp(String fileNameTemp) {
        this.fileNameTemp = fileNameTemp;
    }

    public String getFileNameTempSource() {
        return fileNameTempSource;
    }

    public void setFileNameTempSource(String fileNameTempSource) {
        this.fileNameTempSource = fileNameTempSource;
    }
}
