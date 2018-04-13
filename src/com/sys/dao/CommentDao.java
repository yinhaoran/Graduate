package com.sys.dao;

import java.util.List;

import com.sys.entity.Comment;

/**
 * 
 * ClassName: CommentDao <br/>  
 * Function: 评论Dao <br/>  
 * Reason: TODO ADD REASON(可选). <br/>  
 * date: 2018年3月28日 下午4:51:15 <br/>  
 *  
 * @version   
 * @since JDK 1.8
 */
public interface CommentDao {
	public int addComment(Comment comment);

	public int updateComment(Comment comment);

	public int deleteComment(String commentid);

	public List<Comment> findAllComment(Comment comment);

	public Comment getCommentById(String commentid);

	public List<Comment> findCommentById(String comid);
}
