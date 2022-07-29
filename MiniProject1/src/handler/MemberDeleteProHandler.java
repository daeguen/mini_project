package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.ShopDAO;

@Controller
public class MemberDeleteProHandler implements CommandHandler {
	
	@Resource
	private ShopDAO shopDao;
	
	@RequestMapping("/memberDeletePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String memId = (String) request.getSession().getAttribute("loginId");
		String memPasswd = request.getParameter("memPasswd");
	
		
		int resultCheck = shopDao.check (memId, memPasswd);
		
		request.setAttribute( "resultCheck", resultCheck );
		
		if ( resultCheck != 0 ) {										// 비번이 일치할때만 수정하기위해 IF문 안쪽에
			int result = shopDao.deleteMember( memId );
			request.setAttribute( "result", result );
		}
		
		return new ModelAndView("/member/memberDeletePro");
	}

}
