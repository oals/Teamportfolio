package com.shop.notice.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_AdminBoardDTO;
import com.shop.service.Shop_Count_Service;
import com.shop.service.Shop_Insert_Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class NoticeInsertController implements Controller {
	
	Shop_Count_Service shop_Count_Service = Shop_Count_Service.INSTANCE;
	Shop_Insert_Service shop_Insert_Service = Shop_Insert_Service.INSTANCE;
	
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		
		Shop_Write_AdminBoardDTO shop_Write_AdminBoardDTO = Shop_Write_AdminBoardDTO.builder()
				.article_No(shop_Count_Service.Count_admin_board())
				.admin_id((String) session.getAttribute("user_id"))
				.title(req.getParameter("title"))
				.content(req.getParameter("content"))
				.build();
		
		
		shop_Insert_Service.Write_Admin_Board(shop_Write_AdminBoardDTO);
		
		return "noticeList.do"; // 공지사항, 이벤트 작성 후 리스트로 이동
	}
}
