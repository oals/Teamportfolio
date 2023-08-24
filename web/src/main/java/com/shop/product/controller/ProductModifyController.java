package com.shop.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;


public class ProductModifyController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		return "product/productModify"; // 상품 수정 jsp로 이동
	}
}
