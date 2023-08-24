package com.shop.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;


public class QnaReplyController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		return "qna/qnaReply"; // 문의사항 답글 작성 jsp로 이동
	}
	
	
}
