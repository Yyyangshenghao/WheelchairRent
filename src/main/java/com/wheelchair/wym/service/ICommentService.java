package com.wheelchair.wym.service;

import com.wheelchair.wym.entity.Comment;

import java.util.List;

public interface ICommentService {
    /**
     * 根据轮椅ID获取相关评论
     */
    List<Comment> findCommentsByWheelchairID(int wheelchairID);

    /**
     * 添加新的评论
     */
    int addNewComment(Comment comment);

    /**
     * 根据用户ID获取相关评论
     */
    List<Comment> findCommentsByUserID(int userID);

    /**
     * 根据订单ID获取相关评论
     */
    List<Comment> findCommentsByOrderID(int orderID);

    /**
     * 删除评论
     */
    int deleteCommentByID(int commentID);
}
