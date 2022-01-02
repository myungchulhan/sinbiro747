package service;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import asist.AdminDAO;
import domain.CategoryVo;
import domain.GoodsVo;


@Service
public class GoodsList   {


	private SqlSession sql;
	
	//매핑
	private static String namespace = "com.mart.mappers.adminMapper";


	
	public List<GoodsVo> goodsList()  throws Exception {
		
		return sql.selectList(namespace + ".goodsList");	
	}


}	
