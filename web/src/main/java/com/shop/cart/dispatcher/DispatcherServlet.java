package com.shop.cart.dispatcher;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.log4j.Log4j2;

@Log4j2
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	
	private HandlerMapping handlerMapping;
	private ViewResolver viewResolver;
	private String ctxPath;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1.요청 uri 분석 및 컨텍스트 경로 추출
		String uri = req.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));
		
		// 2.path에 해당하는 controller 검색(추출)
		Controller controller = handlerMapping.getController(path);
		
		// 3.추출한 Controller 실행
		String viewName = controller.handleRequest(req, resp);
		log.info("viewName : "+viewName);
		
		// 4.viewResolver를 통해 viewName에 해당하는 화면을 검색
		String view = getNextViewPage(viewName);
		log.info("view : "+view);
		
		System.out.println("이동할 페이지" + view);
		
		// 5.검색된 view페이지로 이동하기
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}

	@Override
	public void init() throws ServletException {
		log.info("init");
		// url에 해당되는 controller 객체 생성
		handlerMapping = new HandlerMapping();
		// view 페이지이동을 위한 view페이지 사전설정하는 객체 생성
		viewResolver = new ViewResolver();
		
		viewResolver.setPrefix("./WEB-INF/");
		viewResolver.setSuffix(".jsp");
		
	}

	// viewName에서 이동할 페이지 경로 및 파일명 최종 추출 
	public String getNextViewPage(String viewName) {
		String view = "";
		if(!viewName.contains(".do")) {
			if(viewName.equals("index")) {
				view = viewName+".jsp";
			} else {
				view = viewResolver.getView(viewName);
			}
		} else {
			view = viewName;
		}

		
		return view;
	}
	
	
}
