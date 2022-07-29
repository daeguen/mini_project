package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.ShopDAO;

@Controller
public class ReviewBoardDeleteProHandler implements CommandHandler{
	
	@Resource
	private ShopDAO shopdao;  // 기본적으로 싱글톤으로 생성됨
	
	@RequestMapping("/reviewBoardDeletePro") // .do 생략 가능
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String passwd = request.getParameter("passwd");

		int resultCheck = shopdao.check(num, passwd);
		
		request.setAttribute("resultCheck", resultCheck);
		request.setAttribute("pageNum", pageNum);
		
		if(resultCheck != 0) {
			int result = shopdao.deleteArticle(num);
			request.setAttribute("result", result);
		}
		
		return new ModelAndView("/reviewBoard/reviewBoardDeletePro");
	}
}
