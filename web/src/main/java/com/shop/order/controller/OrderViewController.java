package com.shop.order.controller;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_Order_InfoDTO;
import com.shop.dto.Shop_Write_ProductDTO;
import com.shop.service.Shop_Select_Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class OrderViewController implements Controller {
	
	Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		
		System.out.println("주문 상품 정보 보기 접근");
		
		String order_num = req.getParameter("order_num");
		String user_id = req.getParameter("user_id");
		String product_num = req.getParameter("product_num");
		String product_name = req.getParameter("product_name");
		String product_opt=req.getParameter("product_opt");
		String result = req.getParameter("result");
		
		Map<String, String> map = new HashMap();
		map.put("order_num", order_num);
		map.put("product_name", product_name);
		
		Map<String, Object> order_info = shop_Select_Service.Select_order_one(map);
		Shop_Write_ProductDTO shop_Write_ProductDTO = shop_Select_Service.select_find_product(map);
		
		
		req.setAttribute("order", order_info.get("Shop_Write_OrderDTO"));
		req.setAttribute("order_info", order_info.get("Shop_Write_Order_InfoDTO"));
		req.setAttribute("product_info", shop_Write_ProductDTO);
		
		
		return "order/orderView"; // 결제 완료 페이지 jsp로 이동
	}
	
	
}
