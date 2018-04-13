package com.sys.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sys.dao.BaseDao;
import com.sys.dao.ShipAddressDao;
import com.sys.entity.ShipAddress;
import com.sys.tool.PrimaryKeyCreator;

public class ShipAddressImpl extends BaseDao implements ShipAddressDao {

	public int addShipAddress(ShipAddress shipAddress) {
		String shipAddressid = PrimaryKeyCreator.getInstance().getUUID();
		String sql = "insert into tb_shipaddress values(?,?,?,?,?,?,0)";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, shipAddressid);
			pst.setString(2, shipAddress.getUserid());
			pst.setString(3, shipAddress.getReceiverperson());
			pst.setString(4, shipAddress.getShiptelephone());
			pst.setString(5, shipAddress.getLocation());
			pst.setString(6, shipAddress.getDetailAddress());
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public int updateShipAddress(ShipAddress shipAddress) {
		String sql = "update tb_shipaddress set userid=?,receiverperson=?,shiptelephone=?,location=?,detailAddress=?,sign=? where addressid=?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, shipAddress.getUserid());
			pst.setString(2, shipAddress.getReceiverperson());
			pst.setString(3, shipAddress.getShiptelephone());
			pst.setString(4, shipAddress.getLocation());
			pst.setString(5, shipAddress.getDetailAddress());
			pst.setString(6, shipAddress.getSign());
			pst.setString(7, shipAddress.getAddressid());
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public int deleteShipAddress(String addressid) {
		String sql = "delete from tb_shipaddress where addressid = ?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, addressid);
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public List<ShipAddress> findAllShipAddress(ShipAddress shipAddress) {
		String sql = "select * from tb_shipaddress where 1=1 ";
		if (shipAddress.getUserid() != null) {
			sql += "and userid='" + shipAddress.getUserid() + "'";

		}
		if (shipAddress.getAddressid() != null) {
			sql += "and addressid='" + shipAddress.getAddressid() + "'";

		}
		if (shipAddress.getReceiverperson() != null) {
			sql += "and receiverperson='" + shipAddress.getReceiverperson() + "'";

		}
		if (shipAddress.getShiptelephone() != null) {
			sql += "and receiverperson='" + shipAddress.getShiptelephone() + "'";

		}
		if (shipAddress.getLocation() != null) {
			sql += "and location='" + shipAddress.getLocation() + "'";

		}
		if (shipAddress.getDetailAddress() != null) {
			sql += "and detailAddress='" + shipAddress.getDetailAddress() + "'";

		}
		if (shipAddress.getSign() != null) {
			sql += "and sign='" + shipAddress.getSign() + "'";

		}
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<ShipAddress> list = new ArrayList<ShipAddress>();
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				ShipAddress sa = new ShipAddress();
				sa.setAddressid(rs.getString("addressid"));
				sa.setUserid(rs.getString("userid"));
				sa.setReceiverperson(rs.getString("receiverperson"));
				sa.setShiptelephone(rs.getString("shiptelephone"));
				sa.setLocation(rs.getString("location"));
				sa.setDetailAddress(rs.getString("detailAddress"));
				sa.setSign(rs.getString("sign"));
				list.add(sa);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return list;
	}

	public ShipAddress getShipAddressById(String addressid) {
		String sql = "select * from tb_shipaddress where addressid = ?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		ShipAddress sa = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, addressid);
			rs = pst.executeQuery();
			while (rs.next()) {
				sa = new ShipAddress();
				sa.setAddressid(rs.getString("addressid"));
				sa.setUserid(rs.getString("userid"));
				sa.setReceiverperson(rs.getString("receiverperson"));
				sa.setShiptelephone(rs.getString("shiptelephone"));
				sa.setLocation(rs.getString("location"));
				sa.setDetailAddress(rs.getString("detailAddress"));
				sa.setSign(rs.getString("sign"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return sa;
	}
}
