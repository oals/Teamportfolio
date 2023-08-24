package com.shop.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_CartDTO;
import com.shop.service.Shop_Select_Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class CartListController implements Controller {
	
	Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
	
		HttpSession session = req.getSession();
		
		String user_id = (String) session.getAttribute("user_id");

		
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		
		List<Shop_Write_CartDTO> list = shop_Select_Service.Select_cart(map);
		
		
		req.setAttribute("cart_list", list);
		
		
		return "cart/cartList"; // 장바구니 jsp로 이동
	}
	
	
}
