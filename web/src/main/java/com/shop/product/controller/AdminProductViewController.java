package com.shop.product.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_ProductDTO;
import com.shop.service.Shop_Select_Service;


public class AdminProductViewController implements Controller {
	
	Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		System.out.println("관리자페이지 테스트");
		
		Map<String, String> map = new HashMap<>();
		map.put("product_name", req.getParameter("product_name"));
		System.out.println(map);
		
		Shop_Write_ProductDTO  shop_Write_ProductDTO = shop_Select_Service.select_find_product(map);
		
		System.out.println(shop_Write_ProductDTO);
		
		
		req.setAttribute("product_info", shop_Write_ProductDTO);
		
		
		
		
		
		
		
		
		return "product/AdminProductView"; // 상품(상세) jsp로 이동
	}
}
