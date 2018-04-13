package com.sys.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sys.dao.BaseDao;
import com.sys.dao.SortDao;
import com.sys.entity.Commodity;
import com.sys.entity.Sort;
import com.sys.tool.PrimaryKeyCreator;

public class SortImpl extends BaseDao implements SortDao {

	public int addSort(Sort sort) {
		String sortid = PrimaryKeyCreator.getInstance().getUUID();
		String sql = "insert into tb_sorts values(?,?)";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, sortid);
			pst.setString(2, sort.getSortname());
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public int deleteSort(String sortid) {
		String sql = "delete from tb_sorts where sortid=?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, sortid);
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public List<Sort> findAllSort(Sort sort) {
		String sql = "select * from tb_sorts where 1=1";
		if (sort.getSortid() != null) {
			sql += " and sortid ='" + sort.getSortid() + "'";
		}
		if (sort.getSortname() != null) {
			sql += " and sortname ='" + sort.getSortname() + "'";
		}
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Sort> list = new ArrayList<Sort>();
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Sort sorts = new Sort();
				sorts.setSortid(rs.getString("sortid"));
				sorts.setSortname(rs.getString("sortname"));
				list.add(sorts);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return list;
	}
}
