package com.mySampleApplication.client;


import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.*;

public class FormWork1 {

    Label labelW;
    DeckPanel  panel;


    public FormPanel init() {
        labelW = new Label("Main");
        labelW.addStyleName("indTabIcn1");

// Create a FormPanel and point it at a service.
        final FormPanel form = new FormPanel();


        // Create a panel to hold all of the form widgets.
        //DeckPanel  panel = new DeckPanel ();
        //panel.setSpacing(10);
        form.setWidget(panel);

        // Create a TextBox, giving it a name so that it will be submitted.
        final TextBox tb = new TextBox();
        tb.setWidth("220");

        tb.setName("textBoxFormElementW");
        panel.add(tb);

        // Create a ListBox, giving it a name and
        // some values to be associated with its options.
        ListBox lb = new ListBox();
        lb.setName("listBoxFormElementW");
        lb.addItem("item1", "item1");
        lb.addItem("item2", "item2");
        lb.addItem("item3", "item3");
        lb.setWidth("220");
        panel.add(lb);

        // Add a 'submit' button.
        panel.add(new Button("Submit", new ClickHandler() {
            @Override
            public void onClick(ClickEvent event) {
                form.submit();
            }
        }));

        // Add an event handler to the form.
        form.addSubmitHandler(new FormPanel.SubmitHandler() {
            @Override
            public void onSubmit(FormPanel.SubmitEvent event) {
                // This event is fired just before the form is submitted.
                // We can take this opportunity to perform validation.
                if (tb.getText().length() == 0) {
                    Window.alert("The text box must not be empty");
                    event.cancel();
                }
            }
        });

        form.addSubmitCompleteHandler(new FormPanel.SubmitCompleteHandler() {
            @Override
            public void onSubmitComplete(FormPanel.SubmitCompleteEvent event) {
                // When the form submission is successfully completed,
                // this event is fired. Assuming the service returned
                // a response of type text/html, we can get the result
                // here.
                Window.alert(event.getResults());
            }
        });
return form;



    }





}
