package com.shop.notice.controller;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_AdminBoardDTO;
import com.shop.service.Shop_Update_Service;


public class NoticeModifyController implements Controller {
	
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		
		Shop_Write_AdminBoardDTO shop_Write_AdminBoardDTO =Shop_Write_AdminBoardDTO.builder()
				.article_No(Integer.parseInt(req.getParameter("article_No")))
				.title(req.getParameter("title"))
				.content(req.getParameter("content"))
				.build();
		
		
	
		req.setAttribute("shop_Write_AdminBoardDTO", shop_Write_AdminBoardDTO);
		
		
		
		return "notice/noticeModify"; // 공지사항, 이벤트 수정 jsp로 이동
	}
}
