package com.niit.registrationhandler;

import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;

import com.niit.shoppingcart.model.UserDetails;
@Component
public class RegistrationHandler {

	
	public UserDetails initFlow(){
		return new UserDetails();
		
	}
	public String validateDetails(UserDetails userDetails, MessageContext message){
		
		String status = "success";
		if(userDetails.getId().isEmpty()){
			status ="failure";
		}
		if(userDetails.getName().isEmpty()){
			status = "failure";
		}
		if(userDetails.getPassword().isEmpty()){
			status ="failure";
			
		}
		if(userDetails.getMail().isEmpty()){
			status = "failure";
			
		}
		if(userDetails.getContact().isEmpty()){
			status ="failure";
			
		}
		
		if(userDetails.getImage().isEmpty()){
			status = "failure";
			
		}
		return status;
	}
}

