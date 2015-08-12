package com.mySampleApplication.client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.*;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.DOM;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.event.dom.client.ClickEvent;

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



        VerticalPanel panel = new VerticalPanel();
        //create a FormPanel
        final FormPanel form = new FormPanel();
        //create a file upload widget
        final FileUpload fileUpload = new FileUpload();
        //create labels
        Label selectLabel = new Label("Select a file:");
        //create upload button
        Button uploadButton = new Button("Upload File");
        //pass action to the form to point to service handling file
        //receiving operation.
        form.setAction("http://www.tutorialspoint.com/gwt/myFormHandler");
        // set form to use the POST method, and multipart MIME encoding.
        form.setEncoding(FormPanel.ENCODING_MULTIPART);
        form.setMethod(FormPanel.METHOD_POST);

        //add a label
        panel.add(selectLabel);
        //add fileUpload widget
        panel.add(fileUpload);
        System.out.println("fileUpload.getName()="+fileUpload.getName());


        //add a button to upload the file
        panel.add(uploadButton);
        uploadButton.addClickHandler(new ClickHandler() {
            @Override
            public void onClick(ClickEvent event) {
                //get the filename to be uploaded
                String filename = fileUpload.getFilename();
                if (filename.length() == 0) {
                    Window.alert("No File Specified!");
                } else {
                    //submit the form
                    form.submit();
                }
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
            label.setText("Failed to receive answer from server!");
        }
    }
}
