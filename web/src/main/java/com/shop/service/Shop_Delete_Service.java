package com.shop.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.modelmapper.ModelMapper;

import com.shop.domain.Shop_Write_AdminBoardVO;
import com.shop.domain.Shop_Write_BoardVO;
import com.shop.domain.Shop_Write_CartVO;
import com.shop.domain.Shop_Write_ProductVO;
import com.shop.dto.Shop_Write_AdminBoardDTO;
import com.shop.dto.Shop_Write_BoardDTO;
import com.shop.dto.Shop_Write_CartDTO;
import com.shop.dto.Shop_Write_ProductDTO;
import com.shop.mapper.MybatisManager;
import com.shop.util.MapperUtil;

public enum Shop_Delete_Service {
	INSTANCE;
	
	private ModelMapper modelMapper;
	private SqlSession session;
	

	public void Delete_board(Shop_Write_BoardDTO shop_Write_BoardDTO) {   //문의사항 삭제
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		 
		Shop_Write_BoardVO shop_Write_board = modelMapper.map(shop_Write_BoardDTO,Shop_Write_BoardVO.class);
		
//		Shop_Write_BoardVO shop_Write_board = Shop_Write_BoardVO.builder()
//				.qna_num(3) //삭제할 글 req.getparameter받기 
//				.build();
		
		session.delete("shop_Delete.delete_board", shop_Write_board);
		session.commit();
		
		
	}
	
	public void Delete_Cart(Shop_Write_CartDTO shop_Write_CartDTO) { //장바구니 하나 삭제
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		
		Shop_Write_CartVO shop_Write_CartVO = modelMapper.map(shop_Write_CartDTO, Shop_Write_CartVO.class);

		
		session.delete("shop_Delete.delete_cart_p", shop_Write_CartVO);
		session.commit();
		
	}
	
	public void Delete_Cart_All(Shop_Write_CartDTO shop_Write_CartDTO) {//장바구니 전체 삭제
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		Shop_Write_CartVO shop_Write_CartVO = modelMapper.map(shop_Write_CartDTO, Shop_Write_CartVO.class);

//		Shop_Write_CartVO shop_Write_CartVO = Shop_Write_CartVO.builder()
//				.user_id("jenny") //req.getparameter
//				.build();
		
		session.delete("shop_Delete.delete_cart_p_All", shop_Write_CartVO);
		session.commit();
		
	}
	
	public void Delete_Admin_Board(Shop_Write_AdminBoardDTO shop_Write_AdminBoardDTO) { //공지사항 및 이벤트 글 삭제
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		Shop_Write_AdminBoardVO shop_Write_AdminBoardVO = modelMapper.map(shop_Write_AdminBoardDTO, Shop_Write_AdminBoardVO.class);
		
//		Shop_Write_AdminBoardVO shop_Write_AdminBoardVO = Shop_Write_AdminBoardVO.builder()
//				.article_No(1) //삭제할 글 req.getparameter
//				.build();
		
		session.delete("shop_Delete.delete_admin_board", shop_Write_AdminBoardVO.getArticle_No());
		session.commit();
		
	}
	
	public void Delete_product(Shop_Write_ProductDTO shop_Write_ProductDTO) {  //상품 삭제 (미완성)
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		
		//상품 삭제 시 주문 중인 칼럼 값도 다 삭제 필요
		Shop_Write_ProductVO shop_Write_ProductVO = modelMapper.map(shop_Write_ProductDTO, Shop_Write_ProductVO.class);
		
//		Shop_Write_ProductVO shop_Write_ProductVO = Shop_Write_ProductVO.builder()
//				.product_num(2) // 삭제할 상품의 번호 req.getparameter 
//				.build();
		
		session.delete("shop_Delete.delete_product", shop_Write_ProductVO);
		session.commit();
		
	}
	
	
	public void Delete_Usert_info(Map<String, String> map) {  //회원 탈퇴
		
		 modelMapper = MapperUtil.INSTANCE.get();
		 session  = MybatisManager.getInstance().openSession();
		 
		session.delete("shop_Delete.delete_user_info",map);
		session.commit();
	}
	
	
	
}
