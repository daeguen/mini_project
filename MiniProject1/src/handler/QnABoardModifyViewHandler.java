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
public class QnABoardModifyViewHandler implements CommandHandler{

	@Resource
	private ShopDAO shopDao;  // 기본적으로 싱글톤으로 생성됨
	
	@RequestMapping("/qnaBoardModifyView") // .do 생략 가능
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
		String pageNum = request.getParameter("pageNum");
		String passwd = request.getParameter("passwd");

		int result = shopDao.qnaCheck(qnaNum, passwd);
		
		request.setAttribute("qnaNum", qnaNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		if(result != 0) {
			QnABoardDTO dto = shopDao.getQnAArticle(qnaNum);
			request.setAttribute("dto", dto);
		}
		return new ModelAndView("/qnaBoard/qnaBoardModifyView");
	}
}
