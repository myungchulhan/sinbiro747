package controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import domain.MemberVo;
import service.MemberService;


@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	MemberService service;
	
	

	@Autowired
	BCryptPasswordEncoder passEncoder;
	

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 회원 가입 get
	@RequestMapping(value = "regMember", method = RequestMethod.GET)
	public void getSignup() throws Exception {
	 logger.info("get signup");
	}

	// 회원 가입 post
	@RequestMapping(value = "regMember", method = RequestMethod.POST)
	public String postSignup(MemberVo vo) throws Exception {
	 logger.info("post signup");
	  System.out.println("사용자아이디: "+vo.getUserPass());
	 String inputPass = vo.getUserPass();
	 String pass = passEncoder.encode(inputPass);
	 vo.setUserPass(pass);

	 service.signup(vo);

	 return "redirect:/";
	}
	
	// 로그인  get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getlogin() throws Exception {
	 logger.info("get login");
	}

	// 로그인 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postlogin(MemberVo vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	 logger.info("post login");
	  System.out.println("사용자아이디1: "+vo.getUserId());
	 MemberVo login = service.login(vo);  
	 if(login != null) {	 	 
		 HttpSession session = req.getSession();
		//  System.out.println("사용자아이디3: "+vo.getUserId()+ "  사용자아이디4: "+login.getUserId()); 
		  System.out.println("사용자아이디3: "+login.getUserPass()); 
		  logger.info(login.getUserPass()); 
		 boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
	
		 if(passMatch) {
		  session.setAttribute("member", login);  
		 } else {
		  session.setAttribute("member", null);
		  rttr.addFlashAttribute("msg", false);	  	  
		 }
	 }
	 return "redirect:/member/login";
	}
	  
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
	 logger.info("get logout");
	 
	 service.logout(session);
	   
	 return "redirect:/";
	}	
	
	
}