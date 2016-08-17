package com.niit.shoppingcart;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Product;

public class CategoryTest {

	
	
	public static void main(String[] args){
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.niit");
		context.refresh();
		
		
		
    CategoryDAO categoryDAO = (CategoryDAO)context.getBean("categoryDAO");
	Category category = (Category)  context.getBean("category");
	
	
		category.setId("1001");
		category.setName("Electronics");
		category.setDescription("Samsung S6 Edge pearl white");
		
		
		if(categoryDAO.save(category)== true){
			System.out.println("Category created success");
		}
		else{
			System.out.println("Not able to create the category");
		}
		
		
	}
}
