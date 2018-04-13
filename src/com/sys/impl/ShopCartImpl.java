package com.sys.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sys.dao.BaseDao;
import com.sys.dao.ShopCartDao;
import com.sys.entity.Commodity;
import com.sys.entity.ShopCart;
import com.sys.tool.PrimaryKeyCreator;

public class ShopCartImpl extends BaseDao implements ShopCartDao {

	public int addShopCart(ShopCart shopcart) {
		String shopcartid = PrimaryKeyCreator.getInstance().getUUID();
		String sql = "insert into tb_shopcart values(?,?,?,?)";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, shopcartid);
			pst.setString(2, shopcart.getComid());
			pst.setInt(3, shopcart.getComcount());
			pst.setString(4, shopcart.getUserid());
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public int updateShopCart(ShopCart shopcart) {
		String sql = "update tb_shopcart set comid=?,comcount=? " + "where shopcartid=?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, shopcart.getComid());
			pst.setInt(2, shopcart.getComcount());
			pst.setString(3, shopcart.getShopcartid());
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public int deleteShopCart(String shopcartid) {
		String sql = "delete from tb_shopcart where shopcartid = ?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, shopcartid);
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public List<ShopCart> findAllShopCart(ShopCart shopcart) {
		String sql = "select * from tb_shopcart s,tb_commodity c where s.comid=c.comid ";
		if (shopcart.getShopcartid() != null) {
			sql += " and s.shopcartid='" + shopcart.getShopcartid() + "'";
		}
		if (shopcart.getComid() != null) {
			sql += " and s.comid='" + shopcart.getComid() + "'";
		}
		if (shopcart.getComcount() != null) {
			sql += " and s.comcount='" + shopcart.getComcount() + "'";
		}
		if (shopcart.getUserid() != null) {
			sql += " and s.userid='" + shopcart.getUserid() + "'";
		}
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<ShopCart> list = new ArrayList<ShopCart>();
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				ShopCart sc = new ShopCart();
				sc.setUserid(rs.getString("userid"));
				sc.setShopcartid(rs.getString("shopcartid"));
				sc.setComid(rs.getString("comid"));
				sc.setComcount(rs.getInt("comcount"));
				Commodity commodity = new Commodity();
				commodity.setComid(rs.getString("comid"));
				commodity.setComname(rs.getString("comname"));
				commodity.setDescribe(rs.getString("describe"));
				commodity.setInventory(rs.getInt("inventory"));
				commodity.setPicture(rs.getString("picture"));
				commodity.setPrice(rs.getFloat("price"));
				commodity.setSortid(rs.getString("sortid"));
				sc.setCommodity(commodity);
				list.add(sc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return list;
	}

	public ShopCart getShopCartById(String shopcartid) {
		String sql = "select * from tb_shopcart where shopcartid=?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		ShopCart sc = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, shopcartid);
			rs = pst.executeQuery();

			while (rs.next()) {
				sc = new ShopCart();
				sc.setUserid(rs.getString("userid"));
				sc.setShopcartid(rs.getString("shopcartid"));
				sc.setComid(rs.getString("comid"));
				sc.setComcount(rs.getInt("comcount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return sc;
	}

	public int deleteShopCartByUserid(String userid) {
		String sql = "delete from tb_shopcart where userid=?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, userid);
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public int shopCartCount(String userid) {
		String sql = "select count(*) from tb_shopcart where userid=?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, userid);
			rs = pst.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return count;
	}

}