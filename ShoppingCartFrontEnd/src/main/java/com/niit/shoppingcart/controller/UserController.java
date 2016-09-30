package com.niit.shoppingcart.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.RolesDAO;
import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Login;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class UserController {
	Logger log = LoggerFactory.getLogger(UserController.class);
	// when the user click login
	//based on the credentials , i have to find whether he is admin or not '
	// if he is admin i want to navigate to adminHome page
	// if he is user , I want to navigate to home page .
	// if user does not exist , i will give error message
	@Autowired
	UserDetailsDAO userDetailsDAO;
	
	@Autowired
	UserDetails userDetails;
	@Autowired
	Category category;
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	RolesDAO rolesDAO;
	
/*@RequestMapping("/login")
	public String loginPage(Model m)
	{
		m.addAttribute("login", userDetailsDAO.list());
		return "login";
	}*/
	  //login in header on index page
	  @RequestMapping(value = "/login")
	    public ModelAndView login(@RequestParam(value="error",required=false)String error,@RequestParam(value="logout",required=false)String logout,Model model) {
	        if (error != null){
	        	model.addAttribute("error","Invalid username or password");
	             }
	     if (logout != null){
	    	 model.addAttribute("msg", "You have been logged out successfully");
	     }
	     return new ModelAndView("login");
	    }
	  
	  
	  @RequestMapping(value = "/login", method = RequestMethod.POST)
	    public String doLogin(@Valid @ModelAttribute("validate") Login validate,
	            BindingResult result, Map<String, Object>model) {
		  	
	        if (result.hasErrors()) {
	            return "login";
	        }
	 
	        return "index";
	    }
	  
	  
	/*@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView login(@RequestParam(value = "id" ) String id , 
			@RequestParam(value ="password") String password , HttpSession session,@ModelAttribute("login") UserDetails userDetails,BindingResult result)
	{
		if(result.hasErrors())
		{
			ModelAndView mv = new ModelAndView("login");
		}
	ModelAndView mv = new ModelAndView("index");
	String msg="" ;
	userDetails = userDetailsDAO.isValidUser(id, password);
	for(Roles role : rolesDAO.list())
	{
		
		if(role.getUserid().equals(userDetails.getId())){
			
			if(userDetails == null) {
				msg = "Invalid User ...please try again";
			}
			else{
				
				if (role.getRoles().equals("ROLE_ADMIN")){
					mv = new ModelAndView("adminHome");
				}
				else
				{
					mv=new ModelAndView("index");
				}
					session.setAttribute("welcomemsg", userDetails.getName());
					session.setAttribute("userID", userDetails.getId());
					
					
				}
		}
			
	}
	
	
	return mv;
		
		}*/

}
