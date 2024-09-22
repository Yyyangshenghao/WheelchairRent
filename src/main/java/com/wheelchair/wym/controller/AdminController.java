package com.wheelchair.wym.controller;

import com.wheelchair.wym.entity.*;
import com.wheelchair.wym.service.IAdminService;
import com.wheelchair.wym.service.IDeliveryOrderService;
import com.wheelchair.wym.service.IOrderService;
import com.wheelchair.wym.service.IWheelchairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Controller
public class AdminController {

    @Autowired
    private IAdminService service;

    @Autowired
    private IWheelchairService dao;

    @Autowired
    private IOrderService orderService;

    @RequestMapping("/toAdminLogin")
    public String toAdminLogin() {
        return "admin";
    }

    @RequestMapping("/adminAccess")
    @ResponseBody
    public String adminAccess(String username, String userpwd, HttpServletRequest req) {
        Admin admin = new Admin(username, userpwd);
        Admin adminAccess = service.adminAccess(admin);
        req.getSession().setAttribute("Admin", adminAccess);
        if (adminAccess != null) return "OK";
        return "FAIL";
    }

    @RequestMapping("/adminSingnout")
    public String signout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "admin";
    }

    @RequestMapping("/toAdminHomePage")
    public String toAdminHomePage() {
        return "adminhome";
    }

    @RequestMapping("/toAllUserPage")
    public String toAllUserPage() {
        return "alluser";
    }

    @RequestMapping("/AllUsers")
    @ResponseBody
    public UserData findAllUser() {
        List<Users> findAllUser = service.findAllUser();
        UserData u = new UserData();
        u.setCode(0);
        u.setCount(findAllUser.size());
        u.setData(findAllUser);
        u.setMsg("OK");
        return u;
    }

    @RequestMapping("/toAllChairPage")
    public String toAllChairPage() {
        return "allchair";
    }

    @RequestMapping("/toAllWheelchairPage")
    public String toAllWheelchairPage() {
        return "allwheelchair";
    }

    @RequestMapping("/toAllOrderPage")
    public String toAllOrderPage() {
        return "allorder";
    }

    @RequestMapping("/toRepairOrderPage")
    public String toRepairOrderPage() {
        return "repairorder";
    }

    @RequestMapping("/toDeliveryOrderPage")
    public String toDeliveryOrderPage() {
        return "deliveryorder";
    }

    @RequestMapping("/findAllChair")
    @ResponseBody
    public ChairData findAllChair(int page, int limit) {
        Page p = new Page();
        p.setLimit(limit);
        p.setPage((page - 1) * limit);
        List<Chair> findAllChair = service.findAllChair(p);
        ChairData data = new ChairData();
        data.setCode(0);
        data.setCount(findAllChair.size());
        data.setData(findAllChair);
        data.setMsg("OK");
        return data;
    }

    @RequestMapping("/findAllWheelchair")
    @ResponseBody
    public UserWheelchairData findAllWheelchair(int page, int limit) {
        Page p = new Page();
        p.setLimit(limit);
        p.setPage((page - 1) * limit);
        List<Wheelchair> findAllWheelchair = service.findAllWheelchair(p);
        UserWheelchairData data = new UserWheelchairData();
        data.setCode(0);
        data.setCount(findAllWheelchair.size());
        data.setData(findAllWheelchair);
        data.setMsg("OK");
        return data;
    }

    @RequestMapping("/findAllOrder")
    @ResponseBody
    public UserOrderData findAllOrder(int page, int limit) {
        Page p = new Page();
        p.setLimit(limit);
        p.setPage((page - 1) * limit);
        List<UserOrder> findAllOrder = service.findAllOrder(p);
        UserOrderData data = new UserOrderData();
        data.setCode(0);
        data.setCount(findAllOrder.size());
        data.setData(findAllOrder);
        data.setMsg("OK");
        return data;
    }

    @RequestMapping("findAllRepairOrder")
    @ResponseBody
    public RepairOrderData findAllRepairOrder(int page, int limit) {
        Page p = new Page();
        p.setPage((page - 1) * limit);
        p.setLimit(limit);

        RepairOrderData rod = new RepairOrderData();
        List<RepairOrder> repairOrder = service.findAllRepairOrder(p);
        rod.setCode(0);
        rod.setCount(repairOrder.size());
        rod.setData(repairOrder);
        rod.setMsg("OK");
        return rod;
    }

    @RequestMapping("confirmRepairOrder")
    @ResponseBody
    public String confirmRepairOrder(int rID, int oID, int uID, @DateTimeFormat(pattern = "yyyy-MM-dd") Date Date, String address, String name, String phone, int status) {
        int n = service.confirmRepairOrder(rID, status);
        if (n > 0) {
            // 创建配送订单
            DeliveryOrder deliveryOrder = new DeliveryOrder();
            int cID = orderService.findChairByoID(oID);
            deliveryOrder.setuID(uID);
            deliveryOrder.setcID(cID);
            deliveryOrder.setOrderStatus(1); //回收订单不需要后台管理员确认
            deliveryOrder.setAddress(address);
            deliveryOrder.setName(name);
            deliveryOrder.setPhone(phone);
            deliveryOrder.setType(1); //1代表收回轮椅
            deliveryOrder.setDate(Date);

            int m = orderService.addDeliveryOrder(deliveryOrder);
            boolean o = orderService.updateOrderStatus(oID, 5);
            if (m > 0 && o) return "OK";
            return "FAIL";
        }
        return "FAIL";
    }

    @RequestMapping("findAllDeliveryOrder")
    @ResponseBody
    public DeliveryOrderData findAllDeliveryOrder(int page, int limit) {
        Page p = new Page();
        p.setPage((page - 1) * limit);
        p.setLimit(limit);

        DeliveryOrderData dod = new DeliveryOrderData();
        List<DeliveryOrder> DeliveryOrder = service.findAllDeliveryOrder(p);
        dod.setCode(0);
        dod.setCount(DeliveryOrder.size());
        dod.setData(DeliveryOrder);
        dod.setMsg("OK");
        return dod;
    }

    @RequestMapping("/deleteWheelchair")
    @ResponseBody
    public String deleteWheelchair(int hID) {
        int deleteWheelchair = service.deleteWheelchair(hID);
        if (deleteWheelchair > 0) {
            return "OK";
        }
        return "FAIL";
    }

    @RequestMapping("/toAdminUpdateWheelchairPage")
    public String toUpdatePage(int hID, HttpServletRequest request) {
        Wheelchair wheelchair = dao.findWheelchairDetailsById(hID);
        request.getSession().setAttribute("Wheelchair", wheelchair);
        return "updatewheelchair";
    }

    @RequestMapping("/toEditUserPage")
    public String toEditUserPage(int uID, HttpServletRequest req) {
        Users findUserById = service.findUserById(uID);
        req.getSession().setAttribute("User", findUserById);
        return "editUser";
    }

    @RequestMapping("/editUser")
    @ResponseBody
    public String editUser(Users users) {
        int n = service.updateUser(users);
        if (n > 0) return "OK";
        return "FAIL";
    }

    @RequestMapping("/deleteUser")
    @ResponseBody
    public String deleteUser(int uID) {
        int n = service.deleteUser(uID);
        if (n > 0) {
            return "OK";
        }
        return "FAIL";
    }

    @RequestMapping("/toUpdateAdminPwdPage")
    public String toUpdateAdminPwdPage() {
        return "updateAdminPwd";
    }


    @RequestMapping("/welcome01")
    public String toWelcomePage() {
        return "welcome01";
    }

    @RequestMapping("/updateAdminPwd")
    @ResponseBody
    public String updateAdminPwd(HttpServletRequest request, String oldpwd, String newpwd, String newpwdagain) {
        Admin admin = new Admin();
        Admin adminSession = (Admin) request.getSession().getAttribute("Admin");
        admin.setId(adminSession.getId());
        admin.setUserpwd(oldpwd);
        Admin checkAdminPwd = service.checkAdminPwd(admin);
        if (checkAdminPwd == null) {
            return "ERROR";
        }
        if (!newpwd.equals(newpwdagain)) {
            return "FAIL";
        }
        Admin a = new Admin();
        a.setId(adminSession.getId());
        a.setUserpwd(newpwd);
        int n = service.updateAdminPwd(a);
        if (n > 0) return "OK";
        return "FAIL";
    }

    @RequestMapping("/genderCount")
    @ResponseBody
    public String genderCount() {
        Map<String, Integer> genderCountMap = service.countGender();

        // 在控制台和终端输出结果
        System.out.println("Gender Count: " + genderCountMap);

        // 创建响应字符串
        String response = "User Gender Count:\n" + "Male: " + genderCountMap.getOrDefault("M", 0) + "\n" + "Female: " + genderCountMap.getOrDefault("F", 0) + "\n";

        return response;
    }
}
