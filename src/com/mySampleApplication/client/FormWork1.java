package com.mySampleApplication.client;


import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.ui.*;

public class FormWork1 {


    DeckPanel panelDW;


    public void load() {


        DeckPanel deckPanel=new DeckPanel();
        deckPanel.setSize("500", "300");
        deckPanel.addStyleName("deckpanel");



        //create button bar
        HorizontalPanel buttonBar = new HorizontalPanel();
        buttonBar.setSpacing(10);
        buttonBar.addStyleName("buttonBar");
        buttonBar.setSize("200","200");


        //VerticalPanel panelVW = new VerticalPanel();
        Label lblTabWork=new Label();
        lblTabWork.setText("    Form for login  ");
        //panel1.add(image);
        //lbl1Tab.getAbsoluteTop();
        lblTabWork.setSize("300","10");
        lblTabWork.addStyleName("gwt-Green-Border");

        /*
        panelVW.add(lblTabWork);
        //panel1.setHeight("10px");
        panelVW.setSize("1000", "500");
        */

        buttonBar.add(lblTabWork);
        //deckPanel.add(lblTabWork);
        //panel1.setHeight("10px");
        //deckPanel.setSize("1000", "500");


        // Create a TextBox, giving it a name so that it will be submitted.
        final TextBox tb = new TextBox();
        tb.setWidth("200");

        tb.setName("textBoxFormElementW");
        buttonBar.add(tb);
        //deckPanel.add(tb);

        // Create a ListBox, giving it a name and
        // some values to be associated with its options.
        ListBox lb = new ListBox();
        lb.setName("listBoxFormElementW");
        lb.addItem("item1", "item1");
        lb.addItem("item2", "item2");
        lb.addItem("item3", "item3");
        lb.setSize("250","250");
        buttonBar.add(lb);
        //deckPanel.add(lb);


        // Add a 'submit' button.
        buttonBar.add(new Button("Submit", new ClickHandler() {
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
