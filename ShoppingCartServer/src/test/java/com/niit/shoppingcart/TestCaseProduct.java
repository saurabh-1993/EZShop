package com.niit.shoppingcart;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.model.Product;

public class TestCaseProduct {

	// to write testcase for product we need product DAO and product object
	
	@Autowired
	ProductDAO productDAO;
	
	
	@Autowired
	Product product;
	
	
	AnnotationConfigApplicationContext context;
	
	
//you can write a method to initialise objects

	@Before
	public void init()
	{
		context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.shoppingcart");
		context.refresh();
	   
		productDAO =(ProductDAO) context.getBean("productDAO");
		product =(Product) context.getBean("product");
	}
		
		
	@Test
	public void deleteProductTestCaseP(){
		
		product.setId("MOB_005");
	boolean flag = 	productDAO.delete(product);
	
	assertEquals("deleteProductTestCase",flag, true);
		}
	
	@Test
	public void addProductTestCase(){
		product.setId("M_00001");
		
		product.setName("Hitachi1");
		product.setDescription("This is Hitachi2");
		product.setPrice(2005);
		productDAO.save(product);
		
		assertEquals("addProductTestCase",productDAO.save(product), true);
	}
	
	@Test
	public void listProductTestCase()
	{
		assertEquals("listProductTestCase",productDAO.list().size(),5);
	}

@Test
public void updateProductTestCase(){
	product.setId("MOB_002");
	product.setPrice(2000);
	product.setName("Samsung");
	product.setDescription("This is S");
	
	assertEquals("updateProductTestCase",productDAO.update(product),true);
}
@Test
public void getProductTestCase()
{
	assertEquals("getProductTestCase",productDAO.get("MOB_004"), true);
}
}
