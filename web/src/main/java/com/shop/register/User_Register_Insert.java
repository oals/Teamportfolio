package com.shop.register;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_User_InfoDTO;
import com.shop.service.Shop_Insert_Service;
import com.shop.service.Shop_Select_Service;

public class User_Register_Insert implements Controller {

	Shop_Insert_Service shop_Insert_Service = Shop_Insert_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {

		
		System.out.println("회원가입 데이터 받기");
		
		
		Shop_User_InfoDTO shop_User_InfoDTO = Shop_User_InfoDTO.builder()
				.user_id(req.getParameter("user_id"))
				.pw(req.getParameter("user_pw"))
				.nickname(req.getParameter("nickname"))
				.name(req.getParameter("name"))
				.email(req.getParameter("email"))
				.address(req.getParameter("address"))
				.phone(req.getParameter("phone"))
				.point(0)
				.build();
		
		
		shop_Insert_Service.Register(shop_User_InfoDTO);
		
		
		return "register/joinUpdate";
	}

}


