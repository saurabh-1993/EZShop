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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.Supplier;
import com.niit.shoppingcart.util.FileUtil;

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
    Logger log = LoggerFactory.getLogger(ProductController.class);
	
    
    Path path ;
    
	
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
	public String newProduct(@ModelAttribute("product") Product product,ModelMap model,HttpServletRequest request)
	{
		category = categoryDAO.getByName(product.getCategory().getName());
		//categoryDAO.save(category);
		supplier = supplierDAO.getByName(product.getSupplier().getName());
		//supplierDAO.save(supplier);
		 
		product.setCategory(category);
		product.setSupplier(supplier);
		product.setCategory_id(category.getId());
		product.setSupplier_id(supplier.getId());
	 
		productDAO.save(product);
		 MultipartFile image = product.getImage();
		 String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		 path = Paths.get(rootDirectory+"/resources/images/products/"+product.getId()+".png");
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
		 
		return  "redirect:productTable";
	}
	
	@RequestMapping(value="/products")
	public String allProducts(ModelMap map)
	{
		List<Product> list=productDAO.list();
		map.addAttribute("products", list);
		return "products";
	}
	
	@RequestMapping(value="/editProduct")
	public String editP(@RequestParam("id") String id,Model model)
	{
		model.addAttribute("editP", productDAO.get(id));
		model.addAttribute("suppliers", supplierDAO.list());
		model.addAttribute("categorys",categoryDAO.list());
		
		return "editProduct";
	}
	
	@RequestMapping(value="/editProduct/{id}",method=RequestMethod.POST)
	public String editProduct(@PathVariable("id") String id,@ModelAttribute("editP") Product product ,Model model)
	{
		
		category = categoryDAO.getByName(product.getCategory().getName());
		//categoryDAO.save(category);
		supplier = supplierDAO.getByName(product.getSupplier().getName());
		//supplierDAO.save(supplier);
		 
		product.setCategory(category);
		product.setSupplier(supplier);
		product.setCategory_id(category.getId());
		product.setSupplier_id(supplier.getId());
		productDAO.update(product);
		
		return "redirect:/productTable";
	}
	
	@RequestMapping(value="/deleteProduct")
	public String deleteProduct(@ModelAttribute("id") String id,Model model,Product product)
	{
	     productDAO.delete(product);
		return "redirect:productTable";
	}
	   @RequestMapping(value = "/productTable",method=RequestMethod.GET)
		public String categoryTable(ModelMap model)
		{ 

		   List<Product> list=productDAO.list();
			model.addAttribute("suppliers", supplierDAO.list());
			model.addAttribute("categorys",categoryDAO.list());
			model.addAttribute("products", list);
			return "productTable";
			
		}
	   @RequestMapping(value = "/allProducts",method=RequestMethod.GET)
		public String allP(ModelMap model)
		{ 

		   List<Product> list=productDAO.list();
			model.addAttribute("suppliers", supplierDAO.list());
			model.addAttribute("categorys",categoryDAO.list());
			model.addAttribute("products", list);
			return "allProducts";
			
		}
	   @RequestMapping(value="/viewDetails", method=RequestMethod.GET)
	   public String viewP(@RequestParam("id") String id, Model model){
		   Product p = productDAO.get(id);
		   model.addAttribute("editP", p);
		   return "viewDetails";
		   
	   }
	   @RequestMapping(value = "/mobilePage", method = RequestMethod.GET)
	   public String mobileP(ModelMap model){
		   List<Product> list=productDAO.list();
			model.addAttribute("suppliers", supplierDAO.list());
			model.addAttribute("categorys",categoryDAO.list());
			model.addAttribute("products", list);
			return "mobilePage";
		   
	   }
	   @RequestMapping(value = "/cameraPage", method = RequestMethod.GET)
	   public String CameraP(ModelMap model){
		   List<Product> list=productDAO.list();
			model.addAttribute("suppliers", supplierDAO.list());
			model.addAttribute("categorys",categoryDAO.list());
			model.addAttribute("products", list);
			return "cameraPage";
		   
	   }
	   @RequestMapping(value = "/tvPage", method = RequestMethod.GET)
	   public String tvP(ModelMap model){
		   List<Product> list=productDAO.list();
			model.addAttribute("suppliers", supplierDAO.list());
			model.addAttribute("categorys",categoryDAO.list());
			model.addAttribute("products", list);
			return "tvPage";
		   
	   }

}
