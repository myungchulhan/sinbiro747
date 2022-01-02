package com.prj.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.prj.util.Pagination;
import com.prj.util.RegisterRequest;
import com.prj.util.SaveWord;
import com.prj.vo.CatVo;
import com.prj.vo.Criteria;
import com.prj.vo.FileSaveVo;
import com.prj.vo.MemberVo;
import com.prj.vo.UserVo;

@Repository
public class InsaDaoImpl implements InsaDao  {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "insa.memberMapper"; 
	
	@Override
	public void write(MemberVo vo)  throws Exception {
		sql.insert(namespace + ".write", vo);	
	}
	
	@Override
	public void modify(MemberVo vo)  throws Exception {
		sql.update(namespace + ".modify", vo);
	}
	
	@Override
	public MemberVo detail(int id)  throws Exception {
		return sql.selectOne(namespace + ".detail", id);		
	}
	
	@Override
	public List<FileSaveVo> fileDetail(int id)  throws Exception {
		return sql.selectList(namespace + ".fileDetail", id);		
	}	
	
	@Override
	public FileSaveVo downFile(int id)  throws Exception {
		return sql.selectOne(namespace + ".downFile", id);		
	}	
	
	@Override
	public List<MemberVo> listPage(Pagination cri) throws Exception {
		return sql.selectList(namespace + ".listPage", cri);		
	}
	
	@Override
	public int listCount(SaveWord cri) throws Exception {
		return sql.selectOne(namespace + ".listCount",cri);		
	}
	
	@Override
	public void delete(int id)  throws Exception {
		sql.delete(namespace + ".delete", id);		
	}
	
	@Override
	public void insertFile(FileSaveVo vo) throws Exception {
		sql.insert(namespace + ".insertFile", vo);	
	}
	
	@Override
	public void regCode(CatVo vo) throws Exception {
		sql.insert(namespace + ".regCode", vo);	
	}
	
	@Override
	public void delFile(Map<String, Object> delno) throws Exception {
		sql.delete(namespace + ".delFile", delno);		
	}
	
	public List<CatVo> codeList() throws Exception{
		return sql.selectList(namespace + ".codeList");
	}
	
	
    public UserVo selectByEmail(String email) {
        return sql.selectOne(namespace + ".selectByEmail", email);
    }
 
    public UserVo selectById(String id) {
        return sql.selectOne(namespace + ".selectById", id);
    }
 
    public void insertUser(RegisterRequest regReq) {
        sql.insert(namespace + ".register", regReq);
    }


}

