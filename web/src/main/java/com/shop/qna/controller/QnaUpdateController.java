package com.shop.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_BoardDTO;
import com.shop.service.Shop_Update_Service;


public class QnaUpdateController implements Controller {
	
	Shop_Update_Service shop_Update_Service = Shop_Update_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		System.out.println("db 업뎃 접근");
		

		
		Shop_Write_BoardDTO shop_Write_BoardDTO = Shop_Write_BoardDTO.builder()
				.qna_num(Integer.parseInt(req.getParameter("qna_num")))
				.qna_title(req.getParameter("qna_title"))
				.qna_content(req.getParameter("qna_content"))
				.build();
		
		shop_Update_Service.Update_Board(shop_Write_BoardDTO);
		
		
		
		
		return "qnaList.do"; // 문의사항 수정 후 리스트로 이동
	}
}
