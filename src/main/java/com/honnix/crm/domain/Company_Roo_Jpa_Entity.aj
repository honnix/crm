// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.honnix.crm.domain;

import com.honnix.crm.domain.Company;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;

privileged aspect Company_Roo_Jpa_Entity {
    
    declare @type: Company: @Entity;
    
    declare @type: Company: @Table(schema = "PUBLIC", name = "COMPANY");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Long Company.id;
    
    @Version
    @Column(name = "version")
    private Integer Company.version;
    
    public Long Company.getId() {
        return this.id;
    }
    
    public void Company.setId(Long id) {
        this.id = id;
    }
    
    public Integer Company.getVersion() {
        return this.version;
    }
    
    public void Company.setVersion(Integer version) {
        this.version = version;
    }
    
}