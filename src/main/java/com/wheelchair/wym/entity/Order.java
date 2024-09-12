package com.wheelchair.wym.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Order {
    private int oID;
    private int cID;
    private int uID;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date orderTime;
    private String orderUser;

    public Order(int cID, int uID, Date orderTime, String orderUser) {
        super();
        this.cID = cID;
        this.uID = uID;
        this.orderTime = orderTime;
        this.orderUser = orderUser;
    }

    public Order(int oID, int cID, int uID, Date orderTime, String orderUser) {
        super();
        this.oID = oID;
        this.cID = cID;
        this.uID = uID;
        this.orderTime = orderTime;
        this.orderUser = orderUser;
    }

    public Order() {
        super();
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public int getoID() {
        return oID;
    }

    public void setoID(int oID) {
        this.oID = oID;
    }

    public int getcID() {
        return cID;
    }

    public void setcID(int cID) {
        this.cID = cID;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public String getOrderUser() {
        return orderUser;
    }

    public void setOrderUser(String orderUser) {
        this.orderUser = orderUser;
    }
}
