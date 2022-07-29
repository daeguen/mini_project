package handler;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.QnABoardDTO;
import shop.ShopDAO;

@Controller
public class QnABoardInputProHandler implements CommandHandler{
	
	@Resource
	private ShopDAO shopDao;
	
	@RequestMapping("/qnaBoardInputPro") // .do 생략 가능
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");

		QnABoardDTO dto = new QnABoardDTO();
		dto.setQnaNum(Integer.parseInt(request.getParameter("qnaNum")));		// hidden
		dto.setMemId(request.getParameter("memId"));
		dto.setQnaPasswd(request.getParameter("qnaPasswd"));
		dto.setQnaTitle(request.getParameter("qnaTitle"));
		dto.setQnaContent(request.getParameter("qnaContent"));
		dto.setQnaPhotoDir(request.getParameter("qnaPhotoDir"));
		dto.setQnaPhotoOriName(request.getParameter("qnaPhotoOriName"));
		dto.setQnaPhotoSysName(request.getParameter("qnaPhotoSysName"));
		dto.setQnaDate(new Timestamp(System.currentTimeMillis()));
		dto.setQnaHit(0);	// 새 글의 조회수는 0
		dto.setQnaIp(request.getRemoteAddr());
		
		int result = shopDao.insertQnAArticle(dto);
		
		request.setAttribute("result", result);
		
		return new ModelAndView("/qnaBoard/qnaBoardInputPro");
	}
}
