package com.sys.index.service.itf;

import java.util.List;

import com.sys.entity.Sort;

public interface SortService {
	public List<Sort> findAllSort(Sort sort);

	public boolean addSorts(Sort sort);

	public boolean deleteSorts(String sortid);
}
