package com.mySampleApplication.client;


import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.ui.*;

public class FormWork1 {


    DeckPanel panelDW;


    public void load() {


        DeckPanel deckPanel=new DeckPanel();
        deckPanel.setSize("1000","300");
        //VerticalPanel panelVW = new VerticalPanel();
        Label lblTabWork=new Label();
        lblTabWork.setText("    LBL in DP1  ");
        //panel1.add(image);
        //lbl1Tab.getAbsoluteTop();
        lblTabWork.setWidth("20");

        /*
        panelVW.add(lblTabWork);
        //panel1.setHeight("10px");
        panelVW.setSize("1000", "500");
        */

        deckPanel.add(lblTabWork);
        //panel1.setHeight("10px");
        deckPanel.setSize("1000", "500");


        // Create a TextBox, giving it a name so that it will be submitted.
        final TextBox tb = new TextBox();
        tb.setWidth("200");

        tb.setName("textBoxFormElementW");
        deckPanel.add(tb);

        // Create a ListBox, giving it a name and
        // some values to be associated with its options.
        ListBox lb = new ListBox();
        lb.setName("listBoxFormElementW");
        lb.addItem("item1", "item1");
        lb.addItem("item2", "item2");
        lb.addItem("item3", "item3");
        lb.setWidth("220");
        deckPanel.add(lb);

        // Add a 'submit' button.
        deckPanel.add(new Button("Submit", new ClickHandler() {
            @Override
            public void onClick(ClickEvent event) {
                System.out.println("---");
            }
        }));

        //deckPanel.add(panelVW);
        panelDW=deckPanel;




    }





}
