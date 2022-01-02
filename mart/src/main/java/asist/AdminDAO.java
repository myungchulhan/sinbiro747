package asist;

import java.sql.Date;
import java.util.List;

import domain.CategoryVo;
import domain.GoodsVo;
import domain.MemberVo;

public interface AdminDAO {


	public List<CategoryVo> category() throws Exception;
	public void register(GoodsVo vo) throws Exception;
	public List<GoodsVo> goodsList() throws Exception;	
	public GoodsVo goodsView(int gdsNum) throws Exception;
	public void modify(GoodsVo vo) throws Exception;
	public void goodsDelete(int gdsNum) throws Exception;
}
