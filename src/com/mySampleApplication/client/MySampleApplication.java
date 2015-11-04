package com.mySampleApplication.client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.core.client.GWT;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.*;


/**
 * Entry point classes define <code>onModuleLoad()</code>
 */
public class MySampleApplication implements EntryPoint {

    /**
     * This is the entry point method.
     */



    private static void loadApp(String sCode) {

//Create an empty tab panel
        TabPanel tabPanel = new TabPanel();


        /*
        TabItem iconTab = new TabItem("Main","res/home_16.png");
        //iconTab.setIcon(Resources.ICONS.table());
        tabPanel.add(iconTab);
        */

        DeckPanel panelDPwork=new DeckPanel();
        Label lbl1TabWork=new Label();
        lbl1TabWork.setText("    LBL in DP1  ");

        //panel1.add(image);

        //lbl1Tab.getAbsoluteTop();
        lbl1TabWork.setWidth("20");

        panelDPwork.add(lbl1TabWork);
        //panel1.setHeight("10px");
        panelDPwork.setSize("100", "40");


        tabPanel.setTitle("TabPanel title");
        //System.out.println("tabPanel.getStyleName()=" + tabPanel.getStyleName());
        System.out.println("tabPanel.getStylePrimaryName()=" + tabPanel.getStylePrimaryName());

        HorizontalPanel panelIcon1=new HorizontalPanel();
        FormWork1 formWork1=new FormWork1();
        formWork1.panel=panelDPwork;
        FormPanel formPanel=formWork1.init();
        //panelDPwork.add(formPanel);


        panelIcon1.setTitle("panelICONwork title");
        Image image = new Image();
        image.setUrl("res/home_16.png");



        panelIcon1.add(image);
        panelIcon1.add(formWork1.labelW);
        panelIcon1.setWidth("50");

        tabPanel.add(panelDPwork, panelIcon1);

        DeckPanel panelDP2=new DeckPanel();
        Label lbl2Tab=new Label("    LBL in DP2  ");
        //lbl1Tab.setText("GgG");

        //panel1.add(image);

        HorizontalPanel panelIcon2=new HorizontalPanel();
        Label lblIcon2=new Label();
        lblIcon2.setText(" for Test Only ");
        lblIcon2.addStyleName("indTabIcn1");
        panelIcon2.setTitle("panelICoN2 title");
        Image image2 = new Image();
        image2.setUrl("res/security_agent_24.png");

        panelIcon2.add(image2);
        panelIcon2.add(lblIcon2);
        panelIcon2.setWidth("250");
        //lbl1Tab.getAbsoluteTop();
        lbl2Tab.setWidth("50");

        panelDP2.add(lbl2Tab);
        //panel1.setHeight("10px");
        //panelDP2.setSize("100", "40");
        tabPanel.add(panelDP2, panelIcon2);



        //tabPanel.add(lbl1Tab,"lbl1");
        //lbl1Tab

        /*
        Image image = new Image();
        image.setUrl("res/home_16.png");
        String tab1Title = "Main";
        HorizontalPanel panelIcon=new HorizontalPanel();
        panelIcon.setTitle(tab1Title);
        panelIcon.add(image);
        panelIcon.setWidth("20");
        */
        //create tabs


  /*
        //tabPanel.add(image);


        //create contents for tabs of tabpanel
        Label label1 = new Label("This is contents of TAB 1");
        label1.setHeight("200");
        Label label2 = new Label("This is contents of TAB 2");
        label2.setHeight("200");

        Label label3 = new Label("This tab is temporary for test");
        label3.setHeight("200");

        //create panel
        DeckPanel panel1=new DeckPanel();
        panel1.setTitle("Connect");
        panel1.setHeight("10px");
        panel1.setSize("100px","400px");

        Panel panel2=new DeckPanel();
        panel2.setTitle("Choose Language");
        panel2.setHeight("20px");
        panel2.setSize("100px", "400px");

//initWidget();

        //create titles for tabs
        //String tab1Title = "Main";
        String tab2Title = "For test 2";
        String tab3Title = "For test 3";

        //create tabs
        //tabPanel.add(panel1, tab1Title);
        tabPanel.add(panel2, tab2Title);
        tabPanel.add(label3, tab3Title);
*/


        //select first tab
        tabPanel.selectTab(0);

        //set width if tabpanel
        tabPanel.setWidth("1500");

        // Add the widgets to the root panel.
        RootPanel.get("gwtContainer").add(tabPanel);
    }

    public void onModuleLoad() {


        String systemPar = "";


        Window.addWindowClosingHandler(new Window.ClosingHandler() {
            @Override
            public void onWindowClosing(Window.ClosingEvent event) {
                event.setMessage("Close page?");
                //GxtHelp.InfoInformation("Нельзя нажимать эту кнопку.");

            }
        });

        String sCode = GWT.getHostPageBaseURL();
        System.out.println("sCode=" + sCode);

        {
            sCode = sCode.substring(sCode.lastIndexOf("/", sCode.length() - 2) + 1, sCode.length() - 1);
        }

        loadApp(sCode);

        RootPanel.get("load1").getElement().getStyle().setProperty
                ("display", "none");


    }

    ;

}



        //--<060915






















/*

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




        final fileLoad2=new FileLoad();        //create labels
        Label selectLabel2 = new Label("Select a dir:");
        //add a label
        panel.add(selectLabel2);
        //add fileUpload widget
        panel.add(fileLoad2);








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
                //



                //
                String sFieldName = labelText.getText();
                String sContentType = cl.getString(4);

                Log.wInfo("������ ��������� ���� " + file.getName() + " ������ =" + file.getTotalSpace());
                String sGUID = ServerHelp.getGUID();

                FileItemMy itemMy = new FileItemMy(sContentType, sFieldName);
                itemMy.setFileNameTemp(file.getAbsolutePath());

                DownloadServlet.sendFiles.put(sGUID, itemMy);
                Log.wInfo("���� �������� � GUID=" + sGUID + ", ���� =" + file.getName() + ", sendFiles.size=" + DownloadServlet.sendFiles.size());
                //


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


    */


//}
