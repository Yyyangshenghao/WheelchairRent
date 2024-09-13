package com.wheelchair.wym.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Chair {
    public int cID;
    public int hID;
    public int status;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public Date lastMaintenanceDate;
    public int uID;
    public String chairNo;

    public int getcID() {
        return cID;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public String getChairNo() {
        return chairNo;
    }

    public void setChairNo(String chairNo) {
        this.chairNo = chairNo;
    }

    public void setcID(int cID) {
        this.cID = cID;
    }

    public int gethID() {
        return hID;
    }

    public void sethID(int hID) {
        this.hID = hID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getLastMaintenanceDate() {
        return lastMaintenanceDate;
    }

    public void setLastMaintenanceDate(Date lastMaintenanceDate) {
        this.lastMaintenanceDate = lastMaintenanceDate;
    }
}
