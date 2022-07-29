package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.MemberDTO;
import shop.ShopDAO;
@Controller
public class MemberModifyViewHandler implements CommandHandler{
	@Resource
	private ShopDAO shopDao;
	@RequestMapping("memberModifyView")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		   
		String memId = (String) request.getSession().getAttribute("loginId");
		String memPasswd = request.getParameter("memPasswd");
		   
		
		int result= shopDao.check(memId, memPasswd);

		request.setAttribute("result", result);
		
		if( result != 0 ) {
			MemberDTO dto = shopDao.getMember( memId );
			request.setAttribute("dto", dto);					// 바구니 객체를 넘겨도 상관이 없다
		}
		
		
		return new ModelAndView("/member/memberModifyView");
	}
}
