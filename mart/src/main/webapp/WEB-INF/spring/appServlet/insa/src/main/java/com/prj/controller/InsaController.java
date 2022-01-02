package com.prj.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.prj.dao.InsaDao;
import com.prj.service.InsaService;
import com.prj.util.AlreadyExistingEmailException;
import com.prj.util.AlreadyExistingIdException;
import com.prj.util.Pagination;
import com.prj.util.RegisterRequest;
import com.prj.util.RegisterRequestValidator;
import com.prj.util.SaveWord;
import com.prj.vo.Criteria;
import com.prj.vo.FileSaveVo;
import com.prj.vo.Member2VO;
import com.prj.vo.MemberVo;
import com.prj.vo.PageMaker;
import com.prj.vo.User1Vo;
import com.prj.vo.UserVo;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/insa/*")
public class InsaController {
	
	private static final Logger logger = LoggerFactory.getLogger(InsaController.class);
	
	@Inject
	InsaService service;
	
	@Inject
	private InsaDao dao;
	
	// 직원등록
	@RequestMapping(value = "p2", method = RequestMethod.GET)
	public void getp2() throws Exception {		
	 logger.info("-----------------------------------------------------------------------------------------p2");
	}
	
	// 직원등록
	@RequestMapping(value = "p3", method = RequestMethod.GET)
	public void getp3() throws Exception {		
	 logger.info("-----------------------------------------------------------------------------------------p3");
	}
	
	
	// 직원등록
	@RequestMapping(value = "p4", method = RequestMethod.GET)
	public void getp4() throws Exception {		
	 logger.info("-----------------------------------------------------------------------------------------p4");
	}
		
	
	// 직원등록
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public void getWrite() throws Exception {		
	 logger.info("get signup");
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public void postWrite(MemberVo vo,  Model model) throws Exception {
		 logger.info("get signup");	 		
		//service.write(vo);	
	}
	
	@RequestMapping(value = "gogo.do", method = RequestMethod.POST)
	public String postWrite2(MemberVo vo,  Model model, int[] del) throws Exception {
		 logger.info("get signup");
		 	
		 	Map<String, Object> delno = new HashMap<String, Object>();
		 	delno.put("id", del);
		 	if(del.length>0) 
			{ dao.delFile(delno);} 
		 	
		 	for (int chk : del) {
		 		System.out.println("받아온값---------------------------" + chk);
			}

			System.out.println("받아오자ㅏ.받아와---------------------------" + del);
			System.out.println("받아오자ㅏ.받아와---------------------------" + del);
			
			return "redirect:gogo.do";
	}
	
	@RequestMapping(value = "gogoddd.do", method = RequestMethod.POST)
	public String postlist2(MemberVo vo,  Model model, List<String> delChk, SaveWord cri ) throws Exception {
		logger.info("get signup");

	//	int listCnt = service.listCount(cri);
		System.out.println("받아오자ㅏ.받아와---------------------------" + delChk);
		System.out.println("받아오자ㅏ.받아와---------------------------" + delChk);
		System.out.println("받아오자ㅏ.받아와---------------------------" + delChk);
		System.out.println("받아오자ㅏ.받아와---------------------------" + delChk);
  	 
		return "redirect:gogo.do";
	}
	
	
	
	
    @RequestMapping(value="gogo.do", method=RequestMethod.GET)
    public String getlist2(
            @RequestParam(defaultValue="1") int curPage, 
            @RequestParam(defaultValue="") String searchType,
            @RequestParam(defaultValue="") String searchWord, Model model, SaveWord cri) throws Exception{
        
     int listCnt = service.listCount(cri);
   	 Pagination pagination = new Pagination(listCnt, curPage);
   	 pagination.setSearchType(searchType);
   	 pagination.setSearchWord(searchWord);
   	 
   	 
   	 List<MemberVo> list = service.listPage(pagination);
   	 model.addAttribute("list", list);
   	 model.addAttribute("listCnt", listCnt);
   	 
   	 model.addAttribute("pagination", pagination); 
        
     return "/insa/list2";
    }	
	
	@RequestMapping(value="detail", method=RequestMethod.GET)
		public void getDetail(@RequestParam("id") int id,
				 @ModelAttribute("pagination") 
				Pagination page, Model model) throws Exception {
		// logger.info(keepWord+ "ㄴㅇㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄴㄹㄹㄴㄹ");	
		
		MemberVo detail = service.detail(id);
		List<FileSaveVo> filedetail = dao.fileDetail(id);
		model.addAttribute("n", detail);
		model.addAttribute("fileDatil", filedetail);
	}
	
	@RequestMapping(value="delete")
	public String getDelete(int id, SaveWord sw) throws Exception {
		service.delete(id);
		return "redirect:list?curPage="+ sw.getCurPage()+"&searchType="
		+ sw.getSearchType()+"&searchWord="+ URLEncoder.encode(sw.getSearchWord(), "UTF-8");
		
	}
	
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public void getModify(@RequestParam("id") int id, Model model) throws Exception {
		MemberVo detail = service.detail(id);
		List<FileSaveVo> filedetail = dao.fileDetail(id);
		model.addAttribute("n", detail);
		model.addAttribute("fileDatil", filedetail);
	}
	
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String postModify(SaveWord sw, MemberVo vo) throws Exception {
		service.modify(vo);

		return "redirect:detail?id="+ sw.getId() +"&curPage="+ sw.getCurPage()+"&searchType="
		+ sw.getSearchType()+"&searchWord="+ URLEncoder.encode(sw.getSearchWord(), "UTF-8");
	}	


	
    @RequestMapping(value="list", method=RequestMethod.GET)
    public String paging(
            @RequestParam(defaultValue="1") int curPage, 
            @RequestParam(defaultValue="") String searchType,
            @RequestParam(defaultValue="") String searchWord, Model model, SaveWord cri) throws Exception{
        
     int listCnt = service.listCount(cri);
   	 Pagination pagination = new Pagination(listCnt, curPage);
   	 pagination.setSearchType(searchType);
   	 pagination.setSearchWord(searchWord);
   	 
   	 
   	 List<MemberVo> list = service.listPage(pagination);
   	 model.addAttribute("list", list);
   	 model.addAttribute("listCnt", listCnt);
   	 
   	 model.addAttribute("pagination", pagination); 
        
     return "/insa/list";
    }		
    
	
	@RequestMapping(value="step1")
	public String step1() throws Exception {
		return "/insa/step1";
	}   
    
    @RequestMapping(value="step2")
    public ModelAndView step2(@RequestParam(value="agree", defaultValue="false") Boolean agree) throws Exception {
        if(!agree) {
            ModelAndView mv = new ModelAndView("/insa/step1");
            return mv;
        }
        ModelAndView mv = new ModelAndView("/insa/step2");
        mv.addObject("registerRequest", new RegisterRequest());
        return mv;
    }
    
 //   @Resource(name="userService")
//    private UserService userSer;
 
    @RequestMapping(value="step3")
    public ModelAndView step3(RegisterRequest regReq, Errors errors) throws Exception{
    	
    	
        new RegisterRequestValidator().validate(regReq, errors);
        if(errors.hasErrors()) {
            ModelAndView mv = new ModelAndView("/insa/step2");
            return mv;
        }
  
    	String result = service.register(regReq);
    	if (result.equals("id_duble")) {
            errors.rejectValue("id", "duplicate", "이미 가입된 아이디입니다.");
            ModelAndView mv = new ModelAndView("/insa/step2");
            return mv;       		
    	}
    	
    	if (result.equals("email_duble")) {
            errors.rejectValue("email", "duplicate", "이미 가입된 이메일입니다.");
            ModelAndView mv = new ModelAndView("/insa/step2");
            return mv;       		
    	}        	
    	
 
        ModelAndView mv = new ModelAndView("/insa/step3");
        return mv;
    }
 
	
    @GetMapping("sign")
    public String memberSign(Model model) {
        logger.info("-------GET member sign");
        model.addAttribute("member2Vo", new Member2VO());

        return "/insa/sign_form";
    }


    @PostMapping(value = "sign")
    public String memberInsert(Model model, @ModelAttribute("member2Vo") @Valid Member2VO memberVo,
            BindingResult bindingResult, RedirectAttributes rttr) {
        logger.info("--------------POST member-----");
        logger.info("--------------POST member-----"+bindingResult.hasErrors());
        if (bindingResult.hasErrors()) {
            return "/insa/sign_form";
        }

        return "/insa/sign_form";
    }
   
    
    
}
