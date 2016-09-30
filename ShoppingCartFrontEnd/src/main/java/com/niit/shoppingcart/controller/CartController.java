package com.niit.shoppingcart.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.CartItemDAO;
import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.CustomerDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.CartItem;
import com.niit.shoppingcart.model.CartItemModel;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Customer;
import com.niit.shoppingcart.model.OrderedItems;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.Supplier;

public class CartController {

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

	@Autowired
	private Customer customer;
	@Autowired
	private CustomerDAO customerDAO;

	@Autowired
	private Cart cart;
	@Autowired
	private CartItem cartItem;

	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private CartItemDAO cartItemDAO;

	@Autowired
	HttpSession httpSession;

	@RequestMapping("/user/cart/")
	public ModelAndView viewCart(Model model, Principal userName,
			@RequestParam(value = "cartItemRemoved", required = false) String cartItemRemoved,
			@RequestParam(value = "updateSuccessfull", required = false) String updateSuccessfull,
			@RequestParam(value = "cancelUpdate", required = false) String cancelUpdate,
			@RequestParam(value = "cannotUpdate", required = false) String cannotUpdate)

	{
		ModelAndView mv = new ModelAndView("index");
		String customerName = userName.getName();
		if (cartItemRemoved != null) {
			model.addAttribute("cartItemRemoved", "Cart item removed successfully");
		}
		if (updateSuccessfull != null) {
			model.addAttribute("updateCartSuccessfull", "Quantity updated successfully");
		}
		if (cancelUpdate != null) {
			model.addAttribute("cancelUpdate",
					"Sorry, Quantity of product you are trying to update is insufficient in our stock");
		}
		if (cannotUpdate != null) {
			model.addAttribute("cannotUpdate", "Sorry, The product you are trying to update is not available");
		}
		customer = customerDAO.getCustomerByUserName(customerName);
		String customerId = customer.getCustomerId();

		List<CartItemModel> cartItems = null;
		Cart cart = cartDAO.getCartByCustomerId(customerId);
		// When there are products in cart
		if (returnProductName(customerId) != null && !returnProductName(customerId).isEmpty()) {
			cartItems = returnProductName(customerId);
			for (CartItemModel item : cartItems) {
				// Check whether the cart item is in stock or it not exists
				if (item.getCartItem().getProductId() == null
						|| productDAO.get(item.getCartItem().getProductId()).getQuantity() <= 0) {

					cart.setGrandTotal(cart.getGrandTotal() - item.getCartItem().getTotalPrice());
					model.addAttribute("notInStock", "Not in stock");
					cartDAO.save(cart);
				}

				else {
					List<CartItem> listOfSelectedCartItems;
					// Now after getting the cartItem change grandTotal and No
					// of Products
					listOfSelectedCartItems = cartItemDAO.getCartItemsByCustomerId(customerId);
					double grandTotal = 0;
					for (CartItem item1 : listOfSelectedCartItems) {
						// Also check is there any item which should not be
						// considered
						String productId = item1.getProductId();
//						check whether the product is present or not in database
						if (productId != null) {
							if (productDAO.get(productId).getQuantity() == 0
									|| item1.getQuantity() > productDAO.get(item1.getProductId()).getQuantity())
								grandTotal = grandTotal;
							else {
								grandTotal = grandTotal + item1.getTotalPrice();
							}
						}
					}
					cart.setGrandTotal(grandTotal);

					int noOfProducts = listOfSelectedCartItems.size();

					cart.setNoOfProducts(noOfProducts);
					cartDAO.save(cart);
				}
			}

			mv.addObject("cartItems", cartItems);
			double grandTotal = cartDAO.getCartByCustomerId(customerId).getGrandTotal();
			if (grandTotal > 0)
				mv.addObject("grandTotal", grandTotal);
			else
				model.addAttribute("zeroGrandTotal", "Product not present");
		}
		// When there are no products in cart
		else {
			model.addAttribute("cartEmpty", "No items present in the cart");

			mv.addObject("noOfProducts", 0);
		}

		// Gets the category on the navber
		List<Category> categoryList = categoryDAO.list();
		mv.addObject("categoryList", categoryList);
		// ================================================================

		mv.addObject("isClickedViewCart", true);
		mv.addObject("displayCart", "true");
		mv.addObject("activeNavMenu", "viewCart");

		return mv;
	}

	// Method to get name of product
	public List<CartItemModel> returnProductName(String customerId) {

		List<CartItem> cartItems = cartItemDAO.getCartItemsByCustomerId(customerId);

		List<CartItemModel> cartItemModelList = new ArrayList<>();

		CartItemModel cartItemModel = null;

		for (CartItem item : cartItems) {
			cartItemModel = new CartItemModel();
			cartItemModel.setCartItem(item);
			if (item.getProductId() != null && !item.getProductId().isEmpty()) {
				product = productDAO.get(item.getProductId());
				cartItemModel.setProductName(product.getName());
			} else {
				cartItemModel.setProductName("Currently not avilable");
			}
			cartItemModelList.add(cartItemModel);
		}
		return cartItemModelList;
	}

