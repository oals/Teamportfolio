package com.shop.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class ProductRegisterController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		return "product/productForm"; // 상품 등록 jsp로 이동
	}
}
