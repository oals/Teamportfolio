package com.shop.selling.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_OrderDTO;
import com.shop.dto.Shop_Write_Order_InfoDTO;
import com.shop.service.Shop_Select_Service;


public class AdminSellingSelectController implements Controller {
	
	Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		
		
		Map<String, String> map = new HashMap();
		map.put("order_num", req.getParameter("order_num"));
		
		Map<String, Object> obj =shop_Select_Service.Select_order_one(map);
		
		
		req.setAttribute("order", obj.get("Shop_Write_OrderDTO"));
		req.setAttribute("order_info", obj.get("Shop_Write_Order_InfoDTO"));
		
		
		return "selling/sellingView"; // 주문 조회 jsp로 이동
	}
}
