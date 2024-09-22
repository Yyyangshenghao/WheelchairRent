package com.wheelchair.wym.service.impl;

import com.wheelchair.wym.dao.CommentMapper;
import com.wheelchair.wym.entity.Comment;
import com.wheelchair.wym.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements ICommentService {

    @Autowired
    private CommentMapper commentMapper;

    /**
     * 根据轮椅ID获取相关评论
     */
    @Override
    public List<Comment> findCommentsByWheelchairID(int wheelchairID) {
        return commentMapper.findCommentsByWheelchairID(wheelchairID);
    }

    /**
     * 添加新的评论
     */
    @Override
    public int addNewComment(Comment comment) {
        return commentMapper.addNewComment(comment);
    }

    /**
     * 根据用户ID获取相关评论
     */
    @Override
    public List<Comment> findCommentsByUserID(int userID) {
        return commentMapper.findCommentsByUserID(userID);
    }

    /**
     * 根据订单ID获取相关评论
     */
    @Override
    public List<Comment> findCommentsByOrderID(int orderID) {
        return commentMapper.findCommentsByOrderID(orderID);
    }

    /**
     * 删除评论
     */
    @Override
    public int deleteCommentByID(int commentID) {
        return commentMapper.deleteCommentByID(commentID);
    }
}
