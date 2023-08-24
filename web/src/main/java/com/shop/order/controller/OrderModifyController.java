package com.shop.order.controller;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.service.Shop_Update_Service;


public class OrderModifyController implements Controller {
	
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		Map<String, String> map = new HashMap<>();
		map.put("order_num", req.getParameter("order_num"));
		map.put("product_num", req.getParameter("product_num"));
		map.put("product_name", req.getParameter("product_name"));
		
		System.out.println("수정페이지 접근");
		System.out.println(map);
		
		req.setAttribute("product_info", map);
		
		
		
		return "order/orderModify"; // 주문 처리상태 수정(주문취소, 환불, 교환) jsp로 이동
	}
}
