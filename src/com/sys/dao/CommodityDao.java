package com.sys.dao;

import java.util.List;

import com.sys.entity.Commodity;

/**
 * 
 * ClassName: CommodityDao <br/>  
 * Function: 商品Dao <br/>  
 * Reason: TODO ADD REASON(可选). <br/>  
 * date: 2018年3月28日 下午4:51:02 <br/>  
 *  
 * @version   
 * @since JDK 1.8
 */
public interface CommodityDao {
	/**
	 * 
	 * addCommodity:(添加商品). <br/>  
	 *
	 * @param commodity
	 * @return  
	 * @since JDK 1.8
	 */
	public int addCommodity(Commodity commodity);

	/**
	 * 
	 * updateCommodity:修改商品. <br/>  
	 *
	 * @author yin  
	 * @param commodity
	 * @return  
	 * @since JDK 1.8
	 */
	public int updateCommodity(Commodity commodity);

	/**
	 * 
	 * deleteCommodity:(删除商品). <br/>  
	 *
	 * @param comid
	 * @return  
	 * @since JDK 1.8
	 */
	public int deleteCommodity(String comid);

	/**
	 * 
	 * findAllCommodity:(按条件查询商品). <br/>  
	 *
	 * @param commodity
	 * @return  
	 * @since JDK 1.8
	 */
	public List<Commodity> findAllCommodity(Commodity commodity);

	/**
	 * 
	 * getCommodityById:(根据ID查找 商品). <br/>  
	 *
	 * @param comid
	 * @return  
	 * @since JDK 1.8
	 */
	public Commodity getCommodityById(String comid);

	/**
	 * 
	 * CommoditySuggest:(商品名称模糊查询). <br/>  
	 *
	 * @param comname
	 * @return  
	 * @since JDK 1.8
	 */
	public List<Commodity> CommoditySuggest(String comname);
	
	public List<Commodity> CommodityInformat();
}
