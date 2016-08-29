package com.niit.shoppingcart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.model.Category;

@Controller
public class CategoryController {

	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	public Category category;

	@RequestMapping(value="/addCategory",method=RequestMethod.GET)
	public String addCategory(ModelMap model)
	{
		List<Category> list=categoryDAO.list();
		model.addAttribute("categorys", list);
		return "addCategory";
	}
	
	@RequestMapping(value="/newCategory",method=RequestMethod.POST)
	public String newCategory(@ModelAttribute("category") Category category,ModelMap model)
	{
		categoryDAO.save(category);
		
		return "addCategory";
	}
	
	@RequestMapping(value="/categorys")
	public String allCategorys(ModelMap map)
	{
		List<Category> list=categoryDAO.list();
		map.addAttribute("categorys", list);
		return "categorys";
	}
	
	@RequestMapping(value="/editCategory",method=RequestMethod.GET)
	public String editP(@ModelAttribute("id") String id,Model model)
	{
		model.addAttribute("editP", categoryDAO.get(id));
		
		return "editCategory";
	}
	
	@ModelAttribute("editP")
	@RequestMapping(value="/editCategory/{id}",method=RequestMethod.POST)
	public String editCategory(@PathVariable("id") String id,Model model,Category category)
	{
		categoryDAO.update(category);
		return "redirect:/addCategory";
	}
	
	@RequestMapping(value="/deleteCategory")
	public String deleteCategory(@ModelAttribute("id") String id,Model model,Category category)
	{
	     categoryDAO.delete(category);
		return "redirect:/addCategory";
	}

}
