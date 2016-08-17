package com.niit.shoppingcart;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.shoppingcart.config.ApplicationContextConfig;
import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.UserDetails;

public class TestCaseUserDetails {
//To write testcase for UserDetails you need UserDetailsDAO and UserDetails  object
	@Autowired
	UserDetailsDAO userDetailsDAO;
	
	@Autowired
	UserDetails userDetails;
	
	AnnotationConfigApplicationContext context;
	
	
	@Before
	public void init(){
		context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.shoppingcart");
		context.refresh();
		
		
		userDetailsDAO= (UserDetailsDAO)   context.getBean("userDetailsDAO");
		userDetails = (UserDetails)        context.getBean("userDetails");
	}
	@Test
	public void deleteUserDetailsTestCase(){
		userDetails.setId("U_01");
		boolean flag = userDetailsDAO.delete(userDetails);
		assertEquals("deleteUserDetailsTestCase",flag, true);
		
	}
	
	@Test
	public void addUserDetailsTestCase(){
		userDetails.setId("U_02");
		userDetails.setName("Saurabh");
		userDetails.setPassword("password");
		userDetails.setContact("8130871913");
		userDetails.setMail("saurabh@gmail");
		userDetails.setAddress("Preet Vihar,Delhi");
		userDetailsDAO.save(userDetails);
		assertEquals("addUserDetailsTestCase",userDetailsDAO.save(userDetails),true);
	}

	@Test
	public void listUserDetailsTestCase(){
		
		assertEquals("listUserDetailsTestCase",userDetailsDAO.list().size(), 1);
	}
	@Test 
	public void updateUserDetailsTestCase(){
		userDetails.setId("U_02");
		userDetails.setName("Jack");
		userDetails.setPassword("password");
		userDetails.setContact("8130871913");
		userDetails.setMail("Jack@ymail");
		userDetails.setAddress("London");
		userDetailsDAO.update(userDetails);
		assertEquals("updateUserDetailsTestCase",userDetailsDAO.update(userDetails),true);
	}
	@Test
	public void getUserDetailsTestCase(){
		assertEquals("getUserDetailsTestCase",userDetailsDAO.get("U_02"), true);
	}
}
