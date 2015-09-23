package com.mySampleApplication.client;

import com.google.gwt.event.logical.shared.AttachEvent;
import com.google.gwt.event.shared.HandlerManager;
import com.google.gwt.event.shared.HandlerRegistration;
import com.google.gwt.user.client.ui.FlowPanel;
import com.google.gwt.user.client.ui.Image;
import com.google.gwt.user.client.ui.InlineLabel;
import com.google.gwt.user.client.ui.Widget;


public class TabItem extends Widget{
    @Override
    public Widget asWidget() {
        return super.asWidget();
    }

    @Override
    protected HandlerManager createHandlerManager() {
        return super.createHandlerManager();
    }

    public TabItem(String title,String icon_res) {
        FlowPanel tabItem = new FlowPanel();
        InlineLabel tabItemTittle = new InlineLabel(title);
        tabItem.add(tabItemTittle);
        Image image = new Image();

        if (!icon_res.isEmpty()){image.setUrl(icon_res);}

        tabItem.add(image);

    }

    public TabItem() {
        super();
    }

    @Override
    public HandlerRegistration addAttachHandler(AttachEvent.Handler handler) {
        return super.addAttachHandler(handler);
    }
}
