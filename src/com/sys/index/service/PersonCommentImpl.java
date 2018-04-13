package com.sys.index.service;

import java.util.List;

import com.sys.dao.CommentDao;
import com.sys.entity.Comment;
import com.sys.impl.CommentImpl;
import com.sys.index.service.itf.PersonCommentInt;

public class PersonCommentImpl implements PersonCommentInt {

	public List<Comment> findCommentListByUser(String userid) {
		Comment comment = new Comment();
		comment.setUserid(userid);
		CommentDao commentdao = new CommentImpl();
		List<Comment> list = commentdao.findAllComment(comment);
		return list;
	}

	public int SubmitComment(Comment comment) {
		CommentDao commentdao = new CommentImpl();
		int row = commentdao.addComment(comment);
		return row;
	}

}
