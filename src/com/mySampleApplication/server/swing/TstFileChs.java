package com.mySampleApplication.server.swing;

import javax.swing.*;

/**
 * Created by SAbdikalikov on 30.08.2015.
 */
public class TstFileChs {
    public static void main(String[] args) {
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) { }

        SwingUtilities.invokeLater(new Runnable() {

            public void run() {
                new FileChooseDialog("ustav.pdf");
            }
        });
    }
}
