package com.shop.cart.dispatcher;

import java.util.HashMap;
import java.util.Map;

import com.shop.cart.controller.CartListController;
import com.shop.login.controller.LoginChkController;
import com.shop.login.controller.LoginController;
import com.shop.login.controller.LogoutController;
import com.shop.notice.controller.NoticeDeleteController;
import com.shop.notice.controller.NoticeInsertController;
import com.shop.notice.controller.NoticeListController;
import com.shop.notice.controller.NoticeModifyController;
import com.shop.notice.controller.NoticeRegisterController;
import com.shop.notice.controller.NoticeSelectController;
import com.shop.notice.controller.NoticeUpdateController;
import com.shop.order.controller.OrderInsertController;
import com.shop.order.controller.OrderListController;
import com.shop.order.controller.OrderModifyController;
import com.shop.order.controller.OrderRegisterController;
import com.shop.order.controller.OrderUpdateController;
import com.shop.order.controller.OrderViewController;
import com.shop.product.controller.AdminProductListController;
import com.shop.product.controller.AdminProductViewController;
import com.shop.product.controller.ProductDeleteController;
import com.shop.product.controller.ProductInsertController;
import com.shop.product.controller.ProductListController;
import com.shop.product.controller.ProductModifyController;
import com.shop.product.controller.ProductRegisterController;
import com.shop.product.controller.ProductSerchListController;
import com.shop.product.controller.ProductUpdateController;
import com.shop.product.controller.ProductViewController;
import com.shop.product.controller.brand.AdidasProductListController;
import com.shop.product.controller.brand.ConverseProductListController;
import com.shop.product.controller.brand.NewbalanceProductListController;
import com.shop.product.controller.brand.NikeProductListController;
import com.shop.product.controller.brand.PumaProductListController;
import com.shop.qna.controller.QnaDeleteController;
import com.shop.qna.controller.QnaInsertController;
import com.shop.qna.controller.QnaListController;
import com.shop.qna.controller.QnaModifyController;
import com.shop.qna.controller.QnaRegisterController;
import com.shop.qna.controller.QnaReplyController;
import com.shop.qna.controller.QnaReplyInsertController;
import com.shop.qna.controller.QnaSelectController;
import com.shop.qna.controller.QnaUpdateController;
import com.shop.register.User_Register;
import com.shop.register.User_Register_Form;
import com.shop.register.User_Register_Insert;
import com.shop.selling.controller.AdminSellingListController;
import com.shop.selling.controller.AdminSellingModifyController;
import com.shop.selling.controller.AdminSellingSelectController;
import com.shop.selling.controller.AdminSellingUpdateController;



public class HandlerMapping {
	
	// controller 구현한 객체들을 저장하는 map
	private Map<String, Controller> mappings;
	
	public HandlerMapping() {
		mappings = new HashMap<>();
		mappings.put("/*.do", new ProductListController());
		mappings.put("/productList.do", new ProductListController()); // 메인페이지
		mappings.put("/productView.do", new ProductViewController()); // 상세페이지
		mappings.put("/productSerchList.do", new ProductSerchListController());
		mappings.put("/productList_nike.do", new NikeProductListController()); // 브랜드별 리스트
		mappings.put("/productList_adidas.do", new AdidasProductListController());
		mappings.put("/productList_newbalance.do", new NewbalanceProductListController());
		mappings.put("/productList_puma.do", new PumaProductListController());
		mappings.put("/productList_converse.do", new ConverseProductListController());
		
		mappings.put("/admin_productList.do", new AdminProductListController()); // 상품 리스트(관리자)
		mappings.put("/admin_productView.do", new AdminProductViewController());
		mappings.put("/admin_productRegister.do", new ProductRegisterController()); 
		mappings.put("/admin_productInsert.do", new ProductInsertController());
		mappings.put("/admin_productModify.do", new ProductModifyController());
		mappings.put("/admin_productUpdate.do", new ProductUpdateController());
		mappings.put("/admin_productDelete.do", new ProductDeleteController());
		
		mappings.put("/cartlist.do", new CartListController()); // 장바구니
		
		mappings.put("/noticeList.do", new NoticeListController()); // 공지사항,이벤트
		mappings.put("/noticeRegister.do", new NoticeRegisterController()); 
		mappings.put("/noticeInsert.do", new NoticeInsertController()); 
		mappings.put("/noticeSelect.do", new NoticeSelectController());
		mappings.put("/noticeDelete.do", new NoticeDeleteController());
		mappings.put("/noticeModify.do", new NoticeModifyController()); 
		mappings.put("/noticeUpdate.do", new NoticeUpdateController()); 

		mappings.put("/qnaList.do", new QnaListController()); // 문의사항
		mappings.put("/qnaRegister.do", new QnaRegisterController());
		mappings.put("/qnaInsert.do", new QnaInsertController());
		mappings.put("/qnaSelect.do", new QnaSelectController());
		mappings.put("/qnaDelete.do", new QnaDeleteController());
		mappings.put("/qnaModify.do", new QnaModifyController());
		mappings.put("/qnaUpdate.do", new QnaUpdateController());
		mappings.put("/qnaReply.do", new QnaReplyController());
		mappings.put("/qnaReplyInsert.do", new QnaReplyInsertController());
		
		mappings.put("/orderRegister.do", new OrderRegisterController()); // 결제 페이지
		mappings.put("/orderInsert.do", new OrderInsertController());
		mappings.put("/orderView.do", new OrderViewController()); 
		mappings.put("/orderList.do", new OrderListController()); // 마이페이지
		mappings.put("/orderModify.do", new OrderModifyController()); 
		mappings.put("/orderUpdate.do", new OrderUpdateController());
		
		mappings.put("/admin_sellingList.do", new AdminSellingListController()); // 관리자 페이지(주문 리스트)
		mappings.put("/admin_sellingSelect.do", new AdminSellingSelectController());
		mappings.put("/admin_sellingModify.do", new AdminSellingModifyController());
		mappings.put("/admin_sellingUpdate.do", new AdminSellingUpdateController());
		
		mappings.put("/login_page.do", new LoginController());
		mappings.put("/user_register.do", new User_Register());
		mappings.put("/user_register_form.do", new User_Register_Form());
		mappings.put("/user_register_insert.do", new User_Register_Insert());
		
		
		
		
		
	}
	
	public Controller getController(String path) {
		// map에 등록된 controller들 중에서 특정 경로에 해당하는 controller 반환
		// url : controller => 1:1 맵핑
		return mappings.get(path);
	}
	
	
	
	
}
