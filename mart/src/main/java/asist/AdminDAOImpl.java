package asist;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import domain.CategoryVo;
import domain.GoodsVo;
import domain.MemberVo;

@Repository
public class AdminDAOImpl implements AdminDAO  {

	@Inject
	private SqlSession sql;
	
	//매핑
	private static String namespace = "com.mart.mappers.adminMapper";
	
	@Override
	public List<CategoryVo> category() throws Exception {
		return sql.selectList(namespace + ".category");	
	}

	@Override
	public void register(GoodsVo vo) throws Exception {
		sql.insert(namespace + ".register",vo);	
	}
	
	@Override
	public List<GoodsVo> goodsList() throws Exception {
		return sql.selectList(namespace + ".goodsList");	
	}
	
	@Override
	public GoodsVo goodsView(int gdsNum)  throws Exception{
		return sql.selectOne(namespace + ".goodsView", gdsNum);
	}
	
	@Override
	public void modify(GoodsVo vo) throws Exception {
		sql.insert(namespace + ".goodsModify",vo);	
	}	

	@Override
	public void goodsDelete(int gdsNum)  throws Exception{
		sql.selectOne(namespace + ".goodsDelete", gdsNum);	
	}
}	
