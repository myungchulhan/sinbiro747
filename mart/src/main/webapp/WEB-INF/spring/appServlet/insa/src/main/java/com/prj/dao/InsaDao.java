package com.prj.dao;

import java.util.List;
import java.util.Map;

import com.prj.util.Pagination;
import com.prj.util.RegisterRequest;
import com.prj.util.SaveWord;
import com.prj.vo.CatVo;
import com.prj.vo.Criteria;
import com.prj.vo.FileSaveVo;
import com.prj.vo.MemberVo;
import com.prj.vo.UserVo;

public interface InsaDao {
	public void write(MemberVo vo) throws Exception;
	
	public void modify(MemberVo vo) throws Exception;
	
	public MemberVo detail(int id) throws Exception;

	public List<FileSaveVo> fileDetail(int id) throws Exception;
	
	public FileSaveVo downFile(int id) throws Exception;
	
	public List<MemberVo> listPage(Pagination cri) throws Exception;
	
	public int listCount(SaveWord cri) throws Exception;
	
	public void delete(int id) throws Exception;
	
	public void insertFile(FileSaveVo vo) throws Exception;
	
	public void regCode(CatVo vo) throws Exception;
	
	public List<CatVo> codeList() throws Exception;
	
	public void delFile(Map<String, Object> delno) throws Exception;
	
    public UserVo selectByEmail(String email) throws Exception;
    
    public UserVo selectById(String id) throws Exception;
    
    public void insertUser(RegisterRequest regReq) throws Exception;
}
