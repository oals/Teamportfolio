package com.shop.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class QnaRegisterController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
		
		
		
		return "qna/qnaForm"; // 문의사항 작성 jsp로 이동
	}
}
