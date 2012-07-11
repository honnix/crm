// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.honnix.crm.domain;

import com.honnix.crm.domain.CartOrder;
import com.honnix.crm.domain.LineItem;
import com.honnix.crm.domain.LineItemDataOnDemand;
import com.honnix.crm.domain.ProductDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect LineItemDataOnDemand_Roo_DataOnDemand {
    
    declare @type: LineItemDataOnDemand: @Component;
    
    private Random LineItemDataOnDemand.rnd = new SecureRandom();
    
    private List<LineItem> LineItemDataOnDemand.data;
    
    @Autowired
    private ProductDataOnDemand LineItemDataOnDemand.productDataOnDemand;
    
    public LineItem LineItemDataOnDemand.getNewTransientLineItem(int index) {
        LineItem obj = new LineItem();
        setCartOrderId(obj, index);
        setQuantity(obj, index);
        return obj;
    }
    
    public void LineItemDataOnDemand.setCartOrderId(LineItem obj, int index) {
        CartOrder cartOrderId = null;
        obj.setCartOrderId(cartOrderId);
    }
    
    public void LineItemDataOnDemand.setQuantity(LineItem obj, int index) {
        Long quantity = new Integer(index).longValue();
        obj.setQuantity(quantity);
    }
    
    public LineItem LineItemDataOnDemand.getSpecificLineItem(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        LineItem obj = data.get(index);
        Long id = obj.getId();
        return LineItem.findLineItem(id);
    }
    
    public LineItem LineItemDataOnDemand.getRandomLineItem() {
        init();
        LineItem obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return LineItem.findLineItem(id);
    }
    
    public boolean LineItemDataOnDemand.modifyLineItem(LineItem obj) {
        return false;
    }
    
    public void LineItemDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = LineItem.findLineItemEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'LineItem' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<LineItem>();
        for (int i = 0; i < 10; i++) {
            LineItem obj = getNewTransientLineItem(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
