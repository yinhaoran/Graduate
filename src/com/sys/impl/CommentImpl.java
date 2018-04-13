package com.sys.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sys.dao.BaseDao;
import com.sys.dao.CommentDao;
import com.sys.entity.Comment;
import com.sys.entity.Commodity;
import com.sys.tool.PrimaryKeyCreator;

public class CommentImpl extends BaseDao implements CommentDao {

	public int addComment(Comment comment) {
		String commentid = PrimaryKeyCreator.getInstance().getUUID();
		String sql = "insert into tb_comment(commentid,content,username,comid,userid) values(?,?,?,?,?)";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, commentid);
			pst.setString(2, comment.getContent());
			pst.setString(3, comment.getUsername());
			pst.setString(4, comment.getComid());
			pst.setString(5, comment.getUserid());
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public int updateComment(Comment comment) {
		String sql = "update tb_comment set content=?,comid=? where commentid = ?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, comment.getContent());
			pst.setString(3, comment.getComid());
			pst.setString(3, comment.getCommentid());
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public int deleteComment(String commentid) {
		String sql = "delete from tb_comment where commentid = ?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		int row = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, commentid);
			row = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, null);
		}
		return row;
	}

	public List<Comment> findAllComment(Comment comment) {
		String sql = "select * from tb_comment t,tb_commodity c where t.comid=c.comid ";

		if (comment.getCommentid() != null) {
			sql += "and t.commentid='" + comment.getCommentid() + "'";
		}
		if (comment.getContent() != null) {
			sql += "and t.content='" + comment.getContent() + "'";
		}
		if (comment.getUsername() != null) {
			sql += "and t.username='" + comment.getUsername() + "'";
		}
		if (comment.getCreatedate() != null) {
			sql += "and t.createdate='" + comment.getCreatedate() + "'";
		}
		if (comment.getComid() != null) {
			sql += "and c.comid='" + comment.getComid() + "'";
		}
		if (comment.getUserid() != null) {
			sql += "and t.userid='" + comment.getUserid() + "'";
		}
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Comment> list = new ArrayList<Comment>();
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Comment comm = new Comment();
				comm.setContent(rs.getString("content"));
				comm.setCommentid(rs.getString("commentid"));
				comm.setCreatedate(rs.getString("createdate"));
				comm.setComid(rs.getString("comid"));
				comm.setUsername(rs.getString("username"));
				comm.setUserid(rs.getString("userid"));
				// 商品实体
				Commodity commodity = new Commodity();
				commodity.setComid(rs.getString("comid"));
				commodity.setComname(rs.getString("comname"));
				commodity.setDescribe(rs.getString("describe"));
				commodity.setInventory(rs.getInt("inventory"));
				commodity.setPicture(rs.getString("picture"));
				commodity.setPrice(rs.getFloat("price"));
				commodity.setSortid(rs.getString("sortid"));
				comm.setCommodity(commodity);
				list.add(comm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}

		return list;
	}

	public Comment getCommentById(String commentid) {
		String sql = "select * from tb_comment where commentid = ?";
		Connection con = super.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		Comment comm = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, commentid);
			rs = pst.executeQuery();
			while (rs.next()) {
				comm = new Comment();
				comm.setContent(rs.getString("content"));
				comm.setCommentid(rs.getString("commentid"));
				comm.setCreatedate(rs.getString("createdate"));
				comm.setComid(rs.getString("comid"));
				comm.setUsername(rs.getString("username"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeDB(con, pst, rs);
		}
		return comm;
	}

	public List<Comment> findCommentById(String comid) {

		// TODO Auto-generated method stub
		return null;
	}

}
