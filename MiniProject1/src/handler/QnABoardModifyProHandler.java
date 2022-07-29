package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.QnABoardDTO;
import shop.ShopDAO;

@Controller
public class QnABoardModifyProHandler implements CommandHandler{

	@Resource
	private ShopDAO shopDao;  // 기본적으로 싱글톤으로 생성됨
	
	@RequestMapping("/qnaBoardModifyPro") // .do 생략 가능
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		
		QnABoardDTO dto = new QnABoardDTO();
		dto.setQnaNum(Integer.parseInt(request.getParameter("qnaNum")));
		dto.setQnaTitle(request.getParameter("qnaTitle"));
		dto.setQnaContent(request.getParameter("qnaContent"));
		
		String pageNum = request.getParameter("pageNum");

		int result = shopDao.modifyQnAArticle(dto);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return new ModelAndView("/qnaBoard/qnaBoardModifyPro");
	}
}
