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
public class QnABoardContentHandler implements CommandHandler{

	@Resource
	private ShopDAO shopDao;
	
	@RequestMapping("/qnaBoardContent") // .do 생략 가능
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int qnaNum = Integer.parseInt(request.getParameter("qnaNum")); //
		String pageNum = request.getParameter("pageNum"); //페이지 넘버 
		int number = Integer.parseInt(request.getParameter("number")); // 
	
		// 조회수 늘리기를 여기 구현 시 데이터 출력 직전에 1 늘어남
		QnABoardDTO dto = shopDao.getQnAArticle(qnaNum);
		// 조회수 늘리기를 여기 구현 시 데이터 출력 후 목록으로 돌아가면 1 늘어남
		if(! dto.getQnaIp().equals(request.getRemoteAddr())){
			// 자기가 쓴 글은 조회수 늘지 않음
			shopDao.addQnACount(qnaNum);
		}
		
		request.setAttribute("number", number);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("dto", dto);
		
		return new ModelAndView("/qnaBoard/qnaBoardContent");
	}
}
