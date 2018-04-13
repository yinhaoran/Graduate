package com.sys.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sys.dao.BaseDao;
import com.sys.dao.OrderDao;
import com.sys.entity.Order;
import com.sys.entity.OrderMange;
import com.sys.tool.PrimaryKeyCreator;

public class OrderImpl extends BaseDao implements OrderDao {

	public String addOrder(Order order) {
		// 订单状态默认为1
		String orderid = PrimaryKeyCreator.getInstance().getUUID();
		String sql = "insert into tb_order(orderid,userid,orderstatus,userwords,addressid,total) values(?,?,1,?,?,?)";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, orderid);
			pst.setString(2, order.getUserid());
			pst.setString(3, order.getUserwords());
			pst.setString(4, order.getAddressid());
			pst.setFloat(5, order.getTotal() == null ? 0 : order.getTotal());
			int row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return orderid;
	}

	public int updateOrder(Order order) {
		String sql = "update tb_order set orderstatus=?,userid=?,userwords=?,addressid =?,total=? where orderid=?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, order.getOrderstatus());
			pst.setString(2, order.getUserid());
			pst.setString(3, order.getUserwords());
			pst.setString(4, order.getAddressid());
			pst.setFloat(5, order.getTotal());
			pst.setString(6, order.getOrderid());
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public int deleteOrder(String orderid) {
		String sql = "delete from tb_order where orderid = ?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, orderid);
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public List<Order> findAllOrder(Order order) {
		String sql = "select * from tb_order where 1=1 ";
		if (order.getUserid() != null) {
			sql += " and userid='" + order.getUserid() + "'";
		}
		if (order.getOrderid() != null) {
			sql += " and orderid='" + order.getOrderid() + "'";
		}
		if (order.getOrderstatus() != null) {
			sql += " and orderstatus='" + order.getOrderstatus() + "'";
		}
		if (order.getUserwords() != null) {
			sql += " and userwords='" + order.getUserwords() + "'";
		}
		if (order.getTranstime() != null) {
			sql += " and transtime='" + order.getTranstime() + "'";
		}
		if (order.getAddressid() != null) {
			sql += " and addressid='" + order.getAddressid() + "'";
		}
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Order> list = new ArrayList<Order>();
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Order o = new Order();
				o.setOrderid(rs.getString("orderid"));
				o.setOrderstatus(rs.getString("orderstatus"));
				o.setUserid(rs.getString("userid"));
				o.setTranstime(rs.getString("transtime"));
				o.setUserwords(rs.getString("userwords"));
				o.setAddressid(rs.getString("addressid"));
				o.setTotal(rs.getFloat("total"));
				list.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return list;
	}

	public Order getOrderById(String orderid) {
		String sql = "select * from tb_order where orderid = ?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		Order order = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, orderid);
			rs = pst.executeQuery();
			while (rs.next()) {
				order = new Order();
				order.setOrderid(rs.getString("orderid"));
				order.setOrderstatus(rs.getString("orderstatus"));
				order.setUserid(rs.getString("userid"));
				order.setTranstime(rs.getString("transtime"));
				order.setUserwords(rs.getString("userwords"));
				order.setAddressid(rs.getString("addressid"));
				order.setTotal(rs.getFloat("total"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return order;
	}

	public List<Order> findAllOrder() {
		String sql = "select * from tb_order ";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Order> list = new ArrayList<Order>();
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Order o = new Order();
				o.setOrderid(rs.getString("orderid"));
				o.setOrderstatus(rs.getString("orderstatus"));
				o.setUserid(rs.getString("userid"));
				o.setTranstime(rs.getString("transtime"));
				o.setUserwords(rs.getString("userwords"));
				o.setAddressid(rs.getString("addressid"));
				o.setTotal(rs.getFloat("total"));
				list.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return list;
	}

	public List<OrderMange> getDetailByUserID(String userid) {
		String sql = "select c.picture,o.orderid,o.transtime,o.userid,o.orderstatus,od.detailid,od.comid,od.comcount,c.comname,c.price"
				+ " from tb_order o" 
				+ " left join tb_orderdetail od on o.orderid = od.orderid"
				+ " left join tb_commodity c on od.comid=c.comid" + " where userid = ?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		OrderMange om = null;
		List<OrderMange> list = new ArrayList<OrderMange>();
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, userid);
			rs = pst.executeQuery();
			while (rs.next()) {
				om = new OrderMange();
				String pic = rs.getString("picture");
				om.setPicture(pic);
				om.setOrderid(rs.getString("orderid"));
				om.setOrderstatus(rs.getString("orderstatus"));
				om.setUserid(rs.getString("userid"));
				om.setTranstime(rs.getString("transtime"));
				om.setComcount(rs.getInt("comcount"));
				om.setComid(rs.getString("comid"));
				om.setComname(rs.getString("comname"));
				om.setPrice(rs.getFloat("price"));
				list.add(om);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return list;
	}
}
