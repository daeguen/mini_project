package handler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.CartDTO;
import shop.ShopDAO;
@Controller
public class CartContentHandler implements CommandHandler {
   @Resource
   private ShopDAO shopdao;
   @RequestMapping("/cartContent")
   @Override
   public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      /*
       * int prodNum =Integer.parseInt(request.getParameter("prodNum")); String
       * prodName =request.getParameter("prodName"); int
       * prodPrice=Integer.parseInt(request.getParameter("prodPrice")); int
       * prodQuantity=Integer.parseInt(request.getParameter("prodQuantity")); String
       * prodPhotoDir = request.getParameter("prodPhotoDir"); String prodPhotoOriName=
       * request.getParameter("prodPhoto"); String prodPhotoSysName=
       * request.getParameter("prodPhotoSysName");
       */
      
      String loginId = (String) request.getSession().getAttribute("loginId");
      
      if(loginId != null) {
    	  List<CartDTO> dtos = shopdao.getCartList(loginId);
    	  request.setAttribute("dtos", dtos);
      }
      return new ModelAndView("/cart/cartContent");
   }
}
       
      