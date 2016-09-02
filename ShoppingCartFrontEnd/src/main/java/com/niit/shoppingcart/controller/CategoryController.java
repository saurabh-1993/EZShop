package com.niit.shoppingcart.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.model.Category;

@Controller
public class CategoryController {

	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	public Category category;

	Logger log = LoggerFactory.getLogger(CategoryController.class);

	@RequestMapping(value="/addCategory",method=RequestMethod.GET)
	public String listCategory(Model model)
	{ 
		
		log.debug("Starting of the method listCategory");
		List<Category> list=categoryDAO.list();
		
		model.addAttribute("categorys", list);
		log.debug("Ending of the method listCategory");
		
		return "addCategory";
		
	}
	
	@RequestMapping(value="/newCategory",method=RequestMethod.POST)
	public String addCategory(@ModelAttribute("category")  Category category)
	{

		log.debug("Starting of the method addCategory");

	

		categoryDAO.save(category);


		log.debug("Ending of the method addCategory");
	    return "redirect:categoryTable";
	}
	
	
	
	@RequestMapping(value="/editCategory",method=RequestMethod.GET)
	public String editP(@ModelAttribute("id") String id,Model model)
	{
		model.addAttribute("editP", categoryDAO.get(id));
		
		return "editCategory";
	}
	
	 @ModelAttribute("editP")
	@RequestMapping(value="/editCategory/{id}",method=RequestMethod.POST)
	public String editCategory(@PathVariable("id") String id ,Category category)
	{
		log.debug("Starting of the method editCategory");
		categoryDAO.update(category);
		log.debug("Ending of the method editCategory");
		return "redirect:categoryTable";
	}
	
	@RequestMapping(value="/deleteCategory")
	public String deleteCategory(@ModelAttribute("id") String id,Model model,Category category)
	{
		log.debug("Starting of the method deleteCategory");
	     categoryDAO.delete(category);
	     log.debug("Ending of the method deleteCategory");
		return "redirect:categoryTable";
	}
   @RequestMapping(value = "/categoryTable",method=RequestMethod.GET)
	public String categoryTable(ModelMap model)
	{ 
		log.debug("Starting of the method listCategory");
		List<Category> list=categoryDAO.list();
		
		model.addAttribute("categorys", list);
		log.debug("Ending of the method listCategory");
		return "categoryTable";
		
	}
}
