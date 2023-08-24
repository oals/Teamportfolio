package com.shop.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.service.Shop_Select_Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
@WebServlet("/checkId.do")
public class User_Register_CheckController extends HttpServlet {
	
	// 서비스
	Shop_Select_Service select_Service = Shop_Select_Service.INSTANCE;
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		// 아이디 중복체크 controller
		
		String user_id = req.getParameter("user_id");
		
		log.info(user_id);
		
		
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		
		
		int isCheck = select_Service.checkID(map);
		
		log.info(isCheck);
		
		
		HttpSession session = req.getSession();
		
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		if(isCheck == 1) {
			
			//session.setAttribute("login_chk", "true");
			session.setAttribute("user_id", user_id);
			
			System.out.println("이미 사용중인 아이디");
			out.print("not usable");
			
			return;
			
		} else {
			System.out.println("사용 가능한 아이디");
			out.print("usable");
		}
		
	}
	
	
}
