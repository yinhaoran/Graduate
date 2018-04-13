package com.sys.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sys.dao.BaseDao;
import com.sys.dao.OrderDetailDao;
import com.sys.entity.OrderDetail;
import com.sys.tool.PrimaryKeyCreator;

public class OrderDetailImpl extends BaseDao implements OrderDetailDao {

	public int addOrderDetail(OrderDetail orderdetail) throws Exception {
		String detailid = PrimaryKeyCreator.getInstance().getUUID();
		String sql = "insert into tb_orderdetail values(?,?,?,?)";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, detailid);
			pst.setString(2, orderdetail.getOrderid());
			pst.setString(3, orderdetail.getComid());
			pst.setInt(4, orderdetail.getComcount());
			row = pst.executeUpdate();
		} catch (SQLException e) {
			throw new Exception("数据库操作异常");
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public int updateOrderDetail(OrderDetail orderdetail) {
		String sql = "update tb_orderdetail set orderid=?,comid=?,comcount=? where detailid=?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, orderdetail.getOrderid());
			pst.setString(2, orderdetail.getComid());
			pst.setInt(3, orderdetail.getComcount());
			pst.setString(4, orderdetail.getDetailid());
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public int deleteOrderDetail(String detailid) {
		String sql = "delete from tb_orderdetail where orderid=?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, detailid);
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public List<OrderDetail> findAllOrderDetail(OrderDetail orderdetail) {
		String sql = "select * from tb_orderdetail where 1=1";
		if (orderdetail.getComid() != null) {
			sql += "and comid='" + orderdetail.getComid() + "'";
		}
		if (orderdetail.getComcount() != null) {
			sql += "and comcount='" + orderdetail.getComcount() + "'";
		}
		if (orderdetail.getDetailid() != null) {
			sql += "and detailid='" + orderdetail.getDetailid() + "'";
		}
		if (orderdetail.getOrderid() != null) {
			sql += "and orderid='" + orderdetail.getOrderid() + "'";
		}
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<OrderDetail> list = new ArrayList<OrderDetail>();
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				OrderDetail od = new OrderDetail();
				od.setDetailid(rs.getString("detailid"));
				od.setOrderid(rs.getString("orderid"));
				od.setComid(rs.getString("comid"));
				od.setComcount(rs.getInt("comcount"));
				list.add(od);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return list;
	}

	public OrderDetail getOrderDetailById(String detailid) {
		String sql = "select * from tb_orderdetail where detailid = ?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		OrderDetail od = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, detailid);
			rs = pst.executeQuery();
			while (rs.next()) {
				od = new OrderDetail();
				od.setComcount(rs.getInt("detailid"));
				od.setComcount(rs.getInt("orderid"));
				od.setComcount(rs.getInt("comid"));
				od.setComcount(rs.getInt("comcount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return od;
	}
}
