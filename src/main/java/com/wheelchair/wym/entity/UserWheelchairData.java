package com.wheelchair.wym.entity;

import java.util.List;

public class UserWheelchairData {
    private int code;

    private String msg;

    private int count;

    private List<Wheelchair> data;

    public UserWheelchairData(String msg, int count, List<Wheelchair> data) {
        super();
        this.msg = msg;
        this.count = count;
        this.data = data;
    }

    public UserWheelchairData(int code, String msg, int count, List<Wheelchair> data) {
        super();
        this.code = code;
        this.msg = msg;
        this.count = count;
        this.data = data;
    }

    public UserWheelchairData() {
        super();
    }

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

    public List<Wheelchair> getData() {
        return data;
    }

    public void setData(List<Wheelchair> data) {
        this.data = data;
    }
}
