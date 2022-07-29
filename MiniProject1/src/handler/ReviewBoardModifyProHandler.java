package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.BoardDataBean;
import shop.ShopDAO;

@Controller
public class ReviewBoardModifyProHandler implements CommandHandler{

	@Resource
	private ShopDAO shopdao;  // 기본적으로 싱글톤으로 생성됨
	
	@RequestMapping("/reviewBoardModifyPro") // .do 생략 가능
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
	
//	<jsp:useBean id="dto" class="board.BoardDataBean"/>
//		<jsp:setProperty name="dto" property="*"/>
//		<!-- num email subject content passwd -->
		
		BoardDataBean dto = new BoardDataBean();
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setEmail(request.getParameter("email"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPasswd(request.getParameter("passwd"));
		
		String pageNum = request.getParameter("pageNum");

		int result = shopdao.modifyArticle(dto);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return new ModelAndView("/reviewBoard/reviewBoardModifyPro");
	}
}
