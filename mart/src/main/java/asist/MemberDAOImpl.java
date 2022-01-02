package asist;

import java.sql.Date;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import domain.MemberVo;

@Repository
public class MemberDAOImpl implements MemberDAO  {

	@Inject
	private SqlSession sql;
	
	//매핑
	private static String namespace = "com.mart.mappers.memberMapper";
	
	@Override
	public void signup(MemberVo vo) throws Exception {
		sql.insert(namespace + ".signup", vo);	
	}

	@Override
	public MemberVo login(MemberVo vo) throws Exception {
		return sql.selectOne(namespace + ".login", vo);	
	}
	
}
