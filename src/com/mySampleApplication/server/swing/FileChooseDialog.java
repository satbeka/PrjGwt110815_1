package com.mySampleApplication.server.swing;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;

/**
 * Created by SAbdikalikov on 30.08.2015.
 */
public class FileChooseDialog extends JFrame{


    public String getUrlFileName() {
        return urlFileName;
    }

    public void setUrlFileName(String urlFileName) {
        this.urlFileName = urlFileName;
    }

    private String urlFileName="ustav.pdf";

    private String url="http://www.kase.kz/files/for_shareholders/ustav.pdf";

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    private String savePath;

        private JButton buttonBrowse;

        public FileChooseDialog(String urlFileName,String url) {
            super();
            this.urlFileName = urlFileName;
            this.url=url;
            System.out.println("urlFileName="+urlFileName);
            //showSaveFileDialog();

            setLayout(new FlowLayout());
            buttonBrowse = new JButton("Save file from URL:"+this.url);
            buttonBrowse.addActionListener(new ActionListener() {

                public void actionPerformed(ActionEvent arg0) {
                    showSaveFileDialog();
                }
            });
            getContentPane().add(buttonBrowse);
            setSize(500, 200);
            setLocationRelativeTo(null);
            setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            setVisible(true);


        }



        private void showSaveFileDialog() {


/*
            // parent component of the dialog
            JFrame parentFrame = new JFrame();

            JFileChooser fileChooser = new JFileChooser();
            fileChooser.setDialogTitle("Specify a file to save");
            fileChooser.setSelectedFile(new File(urlFileName));
            int userSelection = fileChooser.showSaveDialog(parentFrame);

            if (userSelection == JFileChooser.APPROVE_OPTION) {
                File fileToSave = fileChooser.getSelectedFile();
                System.out.println("Save as file: " + fileToSave.getAbsolutePath());
                this.savePath=fileToSave.getAbsolutePath();
            }
*/


            JFileChooser fileChooser = new JFileChooser();
            fileChooser.setFileSelectionMode(JFileChooser.FILES_AND_DIRECTORIES);
            //fileChooser.showSaveDialog(null);

            fileChooser.setSelectedFile(new File(urlFileName));
            //FileChooserUI fcUi = fileChooser.getUI();

            fileChooser.setDialogTitle("Specify a file to save");


            int userSelection = fileChooser.showSaveDialog(this);
            if (userSelection == JFileChooser.APPROVE_OPTION) {
                File fileToSave = fileChooser.getSelectedFile();
                System.out.println("Save as file: " + fileToSave.getAbsolutePath());
                this.savePath=fileToSave.getAbsolutePath();
            }


        }

}
