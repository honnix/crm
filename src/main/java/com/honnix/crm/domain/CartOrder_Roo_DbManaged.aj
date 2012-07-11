// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.honnix.crm.domain;

import com.honnix.crm.domain.CartOrder;
import com.honnix.crm.domain.Customer;
import com.honnix.crm.domain.LineItem;
import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect CartOrder_Roo_DbManaged {
    
    @OneToMany(mappedBy = "cartOrderId")
    private Set<LineItem> CartOrder.lineItems;
    
    @ManyToOne
    @JoinColumn(name = "CUSTOMER_ID", referencedColumnName = "ID", nullable = false)
    private Customer CartOrder.customerId;
    
    @Column(name = "DATE_OF_ORDER")
    @NotNull
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date CartOrder.dateOfOrder;
    
    @Column(name = "IN_CART")
    @NotNull
    private boolean CartOrder.inCart;
    
    public Set<LineItem> CartOrder.getLineItems() {
        return lineItems;
    }
    
    public void CartOrder.setLineItems(Set<LineItem> lineItems) {
        this.lineItems = lineItems;
    }
    
    public Customer CartOrder.getCustomerId() {
        return customerId;
    }
    
    public void CartOrder.setCustomerId(Customer customerId) {
        this.customerId = customerId;
    }
    
    public Date CartOrder.getDateOfOrder() {
        return dateOfOrder;
    }
    
    public void CartOrder.setDateOfOrder(Date dateOfOrder) {
        this.dateOfOrder = dateOfOrder;
    }
    
    public boolean CartOrder.isInCart() {
        return inCart;
    }
    
    public void CartOrder.setInCart(boolean inCart) {
        this.inCart = inCart;
    }
    
}
