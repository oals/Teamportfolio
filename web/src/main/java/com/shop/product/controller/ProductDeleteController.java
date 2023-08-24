package com.shop.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;


public class ProductDeleteController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		return "admin_productList.do"; // 상품 삭제 후 상품 리스트로 이동
	}
	
	
}
