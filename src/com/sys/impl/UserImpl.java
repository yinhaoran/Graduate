package com.sys.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sys.dao.BaseDao;
import com.sys.dao.UserDao;
import com.sys.entity.User;
import com.sys.tool.PrimaryKeyCreator;

public class UserImpl extends BaseDao implements UserDao {

	public int addUser(User user) {
		String userid = PrimaryKeyCreator.getInstance().getUUID();
		String sql = "insert into tb_userinfo values(?,?,?,?,?,?,?,?,?,?)";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, userid);
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getSign());
			pst.setString(4, user.getEmail());
			pst.setString(5, user.getRealname());
			pst.setString(6, user.getNickname());
			pst.setString(7, user.getIdnumber());
			pst.setString(8, user.getSex());
			pst.setString(9, user.getTelephone());
			pst.setString(10, user.getBirthday());
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public int updateUser(User user) {
		String sql = "update tb_userinfo set password=?,email=?,realname=?,"
				+ "nickname=?,idnumber=?,sex=?,telephone = ?,birthday = STR_TO_DATE(?,'%Y-%m-%d %H:%i:%s'),"
				+ "sign=? where userid=?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getPassword());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getRealname());
			pst.setString(4, user.getNickname());
			pst.setString(5, user.getIdnumber());
			pst.setString(6, user.getSex());
			pst.setString(7, user.getTelephone());
			pst.setString(8, user.getBirthday());
			pst.setString(9, user.getSign());
			pst.setString(10, user.getUserid());
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public int deleteUser(String userid) {
		String sql = "delete from tb_userinfo where userid = ?";
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

	public List<User> findAllUser(User user) {
		String sql = "select * from tb_userinfo where 1=1 ";
		if (user.getUserid() != null) {
			sql += "and userid='" + user.getUserid() + "'";
		}
		if (user.getPassword() != null) {
			sql += "and password='" + user.getPassword() + "'";
		}
		if (user.getEmail() != null) {
			sql += "and email='" + user.getEmail() + "'";
		}
		if (user.getRealname() != null) {
			sql += "and realname='" + user.getRealname() + "'";
		}
		if (user.getNickname() != null) {
			sql += "and nickname='" + user.getNickname() + "'";
		}
		if (user.getIdnumber() != null) {
			sql += "and idnumber='" + user.getIdnumber() + "'";
		}
		if (user.getSex() != null) {
			sql += "and sex='" + user.getSex() + "'";
		}
		if (user.getTelephone() != null) {
			sql += "and telephone='" + user.getTelephone() + "'";
		}
		if (user.getBirthday() != null) {
			sql += "and birthday='" + user.getBirthday() + "'";
		}
		if (user.getSign() != null) {
			sql += "and sign='" + user.getSign() + "'";
		}
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<User> list = new ArrayList<User>();
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				User users = new User();
				users.setUserid(rs.getString("userid"));
				users.setPassword(rs.getString("password"));
				users.setEmail(rs.getString("email"));
				users.setRealname(rs.getString("realname"));
				users.setNickname(rs.getString("nickname"));
				users.setIdnumber(rs.getString("idnumber"));
				users.setSex(rs.getString("sex"));
				users.setTelephone(rs.getString("telephone"));
				users.setBirthday(rs.getString("birthday"));
				users.setSign(rs.getString("sign"));
				list.add(users);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return list;
	}

	public User getUserById(String userid) {
		String sql = "select * from tb_userinfo where userid=?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		User users = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, userid);
			rs = pst.executeQuery();
			while (rs.next()) {
				users = new User();
				users.setUserid(rs.getString("userid"));
				users.setPassword(rs.getString("password"));
				users.setEmail(rs.getString("email"));
				users.setRealname(rs.getString("realname"));
				users.setNickname(rs.getString("nickname"));
				users.setIdnumber(rs.getString("idnumber"));
				users.setSex(rs.getString("sex"));
				users.setTelephone(rs.getString("telephone"));
				users.setBirthday(rs.getString("birthday"));
				users.setSign(rs.getString("sign"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return users;
	}
}
