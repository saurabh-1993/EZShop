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

import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Supplier;

@Controller
public class SupplierController {

	@Autowired
	private SupplierDAO supplierDAO;
	@Autowired
	public Supplier supplier;

	@RequestMapping(value="/supplier",method=RequestMethod.GET)
	public String addSupplier(ModelMap model)
	{
		List<Supplier> list=supplierDAO.list();
		model.addAttribute("suppliers", list);
		return "addSupplier";
	}
	
	@RequestMapping(value="/newSupplier",method=RequestMethod.POST)
	public String newSupplier(@ModelAttribute("supplier") Supplier supplier,ModelMap model)
	{
		supplierDAO.save(supplier);
		
		return "addSupplier";
	}
	
	@RequestMapping(value="/suppliers")
	public String allSuppliers(ModelMap map)
	{
		List<Supplier> list=supplierDAO.list();
		map.addAttribute("suppliers", list);
		return "suppliers";
	}
	
	@RequestMapping(value="/editSupplier",method=RequestMethod.GET)
	public String editP(@ModelAttribute("id") String id,Model model)
	{
		model.addAttribute("editP", supplierDAO.get(id));
		
		return "editSupplier";
	}
	
	@ModelAttribute("editP")
	@RequestMapping(value="/editSupplier/{id}",method=RequestMethod.POST)
	public String editSupplier(@PathVariable("id") String id,Model model,Supplier supplier)
	{
		supplierDAO.update(supplier);
		return "redirect:/addSupplier";
	}
	
	@RequestMapping(value="/deleteSupplier")
	public String deleteSupplier(@ModelAttribute("id") String id,Model model,Supplier supplier)
	{
	     supplierDAO.delete(supplier);
		return "redirect:/addSupplier";
	}

}
