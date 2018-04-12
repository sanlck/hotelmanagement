package com.gx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gx.po.CommodityPo;

public interface CommodityDao {

    public int deleteById(Integer id);
	
	
	public int insertAll(CommodityPo commodityPo);
	
	
	public	CommodityPo selectById(Integer id);

	
	public int updateById(CommodityPo commodityPo);
	
	
	//分页模糊查询
    public List<CommodityPo> pageFuzzyselect(@Param("commodityName")String commodityName,
    		@Param("commodityTypeID")int commodityTypeID,@Param("start")int start,@Param("pageSize")int pageSize);
    
    //分页模糊查询总条数
    public int countFuzzyselect(@Param("commodityName")String commodityName, @Param("commodityTypeID")int commodityTypeID);
	
    //全部商品模糊查询
    public List<CommodityPo> pageFuzzysselect(@Param("commodityName")String commodityName,
    		@Param("start")int start,@Param("pageSize")int pageSize);
   //全部商品模糊查询总条数
    public int countFuzzysselect(@Param("commodityName")String commodityName);
    
    //ajax 验证是否存在 此商品
    public int selectYZ(String commodityName);
    
    
    
    
    
    
    
  //无分页的模糊查询  非本派所用
   public List<CommodityPo> fuzzySelect(@Param("commodityName")String commodityName,
		   @Param("commodityTypeID")int commodityTypeID);



    
}
