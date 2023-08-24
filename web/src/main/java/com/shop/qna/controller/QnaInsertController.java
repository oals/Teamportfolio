package com.shop.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_BoardDTO;
import com.shop.service.Shop_Count_Service;
import com.shop.service.Shop_Insert_Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class QnaInsertController implements Controller {
	
	Shop_Insert_Service shop_Insert_Service = Shop_Insert_Service.INSTANCE;
	Shop_Count_Service shop_Count_Service = Shop_Count_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		
		String title =req.getParameter("title") ;
		String content =  req.getParameter("content");
		String imgPath = req.getParameter("imageFileName");
		String user_id = (String) session.getAttribute("user_id");
		
		int num = shop_Count_Service.Count_board();
		
		Shop_Write_BoardDTO shop_Write_BoardDTO =Shop_Write_BoardDTO.builder()
				.qna_num(shop_Count_Service.Count_board())
				.user_id(user_id)
				.qna_title(title)
				.qna_content(content)
				.qna_reply("미답변")
				.rep_check("답변 전")
				.build();
		
		
		shop_Insert_Service.Write_Board(shop_Write_BoardDTO);
		
		System.out.println("문의 리스트로 이동");
		return "qnaList.do"; // 문의사항 작성 후 리스트로 이동
	}
}
