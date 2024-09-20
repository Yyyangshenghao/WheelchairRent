package com.wheelchair.wym.entity;

import java.util.Date;

public class RepairOrder {
    private int repairOrderID; // 维修/保养订单ID
    private int oID; // 关联的订单ID
    private int uID; // 用户ID
    private String type; // 维修或保养类型
    private Date pickupDate; // 取件日期
    private String address; // 取件地址
    private String name;
    private String phone; // 联系电话
    private Integer orderStatus; // 订单状态（例如“待处理”，“已处理”等）

    // 构造方法
    public RepairOrder() {
    }

    public RepairOrder(int oID, int uID, String type, Date pickupDate, String address, String phone, Integer orderStatus) {
        this.oID = oID;
        this.uID = uID;
        this.type = type;
        this.pickupDate = pickupDate;
        this.address = address;
        this.phone = phone;
        this.orderStatus = orderStatus;
    }

    // Getter 和 Setter 方法
    public int getRepairOrderID() {
        return repairOrderID;
    }

    public void setRepairOrderID(int repairOrderID) {
        this.repairOrderID = repairOrderID;
    }

    public int getOID() {
        return oID;
    }

    public void setOID(int oID) {
        this.oID = oID;
    }

    public int getUID() {
        return uID;
    }

    public void setUID(int uID) {
        this.uID = uID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getPickupDate() {
        return pickupDate;
    }

    public void setPickupDate(Date pickupDate) {
        this.pickupDate = pickupDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    @Override
    public String toString() {
        return "RepairOrder{" + "repairOrderID=" + repairOrderID + ", oID=" + oID + ", uID=" + uID + ", type='" + type + '\'' + ", pickupDate=" + pickupDate + ", address='" + address + '\'' + ", phone='" + phone + '\'' + ", orderStatus='" + orderStatus + '\'' + '}';
    }
}
