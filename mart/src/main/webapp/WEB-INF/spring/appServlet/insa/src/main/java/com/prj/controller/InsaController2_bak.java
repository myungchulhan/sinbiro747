package com.prj.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.prj.service.InsaService;
import com.prj.vo.Criteria;
import com.prj.vo.MemberVo;
import com.prj.vo.PageMaker;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/insa/*")
public class InsaController2_bak {
	
	/*
	 * private static final Logger logger =
	 * LoggerFactory.getLogger(InsaController2_bak.class);
	 * 
	 * @Inject InsaService service;
	 * 
	 * // 직원등록
	 * 
	 * @RequestMapping(value = "write", method = RequestMethod.GET) public void
	 * getWrite() throws Exception { logger.info("get signup"); }
	 * 
	 * @RequestMapping(value = "write", method = RequestMethod.POST) public void
	 * postWrite(MemberVo vo, Model model) throws Exception { service.write(vo); }
	 * 
	 * @RequestMapping(value="detail", method=RequestMethod.GET) public void
	 * getDetail(@RequestParam("id") int id, Model model) throws Exception {
	 * MemberVo detail = service.detail(id); model.addAttribute("n", detail); }
	 * 
	 * @RequestMapping(value="modify", method=RequestMethod.GET) public void
	 * getModify(@RequestParam("id") int id, Model model) throws Exception {
	 * MemberVo detail = service.detail(id); model.addAttribute("n", detail); }
	 * 
	 * @RequestMapping(value="modify", method=RequestMethod.POST) public String
	 * postModify(MemberVo vo) throws Exception { service.modify(vo);
	 * 
	 * return "redirect:detail?id="+ vo.getId(); }
	 * 
	 * // 글 목록 + 페이징
	 * 
	 * @RequestMapping(value = "/list", method = RequestMethod.GET) public void
	 * listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
	 * logger.info("get list page");
	 * 
	 * List<MemberVo> list = service.listPage(cri); model.addAttribute("list",
	 * list);
	 * 
	 * PageMaker pageMaker = new PageMaker(); pageMaker.setCri(cri);
	 * pageMaker.setTotalCount(service.listCount()); model.addAttribute("pageMaker",
	 * pageMaker); }
	 */
	
}
