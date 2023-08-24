package com.shop.download;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download/*")
public class FileDownloadTestController extends HttpServlet{

	private static String ARTICLE_IMAGE_REPO = "C:\\FileTest";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandler(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandler(req, resp);
	
	}
	protected void doHandler (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=utf-8");
		System.out.println("download 접근완료");
		
		
		String file_repo = "C:\\shop";
		String fileName = req.getParameter("imageFileName");
		String separator = File.separator;  //운영체제별 경로 구분자 생성
		
		
		OutputStream out = resp.getOutputStream();
		String downFile = file_repo+File.separator+"/"+fileName;
		
		
		File f = new File(downFile);
		resp.setHeader("Catch-Control", "no-cache"); // "no = cache" : 파일 이름을 유지
		
		resp.addHeader("Content-disposition","attachment; fileName="+fileName);
		
		FileInputStream in = new FileInputStream(f);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			out.write(buffer,0,count);
		}
		in.close(); out.close();
	}
}
