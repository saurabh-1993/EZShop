package com.niit.shoppingcart.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class UserController {
	
	// when the user click login
	//based on the credentials , i have to find whether he is admin or not '
	// if he is admin i want to navigate to adminHome page
	// if he is user , I want to navigate to home page .
	// if user does not exist , i will give error message
	@Autowired
	UserDetailsDAO userDetailsDAO;
	
	@Autowired
	UserDetails userDetails;
	
	@RequestMapping("/login")
	public ModelAndView login(@RequestParam(value = "id" ) String id , 
			@RequestParam(value ="password") String password , HttpSession session)
	{
	ModelAndView mv = new ModelAndView("home");
	String msg ;
	userDetails = userDetailsDAO.isValidUser(id, password);
	if(userDetails == null) {
		msg = "Invalid User ...please try again";
	}
	else{
		
		if (userDetails.getRole().equals("Role_Admin")){
			mv = new ModelAndView("adminHome");
		}

			session.setAttribute("welcomemsg", userDetails.getName());
			session.setAttribute("userID", userDetails.getId());
			
			
		}
	
	return mv;
		
		}

}
