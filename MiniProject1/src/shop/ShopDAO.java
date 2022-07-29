package shop;

import java.util.List;
import java.util.Map;

public interface ShopDAO {
	// 회원관리
	public int check(String id, String passwd);
	public int check(String id);
	public int insertMember(MemberDTO dto);
	public int deleteMember(String id);
	public MemberDTO getMember(String id);
	public int modifyMember(MemberDTO dto);
	
	// 게시판
	public int getCount();
	public List<BoardDataBean> getArticles(Map<String, Integer> map);
	public int insertArticle(BoardDataBean dto);
	public BoardDataBean getArticle(int num);
	public void addCount(int num);
	public int check(int num, String passwd);
	public int modifyArticle(BoardDataBean dto);
	public int deleteArticle(int num);
	
	// 장바구니
	public List<CartDTO> getCartList(String memid);
	
	public List<OrdersDTO> getOrderList(String orderid);
	/*
	
	// 회원
	viewMemberInfo()
	viewTerms() // 약관조회
	viewCoupons() // 쿠폰 조회 -> 스탬프로 변경
	signup() // 회원가입
	 
	// qna게시판
	readQnaArticle()
	replyQnaArticle()
	deleteQnaArticle()
	modifyQnaArticle()
	writeQnaArticle
	
	// 리뷰 게시판
	deletePhoto()
	deleteQnaArticle()
	modifyQnaArticle()
	writeQnaArticle
	readQnaArticle()
	
	
	// 장바구니
	productNumChoose()
	putOutCart()
	putInCart()
	
	// 상품관리
	modifyProductInfo()
	deleteProduct()
	registerProduct()
	reviewProduct()
	productQNA()
	viewProductList()
	
	// 주문
	refund()
	orderPayment()
	inputOrderMemo()
	showOrderProduct()
	chooseOption()
	viewOrderInfo()
	order()
	findDeliveryPlace()
	
	*/
}
