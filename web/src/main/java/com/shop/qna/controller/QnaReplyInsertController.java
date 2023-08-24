package com.shop.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;


public class QnaReplyInsertController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		return "qnaList.do"; // 문의사항 답글 작성 후 리스트로 이동
	}
	
	
}
