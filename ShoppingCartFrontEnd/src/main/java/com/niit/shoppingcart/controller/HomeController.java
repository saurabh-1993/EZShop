package com.niit.shoppingcart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class HomeController {
	
	@Autowired
	CategoryDAO categoryDAO;
	
	
	 
	@RequestMapping(value={"/","/index"})
	public ModelAndView home(){
		
	
	ModelAndView mv = new ModelAndView("index");

	
	
	//Get all the categories and products
	
	List<Category> categoryList =  categoryDAO.list();
	mv.addObject("categoryList", categoryList);
	System.out.println("Size" + categoryList.size());
	return mv;
	
	}
	@RequestMapping("/Register")
	public ModelAndView register(){
		ModelAndView mv = new ModelAndView("Resgistration");
		mv.addObject("userClickedRegisterHere","true");
		return mv;
	}

	@RequestMapping("/loginhere")
	public ModelAndView loginHere() {
		
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("userDetails", new UserDetails());
		mv.addObject("isUserClickedLoginHere", "true");
		return mv;
	}
	
	
}
