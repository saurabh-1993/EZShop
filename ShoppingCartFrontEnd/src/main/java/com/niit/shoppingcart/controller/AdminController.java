package com.niit.shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.Supplier;

@Controller
public class AdminController {
	
	@Autowired
	private Product product;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private Category category;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private Supplier supplier;
	@Autowired
	private SupplierDAO supplierDAO;
	
	
	@RequestMapping("/manageCategories")
	public ModelAndView categories(){
		ModelAndView mv = new ModelAndView("/addCategory");
		mv.addObject("category", category);
		mv.addObject("isAdminClickedCategories" ,"true");
		mv.addObject("categorys", categoryDAO.list());
		return mv;
	}
	@RequestMapping("/manageProducts")
	public ModelAndView products(){
		ModelAndView mv = new ModelAndView("/addProduct");
		mv.addObject("product", product);
		mv.addObject("isAdminClickedProducts", "true");
		mv.addObject("products", productDAO.list());
		return mv;
	}
	@RequestMapping("/manageSuppliers")
	public ModelAndView suppliers(){
		ModelAndView mv = new ModelAndView("/addSupplier");
		mv.addObject("supplier", supplier);
		mv.addObject("isAdminClickedSuppliers", "true");
		mv.addObject("suppliers", supplierDAO.list());
		return mv;
		
	}
	

}
