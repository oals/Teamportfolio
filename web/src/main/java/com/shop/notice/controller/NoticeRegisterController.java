package com.shop.notice.controller;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.cart.dispatcher.Controller;
import com.shop.dto.Shop_Write_AdminBoardDTO;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class NoticeRegisterController implements Controller{

		@Override
		public String handleRequest(HttpServletRequest req, HttpServletResponse resp) {
			
			System.out.println("어드민 글쓰기페이지 접근");
					
					
					
			return "notice/noticeForm"; // 공지사항, 이벤트 작성 jsp로 이동
		}
}
