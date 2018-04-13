package com.sys.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * 
 * ClassName: BaseDao <br/>  
 * Function: 数据库连接池 <br/>  
 * Reason: TODO ADD REASON(可选). <br/>  
 * date: 2018年3月28日 下午4:51:27 <br/>  
 *  
 * @version   
 * @since JDK 1.8
 */
public class BaseDao {
	// 连接数据库
	public Connection getConnection() {
		Connection con = null;
		try {
			Context context = new InitialContext();
			Context envContext  = (Context) context.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/gradute"); 
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	// 关闭连接
	public void closeDB(Connection con, Statement stm, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
			if (stm != null)
				stm.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
