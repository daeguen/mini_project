package handler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.OrdersDTO;
import shop.ShopDAO;


@Controller
public class OrderInputFormHandler implements CommandHandler {
	@Resource
	private ShopDAO shopdao;

	@RequestMapping("/orderInputForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String memId = (String) request.getSession().getAttribute("memId");

		if (memId != null) {
			List<OrdersDTO> dtos = shopdao.getOrderList(memId);
			request.setAttribute("dtos", dtos);

		}
		return new ModelAndView("/order/orderInputForm");

	}
}