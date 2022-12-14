package handler;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.BoardDataBean;
import shop.ShopDAO;

@Controller
public class ReviewBoardInputProHandler implements CommandHandler{
	
	@Resource
	private ShopDAO shopdao;  // 기본적으로 싱글톤으로 생성됨
	
	@RequestMapping("/reviewBoardInputPro") // .do 생략 가능
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
//		<jsp:useBean id="dto" class="board.BoardDataBean"/>
//			<jsp:setProperty name="dto" property="*"/>
//			<!-- writer email subject content passwd -->
//			<!-- num ref re_step re_level --> <!-- 강제로 넘어옴 -->

		BoardDataBean dto = new BoardDataBean();
		dto.setWriter(request.getParameter("writer"));
		dto.setEmail(request.getParameter("email"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPasswd(request.getParameter("passwd"));
		dto.setNum(Integer.parseInt(request.getParameter("num")));				// hidden
		dto.setRef(Integer.parseInt(request.getParameter("ref")));				// hidden
		dto.setRe_level(Integer.parseInt(request.getParameter("re_level")));	// hidden
		
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));				// hidden
		dto.setIp(request.getRemoteAddr());
		
		int result = shopdao.insertArticle(dto);
		
		request.setAttribute("result", result);
		
		return new ModelAndView("/reviewBoard/reviewBoardInputPro");
	}
}
