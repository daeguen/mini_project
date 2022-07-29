package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnABoardDeleteFormHandler implements CommandHandler{
	@RequestMapping("/qnaBoardDeleteForm") // .do 생략 가능
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
		String pageNum = request.getParameter("pageNum");
		
		request.setAttribute("qnaNum", qnaNum);
		request.setAttribute("pageNum", pageNum);
		return new ModelAndView("/qnaBoard/qnaBoardDeleteForm");
	}
}
