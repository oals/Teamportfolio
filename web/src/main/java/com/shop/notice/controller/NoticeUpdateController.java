package com.shop.notice.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_AdminBoardDTO;
import com.shop.service.Shop_Update_Service;


public class NoticeUpdateController implements Controller {
	
	
	Shop_Update_Service shop_Update_Service = Shop_Update_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		
		
		System.out.println("수정 완료 페이지");
		
		Shop_Write_AdminBoardDTO shop_Write_AdminBoardDTO = Shop_Write_AdminBoardDTO.builder()
				.article_No(Integer.parseInt(req.getParameter("article_No")))
				.title(req.getParameter("title"))
				.content(req.getParameter("content"))
				.build();
		
		
		shop_Update_Service.Update_Admin_Board(shop_Write_AdminBoardDTO);
		
		
		
		
		return "noticeList.do"; // 공지사항, 이벤트 수정 후 리스트로 이동
	}
}
