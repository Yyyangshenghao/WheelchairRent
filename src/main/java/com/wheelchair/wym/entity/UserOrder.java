package com.wheelchair.wym.entity;

import java.util.Date;

public class UserOrder {
    private int oID;
    private int cID;
    private int uID;
    private String cName;
    private String chairNo;
    private String uName;
    private String uPhone;
    private String uAddress;
    private Date startDate;
    private Date endDate;
    private int orderStatus;


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

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getChairNo() {
        return chairNo;
    }

    public void setChairNo(String chairNo) {
        this.chairNo = chairNo;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPhone() {
        return uPhone;
    }

    public void setuPhone(String uPhone) {
        this.uPhone = uPhone;
    }

    public String getuAddress() {
        return uAddress;
    }

    public void setuAddress(String uAddress) {
        this.uAddress = uAddress;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }
}
