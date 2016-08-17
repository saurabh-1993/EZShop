package com.niit.shoppingcart;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Supplier;

public class TestCaseSupplier {

	//To write testcase for supplier you need supplierDAO and supplier object
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@Autowired
	Supplier supplier;
	
	AnnotationConfigApplicationContext context;
	@Before
	public void init(){
		context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.shoppingcart");
		context.refresh();
		
		supplierDAO = (SupplierDAO)  context.getBean("supplierDAO");
		supplier = (Supplier) context.getBean("supplier");
	}
	
	@Test
	public void deleteSupplierTestCase(){
		supplier.setId("EC_01");
		boolean flag = supplierDAO.delete(supplier);
		assertEquals("deleteSupplierTestCase",flag, true);
	}
	
	@Test
	public void addSupplierTestCase()
	{
		supplier.setId("EC_02");
		supplier.setName("SAUenterprises");
		supplier.setAddress("Preet Vihar,Delhi");
		supplierDAO.save(supplier);
		assertEquals("addSupplierTestCase",supplierDAO.save(supplier), true);
	}
	@Test
	public void listSupplierTestCase(){
	
		assertEquals("listSupplierTestCase",supplierDAO.list().size(), 2);
	}
	@Test
	public void updateSupplierTestCase(){
		supplier.setId("EC_02");
		supplier.setName("Kapoor India");
		supplier.setAddress("Delhi");
		assertEquals("updateSupplierTestCase",supplierDAO.update(supplier),true);
		
	}
	
	@Test
	public void getSupplierTestCase(){
		assertEquals("getSupplierTestCase",supplierDAO.get("EC_02"),true);
	}
}
