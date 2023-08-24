package com.shop.selling.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.jdbc.SQL;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_OrderDTO;
import com.shop.dto.Shop_Write_Order_InfoDTO;
import com.shop.service.Shop_Select_Service;


public class AdminSellingModifyController implements Controller {
	
	Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		
		System.out.println("주문 수정 페이지 처리 ");
		//데이터 받고 페이지에 뿌려주기
		
		
		   
	        // 문자열 -> Date
	        
	        
		Shop_Write_OrderDTO shop_Write_OrderDTO = Shop_Write_OrderDTO.builder()
				.order_num(Integer.parseInt(req.getParameter("order_num")))
				.user_id(req.getParameter("user_id"))
				.product_num(Integer.parseInt(req.getParameter("product_num")))
				.product_name(req.getParameter("product_name"))
				.product_opt(req.getParameter("product_opt"))
				.result(req.getParameter("result"))
				.build();
		
		
		Shop_Write_Order_InfoDTO shop_Write_Order_InfoDTO = Shop_Write_Order_InfoDTO.builder()
				.order_num(shop_Write_OrderDTO.getOrder_num())
				.product_num(shop_Write_OrderDTO.getProduct_num())
				.result(shop_Write_OrderDTO.getResult())
				.amount(Integer.parseInt(req.getParameter("amount")))
				.name(req.getParameter("name"))
				.address(req.getParameter("address"))
				.build();
		
		
		req.setAttribute("order", shop_Write_OrderDTO);
		req.setAttribute("order_info", shop_Write_Order_InfoDTO);
		
		return "selling/sellingModify"; // 주문 수정(처리상태) jsp로 이동
	}
}
