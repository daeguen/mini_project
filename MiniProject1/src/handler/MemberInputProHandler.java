package handler;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.MemberDTO;
import shop.ShopDAO;

@Controller
public class MemberInputProHandler implements CommandHandler {

	@Resource
	private ShopDAO shopDao;

	@RequestMapping("/memberInputPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");

		MemberDTO dto = new MemberDTO();
		dto.setMemId(request.getParameter("memId")); /// ID
		dto.setMemPasswd(request.getParameter("memPasswd")); // Passwd
		dto.setMemName(request.getParameter("memName")); // 이름 
		dto.setMemZonecode(request.getParameter("memZonecode")); //
		dto.setMemAddress(request.getParameter("memAddress"));
		
		String memBuildingName = request.getParameter("memBuildingName"); 
		if(memBuildingName.equals("")) {
			memBuildingName = null;
		}
		dto.setMemBuildingName(memBuildingName);

		String memAddrDetail = request.getParameter("memAddrDetail");
		if(memAddrDetail.equals("")) {
			memAddrDetail = null;
		}
		dto.setMemAddrDetail(memAddrDetail);

		String memPhone = null;
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");

		if (!phone1.equals("") && !phone2.equals("") && !phone3.equals("")) {
			memPhone = phone1 + "-" + phone2 + "-" + phone3;
		}
		dto.setMemPhone(memPhone);

		String memEmail = null;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");

		if (!email1.equals("")) {
			if (email2.equals("0")) {
				// 직접입력
				memEmail = email1;
			} else {
				// 선택 입력
				memEmail = email1 + "@" + email2;
			}

		}
		dto.setMemEmail(memEmail);
		
		dto.setMemRegDate(new Timestamp(System.currentTimeMillis()));

		int result = shopDao.insertMember(dto);

		request.setAttribute("result", result);

		return new ModelAndView("/member/memberInputPro");
	}
}
