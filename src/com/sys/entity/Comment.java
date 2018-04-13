package com.sys.entity;

import java.io.Serializable;

/**
 * 
 * 
 * ClassName: Comment <br/>  
 * Function:评论实体 <br/>  
 * Reason: TODO ADD REASON(可选). <br/>  
 * date: 2018年4月5日 上午10:32:16 <br/>  
 *  
 * @version   
 * @since JDK 1.8
 */
public class Comment implements Serializable{
	/**  
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).  
	 * @since JDK 1.8  
	 */
	private static final long serialVersionUID = 1L;
	private String commentid;
	private String content;
	private String username;
	private String createdate;
	private String userid;
	private String comid;
	private Commodity commodity;

	public Comment() {
		super();  
	}

	
	
	public Comment( String content, String userid, String comid,String userName) {
		super();
		//this.commentid = commentid;
		this.content = content;
		this.userid = userid;
		this.comid = comid;
		this.username = userName;
	}



	public Comment(String commentid, String content, String username, String createdate, String userid, String comid,
			Commodity commodity) {
		super();
		this.commentid = commentid;
		this.content = content;
		this.username = username;
		this.createdate = createdate;
		this.userid = userid;
		this.comid = comid;
		this.commodity = commodity;
	}

	public String getCommentid() {
		return commentid;
	}

	public void setCommentid(String commentid) {
		this.commentid = commentid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getComid() {
		return comid;
	}

	public void setComid(String comid) {
		this.comid = comid;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	@Override
	public String toString() {
		return "Comment [content=" + content + ", commodity=" + commodity + "]";
	}
}
