package com.wheelchair.wym.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Users {

    private int uID;
    private String uName;
    private String uPassword;
    private String uPhoneNumber;
    private String uNickName;
    private String uGender;      // 性别 (M: 男, F: 女)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date uBirthdate;     // 生日
    private int uAge;            // 年龄

    public Users(int uID, String uName, String uPassword, String uPhoneNumber, String uNickName, String uGender, Date uBirthdate, int uAge) {
        super();
        this.uID = uID;
        this.uName = uName;
        this.uPassword = uPassword;
        this.uPhoneNumber = uPhoneNumber;
        this.uNickName = uNickName;
        this.uGender = uGender;
        this.uBirthdate = uBirthdate;
        this.uAge = uAge;
    }

    public Users() {
        super();
    }

    public Users(String uName, String uPassword, String uPhoneNumber, String uNickName, String uGender, Date uBirthdate, int uAge) {
        super();
        this.uName = uName;
        this.uPassword = uPassword;
        this.uPhoneNumber = uPhoneNumber;
        this.uNickName = uNickName;
        this.uGender = uGender;
        this.uBirthdate = uBirthdate;
        this.uAge = uAge;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    public String getuPhoneNumber() {
        return uPhoneNumber;
    }

    public void setuPhoneNumber(String uPhoneNumber) {
        this.uPhoneNumber = uPhoneNumber;
    }

    public String getuNickName() {
        return uNickName;
    }

    public void setuNickName(String uNickName) {
        this.uNickName = uNickName;
    }

    public String getuGender() {
        return uGender;
    }

    public void setuGender(String uGender) {
        this.uGender = uGender;
    }

    public Date getuBirthdate() {
        return uBirthdate;
    }

    public void setuBirthdate(Date uBirthdate) {
        this.uBirthdate = uBirthdate;
    }

    public int getuAge() {
        return uAge;
    }

    public void setuAge(int uAge) {
        this.uAge = uAge;
    }
}
