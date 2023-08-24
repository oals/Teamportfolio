package com.shop.order.controller;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_User_InfoDTO;
import com.shop.dto.Shop_Write_CartDTO;
import com.shop.service.Shop_Select_Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class OrderRegisterController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		System.out.println("결제페이지 접속");
		
		
		
		Shop_Write_CartDTO shop_Write_CartDTO = Shop_Write_CartDTO.builder()
				.user_id(req.getParameter("user_id"))
				.product_num(Integer.parseInt( req.getParameter("product_num")))
				.amount( Integer.parseInt( req.getParameter("amount")))
				.product_name(req.getParameter("product_name"))
				.price( req.getParameter("price"))
				.p_size(req.getParameter("size_opt"))  //선택값
				.imagePath(req.getParameter("imagePath"))
				.build();
		
		
		System.out.println(shop_Write_CartDTO);
		
		
		Map<String, String> map = new HashMap();
		map.put("user_id", shop_Write_CartDTO.getUser_id());
		Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
		
		System.out.println(map);
		Shop_User_InfoDTO shop_User_InfoDTO = shop_Select_Service.select_user_info(map);
		
		System.out.println(shop_User_InfoDTO);
		
		System.out.println(shop_Write_CartDTO);
		req.setAttribute("order_info", shop_Write_CartDTO);
		req.setAttribute("user_info", shop_User_InfoDTO);
		
		return "order/orderForm"; // 결제 페이지 jsp로 이동
	}
}
