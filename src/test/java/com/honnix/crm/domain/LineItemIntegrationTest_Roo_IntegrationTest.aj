// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.honnix.crm.domain;

import com.honnix.crm.domain.LineItem;
import com.honnix.crm.domain.LineItemDataOnDemand;
import com.honnix.crm.domain.LineItemIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect LineItemIntegrationTest_Roo_IntegrationTest {
    
    declare @type: LineItemIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: LineItemIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: LineItemIntegrationTest: @Transactional;
    
    @Autowired
    private LineItemDataOnDemand LineItemIntegrationTest.dod;
    
    @Test
    public void LineItemIntegrationTest.testCountLineItems() {
        Assert.assertNotNull("Data on demand for 'LineItem' failed to initialize correctly", dod.getRandomLineItem());
        long count = LineItem.countLineItems();
        Assert.assertTrue("Counter for 'LineItem' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void LineItemIntegrationTest.testFindLineItem() {
        LineItem obj = dod.getRandomLineItem();
        Assert.assertNotNull("Data on demand for 'LineItem' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'LineItem' failed to provide an identifier", id);
        obj = LineItem.findLineItem(id);
        Assert.assertNotNull("Find method for 'LineItem' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'LineItem' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void LineItemIntegrationTest.testFindAllLineItems() {
        Assert.assertNotNull("Data on demand for 'LineItem' failed to initialize correctly", dod.getRandomLineItem());
        long count = LineItem.countLineItems();
        Assert.assertTrue("Too expensive to perform a find all test for 'LineItem', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<LineItem> result = LineItem.findAllLineItems();
        Assert.assertNotNull("Find all method for 'LineItem' illegally returned null", result);
        Assert.assertTrue("Find all method for 'LineItem' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void LineItemIntegrationTest.testFindLineItemEntries() {
        Assert.assertNotNull("Data on demand for 'LineItem' failed to initialize correctly", dod.getRandomLineItem());
        long count = LineItem.countLineItems();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<LineItem> result = LineItem.findLineItemEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'LineItem' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'LineItem' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void LineItemIntegrationTest.testFlush() {
        LineItem obj = dod.getRandomLineItem();
        Assert.assertNotNull("Data on demand for 'LineItem' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'LineItem' failed to provide an identifier", id);
        obj = LineItem.findLineItem(id);
        Assert.assertNotNull("Find method for 'LineItem' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyLineItem(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'LineItem' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void LineItemIntegrationTest.testMergeUpdate() {
        LineItem obj = dod.getRandomLineItem();
        Assert.assertNotNull("Data on demand for 'LineItem' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'LineItem' failed to provide an identifier", id);
        obj = LineItem.findLineItem(id);
        boolean modified =  dod.modifyLineItem(obj);
        Integer currentVersion = obj.getVersion();
        LineItem merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'LineItem' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void LineItemIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'LineItem' failed to initialize correctly", dod.getRandomLineItem());
        LineItem obj = dod.getNewTransientLineItem(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'LineItem' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'LineItem' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'LineItem' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void LineItemIntegrationTest.testRemove() {
        LineItem obj = dod.getRandomLineItem();
        Assert.assertNotNull("Data on demand for 'LineItem' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'LineItem' failed to provide an identifier", id);
        obj = LineItem.findLineItem(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'LineItem' with identifier '" + id + "'", LineItem.findLineItem(id));
    }
    
}