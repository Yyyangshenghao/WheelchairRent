package com.wheelchair.wym.controller;

import com.wheelchair.wym.entity.*;
import com.wheelchair.wym.service.IAdminService;
import com.wheelchair.wym.service.IOrderService;
import com.wheelchair.wym.service.IWheelchairService;
import com.wheelchair.wym.service.impl.ChairServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
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
    @Autowired
    private ChairServiceImpl chairServiceImpl;

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

        int totalUserCount = service.getUserCount();
        UserData u = new UserData();
        u.setCode(0);
        u.setCount(totalUserCount);
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
    public ChairData findAllChair(int page, int limit, String chairNo, Integer status) {
        Page p = new Page();
        p.setLimit(limit);
        p.setPage((page - 1) * limit);
        List<Chair> findAllChair = service.findAllChairByCondition(p, chairNo, status);
        // 获取所有轮椅的总数量，用于分页
        int totalChairCount = service.getChairCountByCondition(chairNo, status);
        ChairData data = new ChairData();
        data.setCode(0);
        data.setCount(totalChairCount);
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
        int totalWheelchairCount = service.getWheelchairCount();
        UserWheelchairData data = new UserWheelchairData();
        data.setCode(0);
        data.setCount(totalWheelchairCount);
        data.setData(findAllWheelchair);
        data.setMsg("OK");
        return data;
    }

    @RequestMapping("/findAllOrder")
    @ResponseBody
    public UserOrderData findAllOrder(int page, int limit, String uPhone, String chairNo, Integer orderStatus) {
        Page p = new Page();
        p.setLimit(limit);
        p.setPage((page - 1) * limit);
        List<UserOrder> findAllOrder = service.findOrderByCondition(uPhone, chairNo, orderStatus, p);
        int totalOrderCount = service.getOrderCountByCondition(uPhone, chairNo, orderStatus);
        UserOrderData data = new UserOrderData();
        data.setCode(0);
        data.setCount(totalOrderCount);
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
        List<RepairOrder> repairOrder = service.findAllRepairOrder(p);
        int totalRepairOrderCount = service.getRepairOrderCount();
        RepairOrderData rod = new RepairOrderData();
        rod.setCode(0);
        rod.setCount(totalRepairOrderCount);
        rod.setData(repairOrder);
        rod.setMsg("OK");
        return rod;
    }

    @RequestMapping("confirmRepairOrder")
    @ResponseBody
    public String confirmRepairOrder(int rID, int oID, int uID, @DateTimeFormat(pattern = "yyyy-MM-dd") Date Date, String address, String name, String phone, int status) {
        int n = service.confirmRepairOrder(rID, status);
        if (n > 0) {
            return "OK";
        }
        return "FAIL";
    }

    @RequestMapping("findAllDeliveryOrder")
    @ResponseBody
    public DeliveryOrderData findAllDeliveryOrder(int page, int limit, String phone, Integer type, Integer orderStatus, String timeSort) {
        Page p = new Page();
        p.setPage((page - 1) * limit);
        p.setLimit(limit);
        List<DeliveryOrder> DeliveryOrder = service.findAllDeliveryOrder(p, phone, type, orderStatus, timeSort);
        int totalDeliveryOrderCount = service.getDeliveryOrderCount(phone, type, orderStatus);
        DeliveryOrderData dod = new DeliveryOrderData();
        dod.setCode(0);
        dod.setCount(totalDeliveryOrderCount);
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
        // 假设返回的是 Map<String, Map<String, Object>>，每个性别对应一个包含具体信息的 Map
        Map<String, Map<String, Object>> genderCountMap = service.countGender();

        // 输出整个 Map 数据，帮助调试
        System.out.println("Gender Count Map: " + genderCountMap);

        // 遍历 Map，输出每一条键值对，检查具体的内容
        for (Map.Entry<String, Map<String, Object>> entry : genderCountMap.entrySet()) {
            System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
        }

        // 提取男性和女性的 count 值
        Long maleCount = (Long) genderCountMap.getOrDefault("M", new HashMap<>()).get("count");
        Long femaleCount = (Long) genderCountMap.getOrDefault("F", new HashMap<>()).get("count");

        // 输出调试信息
        System.out.println("Male Count: " + maleCount);
        System.out.println("Female Count: " + femaleCount);

        // 返回性别统计信息
        String response = "User Gender Count:\n" + "Male: " + maleCount + "\n" + "Female: " + femaleCount + "\n";
        return response;
    }

    @RequestMapping("/genderPie")
    public String genderPie() {
        return "genderPie";
    }

    @RequestMapping("/ageGroupCount")
    @ResponseBody
    public String ageGroupCount() {
        // 获取年龄段统计信息
        Map<String, Map<String, Object>> ageGroupCountMap = service.countAgeGroups();

        // 输出整个 Map 数据，帮助调试
        System.out.println("Age Group Count Map: " + ageGroupCountMap);

        // 构建响应字符串
        // StringBuilder response = new StringBuilder("User Age Group Count:\n");
        StringBuilder response = new StringBuilder("\n");
        for (Map.Entry<String, Map<String, Object>> entry : ageGroupCountMap.entrySet()) {
            String ageGroup = entry.getKey();
            Long count = (Long) entry.getValue().get("count");
            response.append(ageGroup).append(": ").append(count).append("\n");
        }

        return response.toString();
    }

    @RequestMapping("/ageGroupBar")
    public String ageGroupBar() {
        return "ageGroupBar";
    }

    @RequestMapping("repairSuccess")
    @ResponseBody
    public String repairSuccess(int oID, int rID, @DateTimeFormat(pattern = "yyyy-MM-dd") Date date) {
        int cID = orderService.findChairByoID(oID);
        orderService.updateOrderStatus(oID, 3);// 维修成功
        orderService.updateRepairOrderStatus(rID, 8);
        chairServiceImpl.updateRepairedChair(cID, date);
        return "OK";
    }

    @RequestMapping("repairFailure")
    @ResponseBody
    public String repairFailure(int oID, int rID){
        int cID = orderService.findChairByoID(oID);
        orderService.updateOrderStatus(oID, 0);// 维修失败订单结束
        orderService.updateRepairOrderStatus(rID, 9);
        chairServiceImpl.updateScrappedChair(cID);
        return "OK";
    }
}
