package com.wheelchair.wym.entity;

import java.util.Date;

public class Comment {
    private Integer commentID;  // 评论ID
    private Integer userID;     // 用户ID
    private Integer orderID;    // 订单ID
    private Integer wheelchairID;  // 轮椅ID
    private Integer rating;     // 评分
    private String commentContent; // 评论内容
    private Date commentDate;   // 评论时间
    private String username;    // 用户名
    private String commentDateFormatted; // 格式化后的日期字符串

    // 默认构造方法
    public Comment() {
    }

    // 带参数的构造方法
    public Comment(Integer commentID, Integer userID, Integer orderID,
                   Integer wheelchairID, Integer rating, String commentContent,
                   Date commentDate, String username) {
        this.commentID = commentID;
        this.userID = userID;
        this.orderID = orderID;
        this.wheelchairID = wheelchairID;
        this.rating = rating;
        this.commentContent = commentContent;
        this.commentDate = commentDate;
        this.username = username;
    }

    // Getter 和 Setter 方法
    public Integer getCommentID() {
        return commentID;
    }

    public void setCommentID(Integer commentID) {
        this.commentID = commentID;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public Integer getOrderID() {
        return orderID;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public Integer getWheelchairID() {
        return wheelchairID;
    }

    public void setWheelchairID(Integer wheelchairID) {
        this.wheelchairID = wheelchairID;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCommentDateFormatted() {
        return commentDateFormatted;
    }

    public void setCommentDateFormatted(String commentDateFormatted) {
        this.commentDateFormatted = commentDateFormatted;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "commentID=" + commentID +
                ", userID=" + userID +
                ", orderID=" + orderID +
                ", wheelchairID=" + wheelchairID +
                ", rating=" + rating +
                ", commentContent='" + commentContent + '\'' +
                ", commentDate=" + commentDate +
                ", username='" + username + '\'' +
                ", commentDateFormatted='" + commentDateFormatted + '\'' +
                '}';
    }
}
