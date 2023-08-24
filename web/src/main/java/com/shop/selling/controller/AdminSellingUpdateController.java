package com.shop.selling.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_sell_tableDTO;
import com.shop.service.Shop_Update_Service;


public class AdminSellingUpdateController implements Controller {
	
	Shop_Update_Service shop_Update_Service = Shop_Update_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		

		
		
		System.out.println("데이터 베이스 업데이트");
		
		
		Shop_Write_sell_tableDTO shop_Write_sell_tableDTO = Shop_Write_sell_tableDTO.builder()
				.sell_num(Integer.parseInt(req.getParameter("sell_num")))
				.user_id(req.getParameter("user_id"))
				.product_num(Integer.parseInt(req.getParameter("product_num")))
				.product_name(req.getParameter("product_name"))
				.order_num(Integer.parseInt(req.getParameter("order_num")))
				.result(req.getParameter("result"))
				.build();
		
		System.out.println(shop_Write_sell_tableDTO);
		shop_Update_Service.Update_sell_table(shop_Write_sell_tableDTO);
		
		
		return "admin_sellingList.do"; // 주문 수정(처리상태) 후 리스트로 이동
	}
}
