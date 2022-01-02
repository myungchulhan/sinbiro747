package asist;

import java.sql.Date;

import domain.MemberVo;

public interface MemberDAO {

	public void signup(MemberVo vo) throws Exception;

	public MemberVo login(MemberVo vo) throws Exception;
	
}
