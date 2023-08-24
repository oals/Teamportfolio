package com.shop.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_ProductDTO;
import com.shop.service.Shop_Select_Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class ProductListController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {

		Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
		Map<String, String> map = new HashMap();
		
		map.put("product_brand", "나이키");
		List<Shop_Write_ProductDTO> nike_list = shop_Select_Service.Select_Product(map);
		map.put("product_brand", "아디다스");
		List<Shop_Write_ProductDTO> ads_list = shop_Select_Service.Select_Product(map);
		map.put("product_brand", "뉴발란스");
		List<Shop_Write_ProductDTO> newbal_list = shop_Select_Service.Select_Product(map);
		
		System.out.println(nike_list);
		System.out.println(ads_list);
		System.out.println(newbal_list);
		
		
		
		req.setAttribute("nike_list", nike_list);
		req.setAttribute("ads_list", ads_list);
		req.setAttribute("newbal_list", newbal_list);
		
		
		
		return "product/productList"; // 메인 페이지 jsp로 이동
	}
	
	
}
