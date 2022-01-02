package util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import domain.MemberVo;

public class AdminInterceptor extends HandlerInterceptorAdapter {

 @Override
 public boolean preHandle(HttpServletRequest req,
    HttpServletResponse res, Object obj) throws Exception {
  
  HttpSession session = req.getSession();
  MemberVo member = (MemberVo)session.getAttribute("member");
  
  if(member == null || member.getVerify() != 9) {
   res.sendRedirect("/member/login");
   return false;
  }
  
  return true;
 }
}