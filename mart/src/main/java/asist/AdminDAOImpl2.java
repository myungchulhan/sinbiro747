package asist;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import domain.MemberVo;

@Repository
public class AdminDAOImpl2 implements AdminDAO2 {
	@Inject
	SqlSession sql;
	private String namespace = "com.prj.insa";
	
	@Override
	public void memberWrite(MemberVo vo) throws Exception {
		sql.insert(namespace + "write", vo);		
	}
}
