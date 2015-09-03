package com.mySampleApplication.client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.core.client.GWT;
import com.google.gwt.dom.client.Style;
import com.google.gwt.i18n.server.Message;
import com.google.gwt.user.client.Timer;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.*;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.event.dom.client.ClickEvent;
import com.mySampleApplication.server.common.FileLoad;


/**
 * Entry point classes define <code>onModuleLoad()</code>
 */
public class MySampleApplication implements EntryPoint {

    /**
     * This is the entry point method.
     */
    public void onModuleLoad() {
        final Button button = new Button("Click me");
        final Label label = new Label();

        button.addClickHandler(new ClickHandler() {
            public void onClick(ClickEvent event) {
                if (label.getText().equals("")) {
                    MySampleApplicationService.App.getInstance().getMessage("Hello, World!", new MyAsyncCallback(label));
                } else {
                    label.setText("");
                }
            }
        });

        // Assume that the host HTML has elements defined whose
        // IDs are "slot1", "slot2".  In a real app, you probably would not want
        // to hard-code IDs.  Instead, you could, for example, search for all
        // elements with a particular CSS class and replace them with widgets.
        //
        RootPanel.get("slot1").add(button);
        RootPanel.get("slot2").add(label);


        String url_test="http://www.kase.kz/files/for_shareholders/ustav.pdf";

        final Label labelText = new Label("Load from Url: ");
        final TextBox textBox = new TextBox();
        textBox.setText(url_test);
        textBox.setVisibleLength(100);
        textBox.setTitle("Load from Url: ");

        //set style name for entire widget
        labelText.addStyleName("gwt-Blue-Border");
        //labelText.asWidget();


        VerticalPanel panel = new VerticalPanel();
        //create a FormPanel
        final FormPanel form = new FormPanel();

        labelText.setStyleName("lblFirst");
        panel.add(labelText);

        panel.add(textBox);

        //create upload button
        Button uploadButton = new Button("Upload File toDownload thru Servlet");
        //pass action to the form to point to service handling file
        //receiving operation.
        //form.setAction("http://www.tutorialspoint.com/gwt/myFormHandler");
        // set form to use the POST method, and multipart MIME encoding.
        form.setEncoding(FormPanel.ENCODING_MULTIPART);
        form.setMethod(FormPanel.METHOD_POST);



        /*
        final fileLoad2=new FileLoad();        //create labels
        Label selectLabel2 = new Label("Select a dir:");
        //add a label
        panel.add(selectLabel2);
        //add fileUpload widget
        panel.add(fileLoad2);
        */







        //add a button to upload the file
        panel.add(uploadButton);
        uploadButton.addClickHandler(new ClickHandler() {
            @Override
            public void onClick(ClickEvent event) {


                System.out.println("textBox.getText()=" + textBox.getText());

                //String url = GWT.getModuleBaseURL() + "downloadService?fileInfo1=" + textBox.getText();
                String url = GWT.getModuleBaseURL() + "downloadFile?fileURL=" + textBox.getText();

                Window.open(url, "_blank", "status=0,toolbar=0,menubar=0,location=0");


/*
                //get the filename to be uploaded
                String filename = fileUpload.getFilename();
                if (filename.length() == 0) {
                    Window.alert("No File Specified!");
                } else {
                    //submit the form
                    FileLoad.download(labelText.getText(), fileUpload.getName());
                }
                */



                /*
                String sFieldName = labelText.getText();
                String sContentType = cl.getString(4);

                Log.wInfo("������ ��������� ���� " + file.getName() + " ������ =" + file.getTotalSpace());
                String sGUID = ServerHelp.getGUID();

                FileItemMy itemMy = new FileItemMy(sContentType, sFieldName);
                itemMy.setFileNameTemp(file.getAbsolutePath());

                DownloadServlet.sendFiles.put(sGUID, itemMy);
                Log.wInfo("���� �������� � GUID=" + sGUID + ", ���� =" + file.getName() + ", sendFiles.size=" + DownloadServlet.sendFiles.size());
                */


            }
        });

        form.addSubmitCompleteHandler(new FormPanel.SubmitCompleteHandler() {
            @Override
            public void onSubmitComplete(FormPanel.SubmitCompleteEvent event) {
                // When the form submission is successfully completed, this
                //event is fired. Assuming the service returned a response
                //of type text/html, we can get the result text here
                Window.alert(event.getResults());
            }
        });
        panel.setSpacing(10);

        // Add form to the root panel.
        form.add(panel);

        RootPanel.get("gwtContainer").add(form);


        Label lblName=new Label("lblblbl");
        final TextBox txtName=new TextBox();
        HorizontalPanel hPanel = new HorizontalPanel();
        hPanel.setTitle("Hpanel555");
        hPanel.add(lblName);
        hPanel.add(txtName);
        hPanel.setCellWidth(lblName, "130");

        VerticalPanel vPanel = new VerticalPanel();
        vPanel.setSpacing(10);
        vPanel.add(hPanel);

        Button buttonMessage = new Button("ButtnMesag Click Me!");
        buttonMessage.addClickHandler(new ClickHandler() {
            @Override
            public void onClick(ClickEvent event) {
                Window.alert(txtName.getValue());
                txtName.setVisible(false);
            }
        });
        vPanel.add(buttonMessage);
        vPanel.setCellHorizontalAlignment(buttonMessage,
                HasHorizontalAlignment.ALIGN_RIGHT);

        DecoratorPanel panel55 = new DecoratorPanel();
        panel55.add(vPanel);

        RootPanel.get("gwtContainer").add(panel55);

        BrickPage(RootPanel.get("gwtContainer"));

        Timer t = new Timer() {
            @Override
            public void run() {
                Window.alert(" Hello where How ?");
            }
        };

        // Schedule the timer to run once in 5 seconds. 5000
        t.schedule(5000);
        t.run();




    }


    public void BrickPage(RootPanel rootPanel){
        rootPanel.setSize("1600", "900");
        rootPanel.getElement().getStyle().setPosition(Style.Position.RELATIVE);
        final AbsolutePanel absolutePanel=new AbsolutePanel();
        absolutePanel.setTitle("click me");

        absolutePanel.setSize("2344px", "2605px");
        Label labelOnPanel=new Label("ClickToMove RRR");
        absolutePanel.add(labelOnPanel,5,5);


        final Label labelYourBrick = new Label("rrr 427,10");
        absolutePanel.add(labelYourBrick,427,10);
        labelYourBrick.setSize("66px", "108px");

        Label labelDonatedFor=new Label("ttt 372, 58");
        absolutePanel.add(labelDonatedFor, 372, 58);

        Button buttonHomePage = new Button();
        buttonHomePage.setSize("115px", "55px");
        buttonHomePage.addClickHandler(new ClickHandler() {
                                           public void onClick(ClickEvent event) {

                                               int l=absolutePanel.getWidgetLeft(labelYourBrick)+50;
                                               int t=absolutePanel.getWidgetTop(labelYourBrick)+50;
                                               Window.alert("Hello BrickPage left="+l+" top="+t);

                                               absolutePanel.setWidgetPosition(labelYourBrick,l,t);

                                           }
                                       }
        );

        absolutePanel.add(buttonHomePage);

        rootPanel.add(absolutePanel);

    }

    private static class MyAsyncCallback implements AsyncCallback<String> {
        private Label label;

        public MyAsyncCallback(Label label) {
            this.label = label;
        }

        public void onSuccess(String result) {
            label.getElement().setInnerHTML(result);
        }

        public void onFailure(Throwable throwable) {
            label.setText("Failed to receive answer from com.mySampleApplication.server!");
        }
    }



}
