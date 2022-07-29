package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DefaultHandler implements CommandHandler {
	@RequestMapping("/*")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setAttribute("result", "뭔가 오류가 있는듯 다시 확인하기!");
		return new ModelAndView("/main/default");
	}
	
}
