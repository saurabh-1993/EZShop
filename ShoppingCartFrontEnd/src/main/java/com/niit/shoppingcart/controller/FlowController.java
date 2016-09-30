package com.niit.shoppingcart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.niit.shoppingcart.dao.BillingAddressDAO;
import com.niit.shoppingcart.dao.CardDetailDAO;
import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.CartItemDAO;
import com.niit.shoppingcart.dao.CustomerDAO;
/*import com.niit.shoppingcart.dao.OrderDetailDAO;*/
import com.niit.shoppingcart.dao.OrderedItemsDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.ShippingAddressDAO;
import com.niit.shoppingcart.model.BillingAddress;
import com.niit.shoppingcart.model.CardDetail;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.CartItem;
import com.niit.shoppingcart.model.CheckoutDetails;
import com.niit.shoppingcart.model.Customer;
import com.niit.shoppingcart.model.OrderDetail;
import com.niit.shoppingcart.model.OrderedItems;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.ShippingAddress;

@Component
public class FlowController {
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ShippingAddress shippingAddress;

	@Autowired
	private BillingAddress billingAddress;

	@Autowired
	private OrderDetail orderDetail;

	@Autowired
	private OrderedItems orderedItems;

	@Autowired
	private OrderedItemsDAO orderedItemsDAO;

	@Autowired
	private CardDetail cardDetail;

	@Autowired
	private ShippingAddressDAO shippingAddressDAO;

	@Autowired
	private BillingAddressDAO billingAddressDAO;

	

/*	@Autowired
	private OrderDetailDAO orderDetailDAO;*/

	@Autowired
	private CardDetailDAO cardDetailDAO;
	@Autowired
	Customer customer;
	@Autowired
	CustomerDAO customerDAO;

	@Autowired
	CartDAO cartDAO;

	@Autowired
	Cart cart;

	@Autowired
	CartItemDAO cartItemDAO;
	@Autowired
	HttpSession httpSession;
	@Autowired
	Product product;
	CheckoutDetails checkoutDetails = new CheckoutDetails();

	public CheckoutDetails initFlow() {
		customer = customerDAO.getCustomerByUserName(SecurityContextHolder.getContext()
				.getAuthentication().getName());
		checkoutDetails.setCart(cartDAO.getCartByCustomerId(customer.getCustomerId()));
		checkoutDetails.setCustomer(customerDAO.getCustomerByUserName(customer.getUsername()));
		return checkoutDetails;
	}

	public String addShippingAddress(CheckoutDetails checkoutDetails, ShippingAddress shippingAddress) {
		customer = customerDAO.getCustomerByUserName(SecurityContextHolder.getContext()
				.getAuthentication().getName());

		shippingAddress.setCustomerId(customer.getCustomerId());
		checkoutDetails.setShippingAddress(shippingAddress);

		this.shippingAddress.setCustomerId(customer.getCustomerId());
		this.shippingAddress.setLine1(shippingAddress.getLine1());
		this.shippingAddress.setLine2(shippingAddress.getLine2());
		this.shippingAddress.setCity(shippingAddress.getCity());
		this.shippingAddress.setState(shippingAddress.getState());
		this.shippingAddress.setCountry(shippingAddress.getCountry());
		this.shippingAddress.setZipcode(shippingAddress.getZipcode());

		return "success";
	}

	public String addBillingAddress(CheckoutDetails checkoutDetails, BillingAddress billingAddress) {
		customer = customerDAO.getCustomerByUserName(SecurityContextHolder.getContext().getAuthentication().getName());
		billingAddress.setCustomerId(customer.getCustomerId());
		checkoutDetails.setBillingAddress(billingAddress);

		this.billingAddress.setCustomerId(customer.getCustomerId());
		this.billingAddress.setLine1(billingAddress.getLine1());
		this.billingAddress.setLine2(billingAddress.getLine2());
		this.billingAddress.setCity(billingAddress.getCity());
		this.billingAddress.setState(billingAddress.getState());
		this.billingAddress.setCountry(billingAddress.getCountry());
		this.billingAddress.setZipCode(billingAddress.getZipCode());

		return "success";
	}

	public String addCardDetails(CheckoutDetails checkoutDetails, CardDetail cardDetail) {
		customer = customerDAO.getCustomerByUserName(SecurityContextHolder.getContext().getAuthentication().getName());

		cardDetail.setCustomerId(customer.getCustomerId());
		cardDetail.setTotalCost(cartDAO.getCartByCustomerId(customer.getCustomerId()).getGrandTotal());
		cardDetailDAO.saveOrUpdate(cardDetail);

		List<CartItem> listOfCartItems = cartItemDAO.getCartItemsByCustomerId(customer.getCustomerId());

		listOfCartItems = cartItemDAO.getCartItemsByCustomerId(customer.getCustomerId());

		cart = cartDAO.getCartByCustomerId(customer.getCustomerId());

		cart.setCartId(cart.getCartId());
		cart.setCustomerId(cart.getCustomerId());
		cart.setNoOfProducts(listOfCartItems.size());

		shippingAddressDAO.save(checkoutDetails.getShippingAddress());
		billingAddressDAO.saveOrUpdate(checkoutDetails.getBillingAddress());
		cartDAO.save(cart);

		httpSession.setAttribute("noOfProducts", cart.getNoOfProducts());

		return "success";
	}

}

