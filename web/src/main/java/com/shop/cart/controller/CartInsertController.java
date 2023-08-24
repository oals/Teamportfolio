package com.shop.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dto.Shop_Write_CartDTO;
import com.shop.service.Shop_Insert_Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
@WebServlet("/cartInsert.do")
public class CartInsertController extends HttpServlet {
	
	Shop_Insert_Service shop_Insert_Service = Shop_Insert_Service.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandler(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandler(req, resp);
	}
	
	protected void doHandler(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		
		
		System.out.println("ajax 테스ㅏ트 카트");
		
		Shop_Write_CartDTO shop_Write_CartDTO = Shop_Write_CartDTO.builder()
				.user_id(req.getParameter("user_id"))
				.product_num(Integer.parseInt(req.getParameter("product_num")))
				.product_name(req.getParameter("product_name"))
				.amount(Integer.parseInt(req.getParameter("amount")))
				.price(req.getParameter("price"))
				.p_size(req.getParameter("p_size"))
				.imagePath(req.getParameter("imagePath"))
				.build();
		
		

		System.out.println(shop_Write_CartDTO);
		
		int chk = shop_Insert_Service.Write_cart(shop_Write_CartDTO);
		
		//chk == 0 -> 장바구니에 추가됨
		
		if(chk > 0) {
			
			//ajax 장바구니 중복 메세지 출력
			
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.print("false");
			
			
		}
		
		
		
		
	}
}
