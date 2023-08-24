package com.shop.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.shop.cart.dispatcher.Controller;
import com.shop.service.Shop_Select_Service;

@WebServlet("/login_chk/*")
public class LoginChkController extends HttpServlet {

	Shop_Select_Service select_Service = Shop_Select_Service.INSTANCE;
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String user_id = req.getParameter("user_id");
		String user_pw = req.getParameter("user_pw");
		
		System.out.println(user_id);
		System.out.println(user_pw);
		
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("admin_id", user_id);
		map.put("pw", user_pw);
		
	
		int chk = select_Service.Select_login(map);
		
		
		int chk_admin = select_Service.select_admin_login(map);
		
		System.out.println(chk);
		System.out.println(chk_admin);
		
		HttpSession session = req.getSession();
		
		
		PrintWriter out = resp.getWriter();
		
		
		
		if(chk == 1) {
			
			session.setAttribute("login_chk", "true");
			session.setAttribute("user_id", user_id);
			
			
//			Cookie cookie = new Cookie("user_id", user_id);
//			cookie.setMaxAge(60*60*24);
//			resp.addCookie(cookie); //response에 Cookie 추가
			

			System.out.println("로그인 성공");
			out.print("loginSuccess");
			
		}else if (chk_admin == 3){
			System.out.println("어드민 로그인 성공");
			
			session.setAttribute("login_chk", "true");
			session.setAttribute("user_id", user_id);
			session.setAttribute("admin", "true");
			out.print("adminLoginSuccess");
			
			
		}else {
			System.out.println("로그인 실패");
			out.print("loginFail");
		}
		
		

		
		
		
	}
	
	
	
	
	
}
