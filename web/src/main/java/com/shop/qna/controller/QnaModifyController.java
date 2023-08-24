package com.shop.qna.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_BoardDTO;
import com.shop.service.Shop_Select_Service;


public class QnaModifyController implements Controller {
	
	Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		
		System.out.println("업데이트 접근");
		String qna_num = req.getParameter("qna_num");
		Map<String, String> map = new HashMap<>();
		map.put("qna_num", qna_num);
		
		 Shop_Write_BoardDTO shop_Write_BoardDTO = shop_Select_Service.select_board_one(map);
		
		req.setAttribute("board", shop_Write_BoardDTO);
		
		return "qna/qnaModify"; // 문의사항 수정 jsp로 이동
	}
}
