package com.shop.register;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;

public class User_Register_Form implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("회원가입 페이지 접근");
		
		
		
		
		
		return "register/register";
	}
	
	

}
