package com.sys.index.service;

import java.util.List;

import com.sys.dao.CommentDao;
import com.sys.entity.Comment;
import com.sys.impl.CommentImpl;

public class CommentService {

	public List<Comment> findCommentList() {
		Comment comment = new Comment();
		List<Comment> list = getCommentDao().findAllComment(comment);
		return list;
	}

	public boolean deleteComment(String commentid) {
		int row = getCommentDao().deleteComment(commentid);
		if (row > 0) {
			return true;
		}
		return false;
	}

	public List<Comment> getCommentByComId(String comid) {
		Comment comm = new Comment();
		comm.setComid(comid);
		List<Comment> commlist = getCommentDao().findAllComment(comm);
		return commlist;
	}

	private CommentDao getCommentDao() {
		return new CommentImpl();
	}

}
