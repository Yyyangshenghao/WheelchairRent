package com.wheelchair.wym.entity;

import java.util.Date;

public class UserOrder {
    private int oID;
    private int hID;
    private Date orderTime;
    private String orderUser;
    private String wheelchairDesc;
    private String wheelchairModel;
    private String wheelchairArea;
    private String wheelchairFloor;
    private String wheelchairType;
    private int wheelchairPrice;
    private String wheelchairAddress;
    private String wheelchairImage;
    private String communityName;
    private String wheelchairLinkMan;
    private String wheelchairOriented;

    public UserOrder(int hID, Date orderTime, String orderUser, String wheelchairDesc, String wheelchairModel, String wheelchairArea, String wheelchairFloor, String wheelchairType, int wheelchairPrice, String wheelchairAddress, String wheelchairImage, String communityName, String wheelchairLinkMan, String wheelchairOriented) {
        super();
        this.hID = hID;
        this.orderTime = orderTime;
        this.orderUser = orderUser;
        this.wheelchairDesc = wheelchairDesc;
        this.wheelchairModel = wheelchairModel;
        this.wheelchairArea = wheelchairArea;
        this.wheelchairFloor = wheelchairFloor;
        this.wheelchairType = wheelchairType;
        this.wheelchairPrice = wheelchairPrice;
        this.wheelchairAddress = wheelchairAddress;
        this.wheelchairImage = wheelchairImage;
        this.communityName = communityName;
        this.wheelchairLinkMan = wheelchairLinkMan;
        this.wheelchairOriented = wheelchairOriented;
    }

    public UserOrder(int oID, int hID, Date orderTime, String orderUser, String wheelchairDesc, String wheelchairModel, String wheelchairArea, String wheelchairFloor, String wheelchairType, int wheelchairPrice, String wheelchairAddress, String wheelchairImage, String communityName, String wheelchairLinkMan, String wheelchairOriented) {
        super();
        this.oID = oID;
        this.hID = hID;
        this.orderTime = orderTime;
        this.orderUser = orderUser;
        this.wheelchairDesc = wheelchairDesc;
        this.wheelchairModel = wheelchairModel;
        this.wheelchairArea = wheelchairArea;
        this.wheelchairFloor = wheelchairFloor;
        this.wheelchairType = wheelchairType;
        this.wheelchairPrice = wheelchairPrice;
        this.wheelchairAddress = wheelchairAddress;
        this.wheelchairImage = wheelchairImage;
        this.communityName = communityName;
        this.wheelchairLinkMan = wheelchairLinkMan;
        this.wheelchairOriented = wheelchairOriented;
    }

    public UserOrder() {
        super();
    }

    public int getoID() {
        return oID;
    }

    public void setoID(int oID) {
        this.oID = oID;
    }

    public int gethID() {
        return hID;
    }

    public void sethID(int hID) {
        this.hID = hID;
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

    public String getWheelchairDesc() {
        return wheelchairDesc;
    }

    public void setWheelchairDesc(String wheelchairDesc) {
        this.wheelchairDesc = wheelchairDesc;
    }

    public String getWheelchairModel() {
        return wheelchairModel;
    }

    public void setWheelchairModel(String wheelchairModel) {
        this.wheelchairModel = wheelchairModel;
    }

    public String getWheelchairArea() {
        return wheelchairArea;
    }

    public void setWheelchairArea(String wheelchairArea) {
        this.wheelchairArea = wheelchairArea;
    }

    public String getWheelchairFloor() {
        return wheelchairFloor;
    }

    public void setWheelchairFloor(String wheelchairFloor) {
        this.wheelchairFloor = wheelchairFloor;
    }

    public String getWheelchairType() {
        return wheelchairType;
    }

    public void setWheelchairType(String wheelchairType) {
        this.wheelchairType = wheelchairType;
    }

    public int getWheelchairPrice() {
        return wheelchairPrice;
    }

    public void setWheelchairPrice(int wheelchairPrice) {
        this.wheelchairPrice = wheelchairPrice;
    }

    public String getWheelchairAddress() {
        return wheelchairAddress;
    }

    public void setWheelchairAddress(String wheelchairAddress) {
        this.wheelchairAddress = wheelchairAddress;
    }

    public String getWheelchairImage() {
        return wheelchairImage;
    }

    public void setWheelchairImage(String wheelchairImage) {
        this.wheelchairImage = wheelchairImage;
    }

    public String getCommunityName() {
        return communityName;
    }

    public void setCommunityName(String communityName) {
        this.communityName = communityName;
    }

    public String getWheelchairLinkMan() {
        return wheelchairLinkMan;
    }

    public void setWheelchairLinkMan(String wheelchairLinkMan) {
        this.wheelchairLinkMan = wheelchairLinkMan;
    }

    public String getWheelchairOriented() {
        return wheelchairOriented;
    }

    public void setWheelchairOriented(String wheelchairOriented) {
        this.wheelchairOriented = wheelchairOriented;
    }

}
