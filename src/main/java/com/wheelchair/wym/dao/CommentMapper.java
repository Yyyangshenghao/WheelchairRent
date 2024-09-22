package com.wheelchair.wym.dao;

import com.wheelchair.wym.entity.Comment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {
    /**
     * 插入新的评论
     */
    int addNewComment(Comment comment);

    /**
     * 根据轮椅ID查询相关评论
     */
    List<Comment> findCommentsByWheelchairID(int wheelchairID);

    /**
     * 根据用户ID查询相关评论
     */
    List<Comment> findCommentsByUserID(int userID);

    /**
     * 根据订单ID查询相关评论
     */
    List<Comment> findCommentsByOrderID(int orderID);

    /**
     * 删除评论
     */
    int deleteCommentByID(int commentID);
}
