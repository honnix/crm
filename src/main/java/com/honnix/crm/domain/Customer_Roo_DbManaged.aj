// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.honnix.crm.domain;

import com.honnix.crm.domain.CartOrder;
import com.honnix.crm.domain.Company;
import com.honnix.crm.domain.Customer;
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

privileged aspect Customer_Roo_DbManaged {
    
    @OneToMany(mappedBy = "customerId")
    private Set<CartOrder> Customer.cartOrders;
    
    @ManyToOne
    @JoinColumn(name = "COMPANY_ID", referencedColumnName = "ID", nullable = false)
    private Company Customer.companyId;
    
    @Column(name = "LAST_NAME")
    @NotNull
    private String Customer.lastName;
    
    @Column(name = "FIRST_NAME")
    @NotNull
    private String Customer.firstName;
    
    @Column(name = "EMAIL")
    @NotNull
    private String Customer.email;
    
    @Column(name = "BIRTHDAY")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date Customer.birthday;
    
    public Set<CartOrder> Customer.getCartOrders() {
        return cartOrders;
    }
    
    public void Customer.setCartOrders(Set<CartOrder> cartOrders) {
        this.cartOrders = cartOrders;
    }
    
    public Company Customer.getCompanyId() {
        return companyId;
    }
    
    public void Customer.setCompanyId(Company companyId) {
        this.companyId = companyId;
    }
    
    public String Customer.getLastName() {
        return lastName;
    }
    
    public void Customer.setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public String Customer.getFirstName() {
        return firstName;
    }
    
    public void Customer.setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String Customer.getEmail() {
        return email;
    }
    
    public void Customer.setEmail(String email) {
        this.email = email;
    }
    
    public Date Customer.getBirthday() {
        return birthday;
    }
    
    public void Customer.setBirthday(Date birthday) {
        this.birthday = birthday;
    }
    
}
