package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.ShopDAO;

@Controller
public class QnABoardDeleteProHandler implements CommandHandler{
	
	@Resource
	private ShopDAO shopDao;  // 기본적으로 싱글톤으로 생성됨
	
	@RequestMapping("/qnaBoardDeletePro") // .do 생략 가능
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
		String pageNum = request.getParameter("pageNum");
		String passwd = request.getParameter("passwd");

		int resultCheck = shopDao.qnaCheck(qnaNum, passwd);
		
		request.setAttribute("resultCheck", resultCheck);
		request.setAttribute("pageNum", pageNum);
		
		if(resultCheck != 0) {
			int result = shopDao.deleteQnAArticle(qnaNum);
			request.setAttribute("result", result);
		}
		
		return new ModelAndView("/qnaBoard/qnaBoardDeletePro");
	}
}
