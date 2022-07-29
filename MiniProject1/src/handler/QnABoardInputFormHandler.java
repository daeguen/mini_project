package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.ShopDAO;

@Controller
public class QnABoardInputFormHandler implements CommandHandler{

	@Resource
	private ShopDAO shopDao;
	
	@RequestMapping("/qnaBoardInputForm") // .do 생략 가능
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int qnaNum = shopDao.maxQnANum() + 1;
		request.setAttribute("qnaNum", qnaNum);
		
		String memId = (String) request.getSession().getAttribute("loginId");
		if(memId != null) {
			request.setAttribute("memId", memId);
			request.setAttribute("qnaPasswd", shopDao.getMember(memId).getMemPasswd());
		}
		
		return new ModelAndView("/qnaBoard/qnaBoardInputForm");
	}
}
