package com.niit.shoppingcartcore;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class CategoryTest {
public static void main(String[]args){
	AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
	context.scan("com.niit");
	context.refresh();
	context.getBean("category");
	System.out.println("bean created successfully");
	
	
}
}
