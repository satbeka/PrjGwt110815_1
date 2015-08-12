package com.mySampleApplication.client.common;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

/**
 * Created by SAbdikalikov on 12.08.2015.
 */
public class FileLoad {

    public static Path download(String sourceUrl,
                                String targetDirectory)
    {
        URL url = null;
        try {
            url = new URL(sourceUrl);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }

        String fileName = url.getFile();

        //Path targetPath = new File(targetDirectory + fileName).toPath();
        Path targetPath = new File(targetDirectory + "/ustav.pdf").toPath();

        try {


            Files.copy(url.openStream(), targetPath,
                    StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {

            try {
                System.setProperty("http.proxyHost", "172.22.223.247");
                System.setProperty("http.proxyPort", "8080");

                Files.copy(url.openStream(), targetPath,
                        StandardCopyOption.REPLACE_EXISTING);

            } catch (IOException e2){
                e2.getMessage();
            }

        }
finally {
            System.out.println("fin close resour");
        }
        return targetPath;
    }
}
