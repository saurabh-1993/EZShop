package com.niit.shoppingcart.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.niit.shoppingcart.dao.RolesDAO;
import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.Roles;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class RegistrationController {
	
	@Autowired
	UserDetailsDAO userDetailsDAO;
	
	@Autowired
	UserDetails userDetails;
	
	@Autowired
	RolesDAO rolesDAO;
	 Path path ;
	
	Logger log = LoggerFactory.getLogger(RegistrationController.class);
	
	@RequestMapping(value ="/addUserDetails" , method = RequestMethod.GET)
	public String listUsers(Model model){
		log.debug("Starting of the method listUsers");
		List<UserDetails> list = userDetailsDAO.list();
		model.addAttribute("userdetails", list);
		log.debug("Ending of the method listUsers");
		return "addUserDetails";
		
	}
	
	@RequestMapping(value = "/newUserDetails",method = RequestMethod.POST)
	public String addUser(@ModelAttribute("userDetails") UserDetails userDetails , ModelMap model,HttpServletRequest request){
		log.debug("Start of the method addUser");
		
		log.debug("End  of the method addUser ");	
		Roles roles = new Roles();
		roles.setRoles("ROLE_USER");
		roles.setUserid(userDetails.getId());
		
		rolesDAO.addRoles(roles);
		userDetailsDAO.save(userDetails);
		model.addAttribute("user", userDetails);
		MultipartFile image = userDetails.getImage();
		 String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		 path = Paths.get(rootDirectory+"/resources/images/users/"+userDetails.getId()+".png");
		 log.debug(path.toString());
		 System.out.println(path);
		 if(image!= null && !image.isEmpty()){
			 try{
				 image.transferTo(new File(path.toString()));
			 }
			 catch(Exception e){
				 e.printStackTrace();
				 
			 }
		 }
        return "login";
}
	
	
	@RequestMapping(value = "/editUserDetails" , method = RequestMethod.GET)
	public String editUser(@ModelAttribute("id") String id ,UserDetails userDetails, Model model){
		
		log.debug("Start of the method editUser");
		model.addAttribute("editU", userDetails);
		log.debug("End of the method editUser");
		return "editCategory";
	}
	@ModelAttribute("editU")
	@RequestMapping(value = "/editUserDetails/{id}"   , method = RequestMethod.POST)
	public String updateUser(@PathVariable("id") String id ,Model model)
	{
		log.debug("Start of the method updateUser");
		userDetailsDAO.update(userDetails);
		log.debug("End of the method updateUser");
		return "redirect:/addUserDetails";
	}

	public String deleteUser(@ModelAttribute("id") String id , UserDetails userDetails){
		log.debug("Start of the method deleteUser ");
		userDetailsDAO.delete(userDetails);
		log.debug("End of the method deleteUser");
		return "redirect:/addUserDetails";
	}
}