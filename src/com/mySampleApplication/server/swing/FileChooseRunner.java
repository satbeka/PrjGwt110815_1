package com.mySampleApplication.server.swing;


/**
 * Created by SAbdikalikov on 30.08.2015.
 */
public class FileChooseRunner{

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    private String fileName;
    private String savePath;

    public void start() {

        FileChooseDialog fileChooseDialog=new FileChooseDialog(fileName);

        savePath=fileChooseDialog.getSavePath();

        /*
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) { }

        SwingUtilities.invokeLater(new Runnable() {

            public void run() {
                FileChooseDialog fileChooseDialog=new FileChooseDialog(fileName);
                savePath=fileChooseDialog.getSavePath();
            }
        });
        */

    }
}
