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
public class ReviewBoardContentHandler implements CommandHandler{

	@Resource
	private ShopDAO shopdao;  // 기본적으로 싱글톤으로 생성됨
	
	@RequestMapping("/reviewBoardContent") // .do 생략 가능
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		int number = Integer.parseInt(request.getParameter("number"));
	
		// 조회수 늘리기를 여기 구현 시 데이터 출력 직전에 1 늘어남
		BoardDataBean dto = shopdao.getArticle(num);
		// 조회수 늘리기를 여기 구현 시 데이터 출력 후 목록으로 돌아가면 1 늘어남
		if(! dto.getIp().equals(request.getRemoteAddr())){
			// 자기가 쓴 글은 조회수 늘지 않음
			shopdao.addCount(num);
		}
		
		request.setAttribute("number", number);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("dto", dto);
		
		return new ModelAndView("/reviewBoard/reviewBoardContent");
	}
}
