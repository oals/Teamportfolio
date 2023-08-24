package com.shop.product.controller.brand;

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
public class ConverseProductListController implements Controller {
	
	Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		Map<String, String> map = new HashMap();
		
		map.put("product_brand", "컨버스");
		List<Shop_Write_ProductDTO> converse_list = shop_Select_Service.Select_Product(map);
		
		System.out.println(converse_list);
		
		
		
		req.setAttribute("converse_list", converse_list);
		
		return "product/brand/converseProductList"; // 컨버스 상품 jsp로 이동
	}
	
	
}
