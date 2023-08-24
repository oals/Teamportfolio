package com.shop.qna.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_BoardDTO;
import com.shop.service.Shop_Select_Service;

public class QnaSelectController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		String qna_num = req.getParameter("qna_num");
		
		Map<String, String> map = new HashMap<>();
		map.put("qna_num", qna_num);

		Shop_Select_Service shop_Select_Service = Shop_Select_Service.INSTANCE;
		Shop_Write_BoardDTO shop_Write_BoardDTO = shop_Select_Service.select_board_one(map);
		
		req.setAttribute("qna_info",shop_Write_BoardDTO );
		req.setAttribute("qna_num", qna_num);
		
		return "qna/qnaView"; // 문의사항 조회 jsp로 이동
	}
}
