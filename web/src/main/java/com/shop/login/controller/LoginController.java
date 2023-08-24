package com.shop.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class LoginController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		System.out.println("!23123");
		
		return "login/loginPage"; // 상품 리스트(관리자) jsp로 이동
	}
	
	
}
