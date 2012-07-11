// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.honnix.crm.domain;

import com.honnix.crm.domain.Company;
import com.honnix.crm.domain.CompanyDataOnDemand;
import com.honnix.crm.domain.CompanyIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CompanyIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CompanyIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CompanyIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: CompanyIntegrationTest: @Transactional;
    
    @Autowired
    private CompanyDataOnDemand CompanyIntegrationTest.dod;
    
    @Test
    public void CompanyIntegrationTest.testCountCompanys() {
        Assert.assertNotNull("Data on demand for 'Company' failed to initialize correctly", dod.getRandomCompany());
        long count = Company.countCompanys();
        Assert.assertTrue("Counter for 'Company' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CompanyIntegrationTest.testFindCompany() {
        Company obj = dod.getRandomCompany();
        Assert.assertNotNull("Data on demand for 'Company' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Company' failed to provide an identifier", id);
        obj = Company.findCompany(id);
        Assert.assertNotNull("Find method for 'Company' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Company' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void CompanyIntegrationTest.testFindAllCompanys() {
        Assert.assertNotNull("Data on demand for 'Company' failed to initialize correctly", dod.getRandomCompany());
        long count = Company.countCompanys();
        Assert.assertTrue("Too expensive to perform a find all test for 'Company', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Company> result = Company.findAllCompanys();
        Assert.assertNotNull("Find all method for 'Company' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Company' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CompanyIntegrationTest.testFindCompanyEntries() {
        Assert.assertNotNull("Data on demand for 'Company' failed to initialize correctly", dod.getRandomCompany());
        long count = Company.countCompanys();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Company> result = Company.findCompanyEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Company' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Company' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void CompanyIntegrationTest.testFlush() {
        Company obj = dod.getRandomCompany();
        Assert.assertNotNull("Data on demand for 'Company' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Company' failed to provide an identifier", id);
        obj = Company.findCompany(id);
        Assert.assertNotNull("Find method for 'Company' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCompany(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Company' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void CompanyIntegrationTest.testMergeUpdate() {
        Company obj = dod.getRandomCompany();
        Assert.assertNotNull("Data on demand for 'Company' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Company' failed to provide an identifier", id);
        obj = Company.findCompany(id);
        boolean modified =  dod.modifyCompany(obj);
        Integer currentVersion = obj.getVersion();
        Company merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Company' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void CompanyIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Company' failed to initialize correctly", dod.getRandomCompany());
        Company obj = dod.getNewTransientCompany(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Company' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Company' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Company' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void CompanyIntegrationTest.testRemove() {
        Company obj = dod.getRandomCompany();
        Assert.assertNotNull("Data on demand for 'Company' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Company' failed to provide an identifier", id);
        obj = Company.findCompany(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Company' with identifier '" + id + "'", Company.findCompany(id));
    }
    
}
