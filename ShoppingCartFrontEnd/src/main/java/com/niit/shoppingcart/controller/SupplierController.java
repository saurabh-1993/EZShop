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

import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Supplier;

@Controller
public class SupplierController {

	@Autowired
	private SupplierDAO supplierDAO;
	@Autowired
	public Supplier supplier;
	Logger log = LoggerFactory.getLogger(CategoryController.class);

	@RequestMapping(value="/addSupplier",method=RequestMethod.GET)
	public String listSupplier(Model model)
	{
		log.debug("Starting of the method listSupplier");
		List<Supplier> list=supplierDAO.list();
		model.addAttribute("suppliers", list);
		model.addAttribute("supplier", supplier);
		log.debug("Ending of the method listSupplier");
		return "addSupplier";
	}
	
	@RequestMapping(value="/newSupplier",method=RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier") Supplier supplier)
	{
		log.debug("Starting of the method addSupplier");
		supplierDAO.save(supplier);
		log.debug("Ending of the method addSupplier");
		return "redirect:supplierTable";
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
		log.debug("starting of the method editSupplier");
		supplierDAO.update(supplier);
		log.debug("Ending of the method editSupplier");
		return "redirect:supplierTable";
	}
	
	@RequestMapping(value="/deleteSupplier")
	public String deleteSupplier(@ModelAttribute("id") String id,Model model,Supplier supplier)
	{
		log.debug("Starting of the method deleteSupplier");
	     supplierDAO.delete(supplier);
	     log.debug("Ending of the method deleteSupplier");
		return "redirect:supplierTable";
	}
  
	@RequestMapping(value ="/supplierTable", method = RequestMethod.GET)
	public String supplierTable(Model model){
		log.debug("Start of the method supplierTable");
		model.addAttribute("suppliers",supplierDAO.list());
		log.debug("End of the method supplierTable");
		return "supplierTable";
	}
}
