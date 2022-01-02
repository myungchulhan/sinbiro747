package com.prj.util;

import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.prj.controller.InsaController;
import com.prj.dao.InsaDao;
import com.prj.service.InsaService;
import com.prj.vo.CatVo;
import com.prj.vo.FileSaveVo;
import com.prj.vo.MemberVo;

import net.sf.json.JSONArray;



@Controller
public class UploadFile {
	
	@Inject
	InsaService service;
	
	@Inject
	private InsaDao dao;
	
	private static final Logger logger = LoggerFactory.getLogger(UploadFile.class);
	
	@RequestMapping(value = "/p3", method = RequestMethod.GET )
	public String getRegProduct(Model model) throws Exception {
		List<CatVo> code = dao.codeList();
		model.addAttribute("code", JSONArray.fromObject(code));
		return "/insa/p3";
	}
	
	@RequestMapping(value = "/cat", method = RequestMethod.GET)
	public void getCat() {}
	
	@ResponseBody
	@RequestMapping(value = "/cat2", method = RequestMethod.POST, produces = "application/text; charset=UTF-8" )
	public String postCat2(int subcode, String subcodename) throws Exception {
		
		System.out.println("값 넘어오나----------------------------" + subcode);
		System.out.println("값 넘어오나----------------------------" + subcodename);
		if(!subcodename.equals("")) {
			CatVo cat = new CatVo();
			cat.setCode2(subcode);
			cat.setCodename(subcodename);
				dao.regCode(cat);
		}
		List<CatVo> code = dao.codeList();
	//	 model.addAttribute("category", JSONArray.fromObject(category));
		System.out.println("값 넘어가나www----------------------------" + JSONArray.fromObject(code));
		String data = JSONArray.fromObject(code).toString();
		System.out.println("값 넘어가나----------------------------" + data);
		
		return data;		
	}	
	
	@ResponseBody
	@RequestMapping(value = "/cat", method = RequestMethod.POST, produces = "application/text; charset=UTF-8" )
	public String postCat(CatVo cat, Model model) throws Exception {
		
		String codename = cat.getCodename();
		System.out.println("값 넘어오나----------------------------" + codename);
		dao.regCode(cat);
		List<CatVo> code = dao.codeList();
	//	 model.addAttribute("category", JSONArray.fromObject(category));
		System.out.println("값 넘어가나www----------------------------" + JSONArray.fromObject(code));
		String data = JSONArray.fromObject(code).toString();
		System.out.println("값 넘어가나----------------------------" + data);
		
		return data;
	}
	
	
	@RequestMapping(value = "/insa/upload", method = RequestMethod.GET)
	public void fileUpload() {}
	
	@ResponseBody
	@RequestMapping(value = "/insa/upload", method = RequestMethod.POST)
	public String fileUpload(String boardName, String delfile, String mode,  MemberVo vo,
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, HttpServletRequest request) throws Exception {
		String strResult = "{ \"result\":\"FAIL\" }";
				
		/*
		 * if(mode.equals("modify")) { service.modify(vo); if(delfile != null &&
		 * !delfile.equals("")) { dao.delFile(delfile);} } else { service.write(vo); }
		 */
		
		int insaId = vo.getId(); /// write.jsp페이지에서 company_member 테이블에 insert하면 id값을가져와서
		                         /// file테이블에 인서트할때 연결해준다.
		System.out.println("값 가져오나insaId-------    "+  delfile);
	

		
		String fileRoot;
		try {
			// 파일이 있을때 탄다.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
			
				fileRoot = contextRoot + "resources" + File.separator 
						+ "upload" + File.separator + "board3";
				fileRoot += calcPath(fileRoot); 
				for(MultipartFile file:multipartFile) {
					
					System.out.println(fileRoot);
					long fileSize = file.getSize(); //파일크기
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
					
					File targetFile = new File(fileRoot + savedFileName);
					FileSaveVo filesave = new FileSaveVo();
					filesave.setBoardName(boardName);
					filesave.setBoardId(insaId);
					filesave.setOriginalFileName(originalFileName);
					filesave.setSavedFileName(savedFileName);
					filesave.setFilePath(fileRoot + savedFileName);
					filesave.setFileType(extension);
					filesave.setFileSize(fileSize);
					filesave.setBoardName(boardName);
					
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						service.insertFile(filesave);
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\" }";
		}catch(Exception e){
			e.printStackTrace();
		}
		return strResult;
	}	

	//폴더이름 및 폴더 생성
	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE))+ File.separator;

		makeDir(uploadPath, yearPath, monthPath, datePath);
		return datePath;
	}
	//폴더 생성
	private static void makeDir(String uploadPath, String... paths) {

		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}

		for (String path : paths) {
			File dirPath = new File(uploadPath + path);

			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}	
}
