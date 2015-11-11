package com.mySampleApplication.client;


import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.ui.*;

public class FormWork1 {


    DeckPanel panelDW;


    public void load() {


        DeckPanel deckPanel=new DeckPanel();
        deckPanel.setSize("500", "500");
        deckPanel.addStyleName("deckpanel");



        //create button bar
        VerticalPanel buttonBar = new VerticalPanel();
        buttonBar.setSpacing(3);
        buttonBar.addStyleName("buttonBar");
        buttonBar.setSize("200", "500");


        //VerticalPanel panelVW = new VerticalPanel();
        Label lblTabWork=new Label();
        lblTabWork.setText("    Form for login  ");
        //panel1.add(image);
        //lbl1Tab.getAbsoluteTop();
        lblTabWork.getAbsoluteLeft();
        lblTabWork.setSize("200", "10");
        lblTabWork.addStyleName("gwt-Green-Border");
        buttonBar.setVerticalAlignment(HasVerticalAlignment.ALIGN_BOTTOM);

        buttonBar.add(lblTabWork);
        //deckPanel.add(lblTabWork);
        //panel1.setHeight("10px");
        //deckPanel.setSize("1000", "500");


        Label lblLogin=new Label();
        lblLogin.setText("  Your LOGIN:  ");
        //panel1.add(image);
        //lbl1Tab.getAbsoluteTop();
        //lblLogin.getAbsoluteTop();
        lblLogin.setSize("200", "10");
        lblLogin.addStyleName("gwt-Label");
        buttonBar.setVerticalAlignment(HasVerticalAlignment.ALIGN_BOTTOM);
        buttonBar.add(lblLogin);
        // Create a TextBox, giving it a name so that it will be submitted.
        TextBox tbLogin = new TextBox();
        tbLogin.setWidth("200");
        tbLogin.setName("login");
        buttonBar.setVerticalAlignment(HasVerticalAlignment.ALIGN_TOP);
        buttonBar.add(tbLogin);

        Label lblPwd=new Label();
        lblPwd.setText("  Your Password  ");
        //panel1.add(image);
        //lbl1Tab.getAbsoluteTop();
        //lblPwd.getAbsoluteTop();
        lblPwd.getAbsoluteTop();
        lblPwd.setSize("200", "10");
        lblPwd.addStyleName("gwt-Label");
        buttonBar.setVerticalAlignment(HasVerticalAlignment.ALIGN_BOTTOM);
        buttonBar.add(lblPwd);
        // Create a TextBox, giving it a name so that it will be submitted.
        TextBox tbPwd = new TextBox();
        tbPwd.setWidth("200");

        tbPwd.setName("pwd");
        buttonBar.setVerticalAlignment(HasVerticalAlignment.ALIGN_TOP);
        buttonBar.add(tbPwd);

        // Add a 'submit' button.
        buttonBar.add(new Button("Ok", new ClickHandler() {
            @Override
            public void onClick(ClickEvent event) {
                System.out.println("---");
            }
        }));


        /*
        VerticalPanel vPanel = new VerticalPanel();
        vPanel.add(deckPanel);
        vPanel.add(buttonBar);
*/

        deckPanel.add(buttonBar);

        //deckPanel.add(panelVW);
        panelDW=deckPanel;

        //show first label
        deckPanel.showWidget(0);


    }





}
