package com.wheelchair.wym.entity;

import java.util.List;

public class RepairOrderData {
    private int code;

    private String msg;

    private int count;

    private List<RepairOrder> data;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<RepairOrder> getData() {
        return data;
    }

    public void setData(List<RepairOrder> data) {
        this.data = data;
    }
}
