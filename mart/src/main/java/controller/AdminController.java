package controller;

import java.io.File;
import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import domain.CategoryVo;
import domain.GoodsVo;
import domain.MemberVo;
import net.sf.json.JSONArray;
import service.AdminService;
import service.MemberService;
import utils.UploadFileUtils;


@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	AdminService adminService;
	
	// 파일업로드
	@Resource(name="uploadPath")
	private String uploadPath;

	// 관리자로그인후
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		logger.info("get signup");
	}

	// 상품 등록
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void getGoodsRegister(Model model) throws Exception {
	 logger.info("get goods register");
	 
	 List<CategoryVo> category = null;
	 category = adminService.category();
	 model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	// 상품 등록
	@RequestMapping(value = "/goods/register", method = RequestMethod.POST)
	public String postGoodsRegister(GoodsVo vo, MultipartFile file) throws Exception {
		
		System.out.println( "vo : " + ToStringBuilder.reflectionToString(vo) );

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "")  {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

	adminService.register(vo);
	 return "redirect:/admin/index";
	 
	}	
	
	// 상품 목록
	@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
	public void getGoodsList(Model model) throws Exception {
	 logger.info("get goods register");
	 
	 List<GoodsVo> list = adminService.goodsList();
	 System.out.println( "ㄴㄹㅈㄷㄱㅈㄱㅈㄱㅈㄱ : " + ToStringBuilder.reflectionToString(list) );
	 model.addAttribute("list", list);
	}	
	

	//상품상세보기
	@RequestMapping(value ="/goods/view", method = RequestMethod.GET)
	public void getGoodsView(@RequestParam("n") int gdsNum, Model model) throws Exception {
		GoodsVo vo = adminService.goodsView(gdsNum);
		model.addAttribute("goods", vo);
	}
	

	// 상품 수정
	@RequestMapping(value = "/goods/modify", method = RequestMethod.GET)
	public void getGoodsModify(@RequestParam("n") int gdsNum, Model model) throws Exception {
	 logger.info("get goods register");
	 
	 List<CategoryVo> category = null;
	 category = adminService.category();
	 GoodsVo vo = adminService.goodsView(gdsNum);
	 model.addAttribute("goods", vo);
	 model.addAttribute("category", JSONArray.fromObject(category));
	}	
	
	
	// 상품 수정
	@RequestMapping(value = "/goods/modify", method = RequestMethod.POST)
	public String postGoodsModify(GoodsVo vo) throws Exception {
		
	adminService.modify(vo);
	 return "redirect:/admin/goods/list";
	 
	}		
	
	//상품삭제
	@RequestMapping(value ="/goods/delete", method = RequestMethod.POST)
	public String getGoodsDelete(@RequestParam("n") int gdsNum, Model model) throws Exception {
		adminService.goodsDelete(gdsNum);
		return "redirect:/admin/goods/list";
	}
	

}
