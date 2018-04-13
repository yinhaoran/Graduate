package com.sys.dao;

import java.util.List;

import com.sys.entity.Sort;

/**
 * 
 * ClassName: SortDao <br/>
 * Function: TODO 商品分类管理DAO <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2018年3月28日 下午4:43:11 <br/>
 * 
 * @author yin
 * @version
 * @since JDK 1.8
 */
public interface SortDao {
	public int addSort(Sort sort);

	public List<Sort> findAllSort(Sort sort);

	public int deleteSort(String sortid);
}
