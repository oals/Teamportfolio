package com.shop.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;


public class ProductUpdateController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		System.out.println("상품 수정 접근");
		
		return "admin_productList.do"; // 상품 수정 후 상품 리스트로 이동
	}
}
