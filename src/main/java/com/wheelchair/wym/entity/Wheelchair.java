package com.wheelchair.wym.entity;

import java.util.Date;

public class Wheelchair {
    private int hID;
    private String wheelchairDesc;
    private String wheelchairModel;
    private String wheelchairArea;
    private String wheelchairFloor;
    private int wheelchairType;
    private int wheelchairPrice;
    private String wheelchairAddress;
    private String wheelchairImage;
    private String communityName;
    private String wheelchairLinkMan;
    private String wheelchairOriented;
    private String wheelchairDetailsImg;
    private String publisher;
    private Date publishTime;

    public Wheelchair(String wheelchairDesc, String wheelchairModel, String wheelchairArea, String wheelchairFloor, int wheelchairType, int wheelchairPrice, String wheelchairAddress, String wheelchairImage, String communityName, String wheelchairLinkMan, String wheelchairOriented, String wheelchairDetailsImg, String publisher, Date publishTime) {
        super();
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
        this.wheelchairDetailsImg = wheelchairDetailsImg;
        this.publisher = publisher;
        this.publishTime = publishTime;
    }

    public Wheelchair(int hID, String wheelchairDesc, String wheelchairModel, String wheelchairArea, String wheelchairFloor, int wheelchairType, int wheelchairPrice, String wheelchairAddress, String wheelchairImage, String communityName, String wheelchairLinkMan, String wheelchairOriented, String wheelchairDetailsImg, String publisher, Date publishTime) {
        super();
        this.hID = hID;
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
        this.wheelchairDetailsImg = wheelchairDetailsImg;
        this.publisher = publisher;
        this.publishTime = publishTime;
    }

    public Wheelchair() {
        super();
    }

    public int gethID() {
        return hID;
    }

    public void sethID(int hID) {
        this.hID = hID;
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

    public int getWheelchairType() {
        return wheelchairType;
    }

    public void setWheelchairType(int wheelchairType) {
        this.wheelchairType = wheelchairType;
    }

    public int getWheelchairPrice() {
        return wheelchairPrice;
    }

    public void setWheelchairPrice(int wheelchairPrice) {
        this.wheelchairPrice = wheelchairPrice;
    }

    public String getwheelchairAddress() {
        return wheelchairAddress;
    }

    public void setwheelchairAddress(String wheelchairAddress) {
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

    public String getWheelchairDetailsImg() {
        return wheelchairDetailsImg;
    }

    public void setWheelchairDetailsImg(String wheelchairDetailsImg) {
        this.wheelchairDetailsImg = wheelchairDetailsImg;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }
}
