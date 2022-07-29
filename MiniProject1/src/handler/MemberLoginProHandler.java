package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.ShopDAO;

@Controller
public class MemberLoginProHandler implements CommandHandler {
	
	@Resource
	private ShopDAO shopDao;
	
	@RequestMapping("/memberLoginPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String memId = request.getParameter( "memId" );
		String memPasswd = request.getParameter( "memPasswd" );
		
		
		int result = shopDao.check( memId, memPasswd );
		
		request.setAttribute("result", result); 				// 결과값을 애가 가지고 있기때문에 로그인프로 jsp로 던져줘야함
		request.setAttribute("memId", memId);					
		
		return new ModelAndView ("/member/memberLoginPro");
	}
}
