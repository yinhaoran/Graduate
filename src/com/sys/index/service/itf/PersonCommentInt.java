package com.sys.index.service.itf;

import java.util.List;

import com.sys.entity.Comment;
/**
 * 
 * ClassName: PersonCommentInt <br/>  
 * Function: TODO ADD FUNCTION. <br/>  
 * Reason: TODO ADD REASON(可选). <br/>  
 * date: 2018年3月29日 下午4:14:52 <br/>  
 *  
 * @version   
 * @since JDK 1.8
 */
public interface PersonCommentInt {
	public List<Comment> findCommentListByUser(String userid);

	public int SubmitComment(Comment comment);
}
