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
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.Supplier;

@Controller
public class ProductController {

	@Autowired
	private ProductDAO productDAO;
	@Autowired
	public Product product;

	@Autowired
	private Category category;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	
	@Autowired
	private SupplierDAO supplierDAO;
	
    @Autowired	
	private Supplier supplier;
	
	
	
	@RequestMapping(value="/addProduct",method=RequestMethod.GET)
	public String addProduct(ModelMap model)
	{
		List<Product> list=productDAO.list();
		model.addAttribute("suppliers", supplierDAO.list());
		model.addAttribute("categorys",categoryDAO.list());
		model.addAttribute("products", list);
		return "addProduct";
	}
	
	@RequestMapping(value="/newProduct",method=RequestMethod.POST)
	public String newProduct(@ModelAttribute("product") Product product,ModelMap model)
	{
		category = categoryDAO.get(product.getCategory().getId());
		categoryDAO.save(category);
		supplier = supplierDAO.get(product.getSupplier().getId());
		supplierDAO.save(supplier);
		 
		product.setCategory(category);
		product.setSupplier(supplier);
		product.setCategory_id(category.getId());
		product.setSupplier_id(supplier.getId());
		productDAO.save(product);
		
		return "addProduct";
	}
	
	@RequestMapping(value="/products")
	public String allProducts(ModelMap map)
	{
		List<Product> list=productDAO.list();
		map.addAttribute("products", list);
		return "products";
	}
	
	@RequestMapping(value="/editProduct",method=RequestMethod.GET)
	public String editP(@RequestParam("id") String id,Model model)
	{
		model.addAttribute("editP", productDAO.get(id));
		
		return "editProduct";
	}
	
	@ModelAttribute("editP")
	@RequestMapping(value="/editProduct/{id}",method=RequestMethod.POST)
	public String editProduct(@PathVariable("id") String id,@ModelAttribute("editP") Product product ,Model model)
	{
		productDAO.update(product);
		return "redirect:/addProduct";
	}
	
	@RequestMapping(value="/deleteProduct")
	public String deleteProduct(@ModelAttribute("id") String id,Model model,Product product)
	{
	     productDAO.delete(product);
		return "redirect:/addProduct";
	}

}
