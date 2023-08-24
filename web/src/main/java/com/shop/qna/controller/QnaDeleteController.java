package com.shop.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_BoardDTO;
import com.shop.service.Shop_Delete_Service;


public class QnaDeleteController implements Controller {
	Shop_Delete_Service shop_Delete_Service = Shop_Delete_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		System.out.println("삭제 컨트롤러 접근");
		
		String qna_num = req.getParameter("qna_num");
		System.out.println(qna_num);
		
		
		Shop_Write_BoardDTO shop_Write_BoardDTO = Shop_Write_BoardDTO.builder()
				.qna_num(Integer.parseInt(qna_num))
				.build();
		shop_Delete_Service.Delete_board(shop_Write_BoardDTO);
		
		
		
		return "qnaList.do"; // 문의사항 삭제 후 리스트로 이동
	}
	
	
}
