package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.OrdersDTO;

@Controller
public class OrderInputProHandler implements CommandHandler{
	@RequestMapping( "/orderInputPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		// memName, orderAddress, 
		OrdersDTO dto = new OrdersDTO();
		dto.setMemId(request.getParameter("memId"));
		dto.setOrderAddress(request.getParameter("orderAddress"));
		
		return new ModelAndView ("/order/orderInputPro");
	}
}
