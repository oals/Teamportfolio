package com.shop.order.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_CartDTO;
import com.shop.dto.Shop_Write_OrderDTO;
import com.shop.dto.Shop_Write_Order_InfoDTO;
import com.shop.service.Shop_Count_Service;
import com.shop.service.Shop_Delete_Service;
import com.shop.service.Shop_Insert_Service;
import com.shop.service.Shop_Select_Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class OrderInsertController implements Controller {
	
	Shop_Count_Service shop_Count_Service = Shop_Count_Service.INSTANCE;
	Shop_Insert_Service shop_Insert_Service = Shop_Insert_Service.INSTANCE;
	Shop_Delete_Service shop_Delete_Service = Shop_Delete_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		System.out.println("결제완료 페이지 접근");
		
		
		int product_num = Integer.parseInt(req.getParameter("product_num"));
		String user_id = req.getParameter("user_id");
		String p_size = req.getParameter("p_size");
		int amount = Integer.parseInt( req.getParameter("amount"));
		String product_name = req.getParameter("product_name");
		String name = req.getParameter("name");
		String address= req.getParameter("address");
		
		System.out.println("123123123");
		
		Map<String, String> map = new HashMap<>();

		Shop_Write_OrderDTO shop_Write_OrderDTO = Shop_Write_OrderDTO.builder()
				.order_num(shop_Count_Service.Count_order(map))
				.user_id(user_id)
				.product_num(product_num)
				.product_name(product_name)
				.product_opt(req.getParameter("p_size"))
				.result("주문 처리중")
				.build();
		
		Shop_Write_Order_InfoDTO shop_Write_Order_InfoDTO = Shop_Write_Order_InfoDTO.builder()
				.product_num(shop_Write_OrderDTO.getProduct_num())
				.order_num(shop_Write_OrderDTO.getOrder_num())
				.amount(amount)
				.result("주문 처리중")
				.name(req.getParameter("name"))
				.address(req.getParameter("address"))
				.build();
		
		shop_Insert_Service.Write_order(shop_Write_OrderDTO, shop_Write_Order_InfoDTO);
		
		req.setAttribute("user_id", user_id); 
		
		
		//장바구니에 해당 상품이 있다면 삭제 
		
		Shop_Write_CartDTO shop_Write_CartDTO = Shop_Write_CartDTO.builder()
				.user_id(shop_Write_OrderDTO.getUser_id())
				.product_num(shop_Write_OrderDTO.getProduct_num())
				.build();
		
		shop_Delete_Service.Delete_Cart(shop_Write_CartDTO);
		
		
		
		
		
		return "order/orderComplete"; // 결제 완료 페이지로 이동
	}
}
