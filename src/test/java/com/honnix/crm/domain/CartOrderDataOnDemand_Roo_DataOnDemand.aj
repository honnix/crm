// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.honnix.crm.domain;

import com.honnix.crm.domain.CartOrder;
import com.honnix.crm.domain.CartOrderDataOnDemand;
import com.honnix.crm.domain.CustomerDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect CartOrderDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CartOrderDataOnDemand: @Component;
    
    private Random CartOrderDataOnDemand.rnd = new SecureRandom();
    
    private List<CartOrder> CartOrderDataOnDemand.data;
    
    @Autowired
    private CustomerDataOnDemand CartOrderDataOnDemand.customerDataOnDemand;
    
    public CartOrder CartOrderDataOnDemand.getNewTransientCartOrder(int index) {
        CartOrder obj = new CartOrder();
        setDateOfOrder(obj, index);
        setInCart(obj, index);
        return obj;
    }
    
    public void CartOrderDataOnDemand.setDateOfOrder(CartOrder obj, int index) {
        Date dateOfOrder = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDateOfOrder(dateOfOrder);
    }
    
    public void CartOrderDataOnDemand.setInCart(CartOrder obj, int index) {
        Boolean inCart = true;
        obj.setInCart(inCart);
    }
    
    public CartOrder CartOrderDataOnDemand.getSpecificCartOrder(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        CartOrder obj = data.get(index);
        Long id = obj.getId();
        return CartOrder.findCartOrder(id);
    }
    
    public CartOrder CartOrderDataOnDemand.getRandomCartOrder() {
        init();
        CartOrder obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return CartOrder.findCartOrder(id);
    }
    
    public boolean CartOrderDataOnDemand.modifyCartOrder(CartOrder obj) {
        return false;
    }
    
    public void CartOrderDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = CartOrder.findCartOrderEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'CartOrder' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<CartOrder>();
        for (int i = 0; i < 10; i++) {
            CartOrder obj = getNewTransientCartOrder(i);
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