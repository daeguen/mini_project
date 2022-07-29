package handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.QnABoardDTO;
import shop.ShopDAO;

// 메인페이지 요청을 처리해줄 클래스

@Controller
public class QnABoardListHandler implements CommandHandler{
	
	@Resource
	private ShopDAO shopDao;
	
	@RequestMapping("/qnaBoardList") // .do 생략 가능
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int pageSize = 10; // 한 페이지에 출력할 최대 글의 개수
		int pageBlock = 3;
		
		int count = 0;
		String pageNum = null;
		int currentPage = 0;
		int start = 0;
		int end = 0;
		int number = 0;
		
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;
		
		pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		currentPage = Integer.parseInt(pageNum);
		start = (currentPage - 1) * pageSize + 1;		// 예)5페이지를 보려고 할 때: (5 - 1) * 10 + 1		41
		end = start + pageSize - 1;						// 41 + 10 - 1 = 							50
		
		count = shopDao.getQnACount();
		
		if(end > count)			// 글의 총 갯수가 end 보다 크면 end값을 count로 한다.
			end = count;
		
		number = count - (currentPage - 1) * pageSize;	// 50 - (5 - 1) * 10 = 10

		pageCount = (count / pageSize) + (count % pageSize > 0 ? 1 : 0);
		startPage = (currentPage / pageBlock) * pageBlock + 1;	// (19 / 10) * 10 + 1				11
		if(currentPage % pageBlock == 0)
			startPage -= pageBlock;
		endPage = startPage + pageBlock - 1;					// 11 + 10 - 1 						20
		if(endPage > pageCount)
			endPage = pageCount;
		
		request.setAttribute("count", count);
		request.setAttribute("number", number);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNum", pageNum);
		
		if(count != 0) {
			Map<String, Integer> map = new HashMap<String,Integer>();
			map.put("start", start);
			map.put("end", end);
			List<QnABoardDTO> dtos = shopDao.getQnAArticles(map);
			request.setAttribute("dtos", dtos);
		}
		return new ModelAndView("/qnaBoard/qnaBoardList"); // QnABoardListHandler가 메인.jsp로 보내줄 것
	}
}
