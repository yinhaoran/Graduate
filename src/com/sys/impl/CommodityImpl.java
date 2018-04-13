package com.sys.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sys.dao.BaseDao;
import com.sys.dao.CommodityDao;
import com.sys.entity.Commodity;
import com.sys.entity.Sort;
import com.sys.tool.PrimaryKeyCreator;

public class CommodityImpl extends BaseDao implements CommodityDao {
	public int addCommodity(Commodity commodity) {
		String comid = PrimaryKeyCreator.getInstance().getUUID();
		String sql = "insert into tb_commodity values(?,?,?,?,?,?,?)";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, comid);
			pst.setString(2, commodity.getComname());
			pst.setFloat(3, commodity.getPrice());
			pst.setInt(4, commodity.getInventory());
			pst.setString(5, commodity.getPicture());
			pst.setString(6, commodity.getDescribe());
			pst.setString(7, commodity.getSortid());
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		System.out.println(sql);
		return row;
	}

	public int updateCommodity(Commodity commodity) {
		String sql = "update `tb_commodity` set `comname` = ?,`price`=?,`inventory`=?,`picture`=?,`describe`=?,`sortid`=? where `comid`=?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, commodity.getComname());
			pst.setFloat(2, commodity.getPrice());
			pst.setInt(3, commodity.getInventory());
			pst.setString(4, commodity.getPicture());
			pst.setString(5, commodity.getDescribe());
			pst.setString(6, commodity.getSortid());
			pst.setString(7, commodity.getComid());
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public int deleteCommodity(String comid) {
		String sql = "delete from tb_commodity where comid = ?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, comid);
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public List<Commodity> findAllCommodity(Commodity commodity) {
		String sql = "select * from tb_commodity where 1=1";
		if (commodity.getComid() != null) {
			sql += " and comid='" + commodity.getComid() + "'";
		}
		if (commodity.getComname() != null) {
			sql += " and comname='" + commodity.getComname() + "'";
		}
		if (commodity.getPrice() != null) {
			sql += " and price='" + commodity.getPrice() + "'";
		}
		if (commodity.getInventory() != null) {
			sql += " and inventory='" + commodity.getInventory() + "'";
		}
		if (commodity.getPicture() != null) {
			sql += " and picture='" + commodity.getPicture() + "'";
		}
		if (commodity.getDescribe() != null) {
			sql += " and describe='" + commodity.getDescribe() + "'";
		}
		if (commodity.getSortid() != null) {
			sql += " and sortid='" + commodity.getSortid() + "'";
		}
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Commodity> list = new ArrayList<Commodity>();
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Commodity commoditys = new Commodity();
				commoditys.setComid(rs.getString("comid"));
				commoditys.setComname(rs.getString("comname"));
				commoditys.setPrice(rs.getFloat("price"));
				commoditys.setInventory(rs.getInt("inventory"));
				commoditys.setPicture(rs.getString("picture"));
				commoditys.setDescribe(rs.getString("describe"));
				commoditys.setSortid(rs.getString("sortid"));
				list.add(commoditys);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return list;
	}

	public Commodity getCommodityById(String comid) {
		String sql = "select * from tb_commodity where comid=?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		Commodity commoditys = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, comid);
			rs = pst.executeQuery();
			while (rs.next()) {
				commoditys = new Commodity();
				commoditys.setComid(rs.getString("comid"));
				commoditys.setComname(rs.getString("comname"));
				commoditys.setPrice(rs.getFloat("price"));
				commoditys.setInventory(rs.getInt("inventory"));
				commoditys.setPicture(rs.getString("picture"));
				commoditys.setDescribe(rs.getString("describe"));
				commoditys.setSortid(rs.getString("sortid"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return commoditys;
	}

	public List<Commodity> CommoditySuggest(String comname) {
		String sql = "select * from tb_commodity where comname like '" + comname + "%'";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Commodity> list = new ArrayList<Commodity>();
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Commodity commoditys = new Commodity();
				commoditys.setComid(rs.getString("comid"));
				commoditys.setComname(rs.getString("comname"));
				commoditys.setPrice(rs.getFloat("price"));
				commoditys.setInventory(rs.getInt("inventory"));
				commoditys.setPicture(rs.getString("picture"));
				commoditys.setDescribe(rs.getString("describe"));
				commoditys.setSortid(rs.getString("sortid"));
				list.add(commoditys);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return list;
	}

	public List<Commodity> CommodityInformat() {
		String sql = "select * from tb_commodity a left join tb_sorts b on a.sortid = b.sortid";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Commodity> list = new ArrayList<Commodity>();
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Commodity commoditys = new Commodity();
				commoditys.setComid(rs.getString("comid"));
				commoditys.setComname(rs.getString("comname"));
				commoditys.setPrice(rs.getFloat("price"));
				commoditys.setInventory(rs.getInt("inventory"));
				commoditys.setPicture(rs.getString("picture"));
				commoditys.setDescribe(rs.getString("describe"));
				commoditys.setSortid(rs.getString("sortid"));
				commoditys.setSortName(rs.getString("sortname"));
				list.add(commoditys);
			}
		} catch (SQLException e) {
			e.printStackTrace();  
		}
		return list;
	}
}