	@RequestMapping("/user/cart/addToCart/{productId}")
	public String addToCart(@PathVariable("productId") String productId, Model model, Principal userName) {

		// System.out.println(name);

		// 1.Get the customer id by its user name
		String customerName = userName.getName();
		customer = customerDAO.getCustomerByUserName(customerName);
		String customerId = customer.getCustomerId();

		// 2.Check whether his cart is present in the cart table
		// If cart is not present then make a cart for him

		if (cartDAO.getCartByCustomerId(customerId) == null) {
			cart = new Cart();
			cart.setCustomerId(customerId);
			cartDAO.save(cart);

			// cartItem.setCartId(cart.getCartId());
		}

		// This statement changes the cart if cart is present and due to
		// unpresence of this there where errors
		else {
			cart = cartDAO.getCartByCustomerId(customerId);
		}

		String cartId = cart.getCartId();

		// 3.get the product price

		product = productDAO.get(productId);

		// If cart is present then go into the cartItem table and search for
		// product
		// this customer selected whether it exists or it is a new product.
		// -------------
		// passing the customerId and productId to a method name returnCartItem
		// through a method

		// if we get null means the product is not present
		// String
		// redirectPage="redirect:/productDetail/{productId}?addToCartSuccessMessage";
		String redirectPage = null;
		int codeRecieved = addCartItem(customerId, productId, cartId);
		switch (codeRecieved) {
		case 0: {
			cartItem = new CartItem();
			cartItem.setCartId(cartId);
			cartItem.setCustomerId(customerId);
			cartItem.setProductId(product.getId());
			cartItem.setQuantity(1);
			cartItem.setTotalPrice(product.getPrice());
			cartItemDAO.save(cartItem);
			System.out.println("Insertion of cartItem");
			updateCartAgain(cartId, customerId);
			redirectPage = "redirect:/productDetail/{productId}?addToCartSuccessMessage";
			break;
		}
		case 1:
			redirectPage = "redirect:/productDetail/{productId}?cancelledAddToCart";
			break;
		case 2:
			redirectPage = "redirect:/productDetail/{productId}?addToCartSuccessMessage";
		}
		httpSession.setAttribute("noOfProducts", returnNoOfProducts(customerId));
		// Now navigate to the same page
		return redirectPage;
	}

	// This function will update the cart
	public int updateCartAgain(String cartId, String customerId) {

		List<CartItem> listOfSelectedCartItems;
		// Now after getting the cartItem change grandTotal and No of Products
		listOfSelectedCartItems = cartItemDAO.getCartItemsByCustomerId(customerId);
		double grandTotal = 0;
		for (CartItem item : listOfSelectedCartItems) {
			grandTotal = grandTotal + item.getTotalPrice();
		}
		cart.setGrandTotal(grandTotal);

		int noOfProducts = listOfSelectedCartItems.size();

		cart.setCartId(cartId);
		cart.setCustomerId(customerId);
		cart.setNoOfProducts(noOfProducts);
		cartDAO.save(cart); // This method updates the cart

		return noOfProducts;
		// =========== Completed Adding the item to cart =====

	}

	// This is the method which perform all the operations related to addition
	// of product cartItem
	public int addCartItem(String customerId, String productId, String cartId) {

		List<CartItem> listOfSelectedCartItems = cartItemDAO.getCartItemsByCustomerId(customerId);
		Product product = productDAO.get(productId);
		for (CartItem item : listOfSelectedCartItems) {
			String itemProductId = item.getProductId();
			System.out.println(itemProductId);
			if (itemProductId != null) {
				if (itemProductId.equals(product.getId())) {
					System.out.println(item.getCartItemId());
					item.setCartItemId(item.getCartItemId());

					System.out.println(item.getQuantity());
					// Check the whether the user is adding the item to cart
					// more
					// than its quantity
					if (item.getQuantity() >= product.getQuantity()) {
						return 1; // This is a code which denotes product is
									// not enough to added to his cart as its
									// present

						 //"redirect:/productDetail/{productId}?cancelledAddToCart"; 
					} else {
						item.setQuantity(item.getQuantity() + 1);

						System.out.println(item.getTotalPrice());
						item.setTotalPrice(item.getTotalPrice() + product.getPrice());

						System.out.println(item.toString());
						cartItemDAO.save(item);
						updateCartAgain(cartId, customerId);
						return 2; // This is a code which denotes product added
									// to
									// cart successfully
						// "redirect:/productDetail/{productId}?addToCartSuccessMessage"; 
					} // ---else ends
				} // ----- outer if ends -----
			} // --- if to manage whether the product exist or not
		} // ----- for loop ends
			// ------- If ends
		return 0; // Product is not present in cart we need to generate a new
					// one
	}

