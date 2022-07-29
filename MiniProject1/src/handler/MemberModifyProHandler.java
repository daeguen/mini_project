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
public class MemberModifyProHandler implements CommandHandler {
	@Resource
	private ShopDAO shopDao;
	
	@RequestMapping("/memberModifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		
		MemberDTO dto = new MemberDTO();
		
		dto.setMemId((String) request.getSession().getAttribute("loginId"));
		
		dto.setMemPasswd(request.getParameter("memPasswd"));
		
		dto.setMemZonecode(request.getParameter("memZonecode"));
		dto.setMemAddress(request.getParameter("memAddress"));
		dto.setMemBuildingName(request.getParameter("memName"));
		dto.setMemAddrDetail(request.getParameter("memAddrDetail"));
	
		String memPhone = null;
		String phone1 =request.getParameter("phone1");
		String phone2 =request.getParameter("phone2");
		String phone3 =request.getParameter("phone3");
		if(!phone1.equals("")&& ! phone2.equals("")&&! phone3.equals("")){
			memPhone = phone1 + "-" + phone2 + "-" + phone3;
		}
		dto.setMemPhone(memPhone);
	
		String memEmail = null;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		if(! email1.equals("")&& !email2.equals("")){
			memEmail = email1+"@"+email2;
		}
		dto.setMemEmail(memEmail);
	
		
		int result = shopDao.modifyMember(dto);
		
		request.setAttribute("result", result );
		
		return new ModelAndView("/member/memberModifyPro");
	}
}
