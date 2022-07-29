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
public class ReviewBoardModifyViewHandler implements CommandHandler{

	@Resource
	private ShopDAO shopdao;  // 기본적으로 싱글톤으로 생성됨
	
	@RequestMapping("/reviewBoardModifyView") // .do 생략 가능
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String passwd = request.getParameter("passwd");

		int result = shopdao.check(num, passwd);
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		if(result != 0) {
			BoardDataBean dto = shopdao.getArticle(num);
			request.setAttribute("dto", dto);
		}
		return new ModelAndView("/reviewBoard/reviewBoardModifyView");
	}
}
