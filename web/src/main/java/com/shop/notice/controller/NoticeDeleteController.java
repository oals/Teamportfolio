package com.shop.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_AdminBoardDTO;
import com.shop.service.Shop_Delete_Service;


public class NoticeDeleteController implements Controller {
	
	Shop_Delete_Service shop_Delete_Service = Shop_Delete_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		
		Shop_Write_AdminBoardDTO shop_Write_AdminBoardDTO = Shop_Write_AdminBoardDTO.builder()
				.article_No(Integer.parseInt(req.getParameter("article_No")))
				.build();
		
		
		shop_Delete_Service.Delete_Admin_Board(shop_Write_AdminBoardDTO);
		
		return "noticeList.do"; // 공지사항, 이벤트 삭제 후 리스트로 이동
	}
	
	
}
