package com.shop.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_sell_tableDTO;
import com.shop.service.Shop_Update_Service;


public class OrderUpdateController implements Controller {
	
	Shop_Update_Service shop_Update_Service = Shop_Update_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		System.out.println("접근");
		
		
		Shop_Write_sell_tableDTO shop_Write_sell_tableDTO = Shop_Write_sell_tableDTO.builder()
				.order_num(Integer.parseInt(req.getParameter("order_num")))
				.product_num(Integer.parseInt(req.getParameter("product_num")))
				.result(req.getParameter("del_opt"))
				.build();
				
		System.out.println(shop_Write_sell_tableDTO);
		
		shop_Update_Service.Update_sell_table(shop_Write_sell_tableDTO);
		
		
		
		
		
		return "order/orderUpdate"; // 주문 처리상태 수정 완료 jsp로 이동
	}
}
