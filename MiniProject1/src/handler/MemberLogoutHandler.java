package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class MemberLogoutHandler implements CommandHandler {
	@RequestMapping("/logout")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.getSession().removeAttribute("loginId");
		return new ModelAndView("/member/memberMain");
	}

}
