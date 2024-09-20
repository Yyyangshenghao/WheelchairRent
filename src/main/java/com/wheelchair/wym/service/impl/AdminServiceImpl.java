package com.wheelchair.wym.service.impl;


import com.wheelchair.wym.dao.AdminMapper;
import com.wheelchair.wym.entity.*;
import com.wheelchair.wym.service.IAdminService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class AdminServiceImpl implements IAdminService {

    private final AdminMapper service;

    public AdminServiceImpl(AdminMapper service) {
        this.service = service;
    }

    @Override
    public Admin adminAccess(Admin admin) {
        return service.adminAccess(admin);
    }

    @Override
    public List<Users> findAllUser() {
        return service.findAllUser();
    }

    @Override
    public List<Wheelchair> findAllWheelchair(Page page) {
        return service.findAllWheelchair(page);
    }

    @Override
    public int deleteWheelchair(int hID) {
        return service.deleteWheelchair(hID);
    }

    @Override
    public Users findUserById(int uID) {
        return service.findUserById(uID);
    }

    @Override
    public int updateUser(Users users) {
        return service.updateUser(users);
    }

    @Override
    public int deleteUser(int uID) {
        return service.deleteUser(uID);
    }

    @Override
    public Admin checkAdminPwd(Admin admin) {
        return service.checkAdminPwd(admin);
    }

    @Override
    public int updateAdminPwd(Admin admin) {
        return service.updateAdminPwd(admin);
    }

    @Override
    public List<UserOrder> findAllOrder(Page page) {
        return service.findAllOrder(page);
    }

    @Override
    public List<RepairOrder> findAllRepairOrder(Page page) {
        return service.findAllRepairOrder(page);
    }

    @Override
    public List<DeliveryOrder> findAllDeliveryOrder(Page page) {
        return service.findAllDeliveryOrder(page);
    }

    @Override
    public int confirmRepairOrder(int id) {
        return service.confirmRepairOrder(id);
    }

    @Override
    public Map<String, Integer> countGender() {
        return service.countGender();
    }
}
