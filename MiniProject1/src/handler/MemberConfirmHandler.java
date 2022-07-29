package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.ShopDAO;
@Controller
public class MemberConfirmHandler implements CommandHandler{
	@Resource
	private ShopDAO shopDao;
	@RequestMapping("/memberConfirm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String memId = request.getParameter("memId");

				
		int result = shopDao.check(memId);
		
		request.setAttribute("result", result);
		request.setAttribute("memId", memId);
		
		return new ModelAndView ("/member/memberConfirm");
	}
}