	// To remove the cart items one by one from the cart
	@RequestMapping("/user/cart/remove/{cartItemId}")
	public String removeCartItems(@PathVariable("cartItemId") String cartItemId, Model model, Principal username) {
		cartItem = cartItemDAO.getCartItem(cartItemId);
		String customerId = cartItem.getCustomerId();
		String cartId = cartItem.getCartId();
		cartItemDAO.delete(cartItem);
		int noOfProducts = updateCartAgain(cartId, customerId);
		model.addAttribute("noOfProducts", noOfProducts);
		httpSession.setAttribute("noOfProducts", returnNoOfProducts(customerId));
		return "redirect:/user/cart/?cartItemRemoved";
	}

	// This is the method to count cart items
	public int returnNoOfProducts(String customerId) {
		if (customerId != null) {
			int noOfProduct = cartDAO.getCartByCustomerId(customerId).getNoOfProducts();
			return noOfProduct;
		}
		return 0;
	}

	// To get the listOf ordered items
	@RequestMapping("/user/cart/history")
	public ModelAndView listOrderedItems(Principal principal, Model model) {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("isViewHistoryclicked", "true");
		customer = customerDAO.getCustomerByUserName(principal.getName());

		List<OrderedItems> listofOrderedItems = cartDAO.listOrderedItems(customer.getCustomerId());
		if (listofOrderedItems != null && !listofOrderedItems.isEmpty()) {
			model.addAttribute("listOfOrderedItems", listofOrderedItems);
		} else {
			model.addAttribute("noProductsinHistory", "No products ordered till now");
		}
		mv.addObject("activeNavMenu", "viewCart");
		return mv;

	}

	// Add a product to cart on all products page
	@RequestMapping("/user/allProducts/addToCart/{productId}")
	public String addToCartForAllProducts(@PathVariable("productId") String productId, Model model,
			Principal userName) {

		// System.out.println(name);

		// 1.Get the customer id by its user name
		String customerName = userName.getName();
		customer = customerDAO.getCustomerByUserName(customerName);
		String customerId = customer.getCustomerId();

		// 2.Check whether his cart is present in the cart table
		// If cart is not present then make a cart for him

		if (cartDAO.getCartByCustomerId(customerId) == null) {
			cart = new Cart();
			cart.setCustomerId(customerId);
			cartDAO.save(cart);

			// cartItem.setCartId(cart.getCartId());
		}

		// This statement changes the cart if cart is present and due to
		// unpresence of this there where errors
		else {
			cart = cartDAO.getCartByCustomerId(customerId);
		}

		String cartId = cart.getCartId();

		// 3.get the product price

		product = productDAO.get(productId);

		// If cart is present then go into the cartItem table and search for
		// product
		// this customer selected whether it exists or it is a new product.
		// -------------
		// passing the customerId and productId to a method name returnCartItem
		// through a method

		// if we get null means the product is not present

		String redirect = null;
		int codeRecieved = addCartItem(customerId, productId, cartId);
		switch (codeRecieved) {
		case 0: {
			cartItem = new CartItem();
			cartItem.setCartId(cartId);
			cartItem.setCustomerId(customerId);
			cartItem.setProductId(product.getId());
			cartItem.setQuantity(1);
			cartItem.setTotalPrice(product.getPrice());
			cartItemDAO.save(cartItem);
			System.out.println("Insertion of cartItem");
			updateCartAgain(cartId, customerId);
			redirect = "redirect:/allProducts?addToCartAllProducts";
			break;
		}
		case 1:
			redirect = "redirect:/allProducts?cancelledAddToCart";
			break;
		case 2:
			redirect = "redirect:/allProducts?addToCartAllProducts";

		}
		httpSession.setAttribute("noOfProducts", returnNoOfProducts(customerId));
		// Now navigate to the same page
		return redirect;
	}

	// To update the cart quantity
	@RequestMapping("/user/cart/update")
	public String updateCartItemQuantity(@RequestParam(value = "cartItemId") String cartItemId,
			@RequestParam(value = "cartQuantity") int quantity) {
		String redirect = null;
		cartItem = cartItemDAO.getCartItem(cartItemId);

		String productId = cartItem.getProductId();
//		check whether the product is present or not in database
		if (productId != null) {
			product = productDAO.get(cartItem.getProductId());
			int productQuantity = product.getQuantity();
			// Check whether the cartItem quantity is more or enough
			if (quantity > product.getQuantity()) {
				redirect = "redirect:/user/cart/?cancelUpdate";
			} 
				  else if (quantity > 5) { redirect =
				  "redirect:/user/cart/?maxCartItem"; }
				  else {
				cartItem.setQuantity(quantity);
				cartItem.setTotalPrice(quantity * product.getPrice());
				cartItemDAO.save(cartItem);
				updateCartAgain(cartItem.getCartId(), cartItem.getCustomerId());
				redirect = "redirect:/user/cart/?updateSuccessfull";
			}
		}
		else{
			 redirect = "redirect:/user/cart/?cannotUpdate";
		}
		return redirect;
	}

}
