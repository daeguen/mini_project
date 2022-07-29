package shop;

import java.util.List;
import java.util.Map;

import mybatis.SqlMapClient;

public class ShopDBBean implements ShopDAO{
	public int getCount() {
		return SqlMapClient.getSession().selectOne("QnABoard_Team1.getCount");
	}
	
	public int insertArticle(BoardDataBean dto) {
		int num = dto.getNum();
		int ref = dto.getRef();
		int re_step = dto.getRe_step();
		int re_level = dto.getRe_level();
		
		//					ref		re_step		re_level
		// 10 제목글			8		0			0
		// 09	ㄴ 답글		8		2			1
		// 08		ㄴ 재답글	8		3			2
		// 07	ㄴ 답글		8		1			1
		// 아래로 바뀜
		//					ref		re_step		re_level
		// 10 제목글			8		0			0
		// 07	ㄴ 답글		8		1			1
		// 09	ㄴ 답글		8		2			1
		// 08		ㄴ 재답글	8		3			2
		if (num == 0) {
			// 제목글
			int count = getCount();
			if(count != 0) {
				// 글이 있는 경우
//				sql = "select max(num) from board";
//				ref = getJdbcTemplate().queryForObject(sql, Integer.class) + 1;		// 그룹화 아이디 = 글 번호 최대값 + 1
				int maxnum = SqlMapClient.getSession().selectOne("QnABoard_Team1.maxNum");
				ref = maxnum + 1;
			}
			else {
				// 글이 없는 경우
				ref = 1;
			}
			re_step = 0;
			re_level = 0;
		}
		else {
			// 답변글
			SqlMapClient.getSession().update("QnABoard_Team1.updateReply", dto);
			re_step++;
			re_level++;
		}
		
		dto.setRef(ref);
		dto.setRe_step(re_step);
		dto.setRe_level(re_level);
		return SqlMapClient.getSession().insert("QnABoard_Team1.insertArticle", dto);
	}
	
	public List<BoardDataBean> getArticles(Map<String, Integer> map){
		return SqlMapClient.getSession().selectList("QnABoard_Team1.getArticles", map);
	}
	
	public BoardDataBean getArticle(int num) {
		return SqlMapClient.getSession().selectOne("QnABoard_Team1.getArticle", num);
	}
	
	public void addCount(int num) {
		SqlMapClient.getSession().update("QnABoard_Team1.addCount", num);
	}

	public int check(int num, String passwd) {
		int result = 0;
		BoardDataBean dto = getArticle(num);
		if(passwd.equals(dto.getPasswd())) {
			result = 1;
		}
		else {
			result = 0;
		}
		// else가 되는 경우는 없다.
		return result;
	}
	
	public int deleteArticle(int num) {
		//					ref		re_step		re_level
		// 제목 글				10		0			0
		// ㄴ 나중에 쓴 답글		10		1			1
		// ㄴ 답글				10		2			1
		//   ㄴ 재답글			10		3			2
		
		// ref 같다		re_step + 1 같다		re_level 크다
		
		// 답글이 있는 경우 	삭제된 글입니다 변경
		// 답글이 없는 경우 	삭제
		BoardDataBean dto = getArticle(num);
		int count = SqlMapClient.getSession().selectOne("QnABoard_Team1.checkReply", dto);
		
		if(count != 0) {
			// 답글이 있는 경우
			return SqlMapClient.getSession().update("QnABoard_Team1.delArticle", num);
		}
		else {
			// 답글이 없는 경우
			SqlMapClient.getSession().update("QnABoard_Team1.deleteReply", dto);
			
			return SqlMapClient.getSession().delete("QnABoard_Team1.deleteArticle", num);
		}
	}
	
	public int modifyArticle(BoardDataBean dto) {
		return SqlMapClient.getSession().update("QnABoard_Team1.modifyArticle", dto);
	}
	///////////////////////////////////////////////////////////////////////////////
	/*
	 * 회원 관리
	 */
	public int insertMember(MemberDTO dto) {	// dto를 통해 입력 값을 한 바구니로 받았다.
		return SqlMapClient.getSession().insert("Member_Team1.insertMember", dto);
	}
	
	public int check(String memId) {
		return SqlMapClient.getSession().selectOne("Member_Team1.checkId", memId);
	}
	
	public int check(String memId, String memPasswd) {
		int result = 0;
		int count = check(memId);
			
		if(count == 1) {
			// 아이디가 있다.
			MemberDTO dto = getMember(memId);
			if(dto.getMemPasswd().equals(memPasswd)) {
				// 비밀번호가 같다.
				result = 1;
			}
			else {
				// 비밀번호가 다르다.
				result = 0;
			}
		}
		else {
			// 아이디가 없다.
			result = -1;
		}
		
		return result;
	}
	
//	// 회원 탈퇴 시 DB에서 회원 데이터를 삭제
	public int deleteMember(String memId) {
		return SqlMapClient.getSession().delete("Member_Team1.deleteMember", memId);
	}
	
	public MemberDTO getMember(String memId) {
		return SqlMapClient.getSession().selectOne("Member_Team1.getMember", memId);
	}
	
	public int modifyMember(MemberDTO dto) {
		return SqlMapClient.getSession().update("Member_Team1.modifyMember", dto);
	}
	
	// 장바구니
	
	//카트 시작
	public List<CartDTO> getCartList(String memid) {
		return  SqlMapClient.getSession().selectList("Cart_Team1.selectCart",memid);
	}
	//오더
	public List<OrdersDTO> getOrderList(String orderid) {
		return SqlMapClient.getSession().selectList("Order_Team1.selectOrder",orderid);
	}
}
