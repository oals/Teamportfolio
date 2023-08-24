package com.shop.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dto.Shop_Write_CartDTO;
import com.shop.service.Shop_Delete_Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
@WebServlet("/cartdelete.do")
public class CartDeleteController extends HttpServlet {
	
	Shop_Delete_Service shop_Delete_Service = Shop_Delete_Service.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandler(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandler(req, resp);
	}
	
	protected void doHandler(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		
		
		String[] checkbox = req.getParameterValues("checkbox");
		String user_id = req.getParameter("user_id");
		Shop_Write_CartDTO shop_Write_CartDTO = null;
		
		for(int i = 0; i < checkbox.length; i++) {
			String delItem =  checkbox[i];
			
			shop_Write_CartDTO = Shop_Write_CartDTO.builder()
					.user_id(user_id)
					.product_num(Integer.parseInt(delItem))
					.build();
			System.out.println(shop_Write_CartDTO);
			shop_Delete_Service.Delete_Cart(shop_Write_CartDTO);
			
		
		}
		
		
		
		
		
	}
}
