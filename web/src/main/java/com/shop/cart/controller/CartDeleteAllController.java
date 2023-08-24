package com.shop.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.dto.Shop_Write_CartDTO;
import com.shop.service.Shop_Delete_Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
@WebServlet("/cartdeleteall.do")
public class CartDeleteAllController extends HttpServlet {
	
	
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
		System.out.println("깃허브 테스트232");
		HttpSession session = req.getSession();
		
	
		String user_id = (String) session.getAttribute("user_id");
		System.out.println(user_id);
		
		Shop_Write_CartDTO shop_Write_CartDTO = Shop_Write_CartDTO.builder()
				.user_id(user_id)
				.build();
		
		shop_Delete_Service.Delete_Cart_All(shop_Write_CartDTO);
		
		
	}
}
