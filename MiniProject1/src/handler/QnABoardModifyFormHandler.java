package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnABoardModifyFormHandler implements CommandHandler{

	@RequestMapping("/qnaBoardModifyForm") // .do 생략 가능
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
		String pageNum = request.getParameter("pageNum");
		String memId = request.getParameter("memId");
		
		request.setAttribute("qnaNum", qnaNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("memId", memId);
		return new ModelAndView("/qnaBoard/qnaBoardModifyForm");
	}
}
