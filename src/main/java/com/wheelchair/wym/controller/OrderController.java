package com.wheelchair.wym.controller;

import com.wheelchair.wym.entity.*;
import com.wheelchair.wym.service.IOrderService;
import com.wheelchair.wym.service.impl.ChairServiceImpl;
import com.wheelchair.wym.service.impl.WheelchairServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;


@Controller
public class OrderController {

    @Autowired
    private IOrderService service;
    @Autowired
    private WheelchairServiceImpl wheelchairServiceImpl;
    @Autowired
    private ChairServiceImpl chairServiceImpl;

    @RequestMapping("/myorder")
    public String toOrderPage() {
        return "myorder";
    }

    @RequestMapping("/updatepwd")
    public String toUpdatepwdPage() {
        return "updatepwd";
    }

    @RequestMapping("/addOrder")
    @ResponseBody
    public String addOrder(@RequestParam("hID") int hID, @RequestParam("name") String name, @RequestParam("phone") String phone, @RequestParam("address") String address, @RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate, @RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate, HttpServletRequest request) {
        Users u = (Users) request.getSession().getAttribute("loginUser");
        Chair availableWheelchair = chairServiceImpl.findAvailableWheelchairByHID(hID);
        if (availableWheelchair == null) {
            return "No_AVAILABLE_CHAIR";
        }
        System.out.println(availableWheelchair.gethID());
        // 创建订单
        Order order = new Order();
        order.setcID(availableWheelchair.getcID());
        order.setuID(u.getuID());
        order.setAddress(address);
        order.setPhone(phone);
        order.setName(name);
        order.setStartDate(startDate);
        order.setEndDate(endDate);
        order.setOrderStatus(1);

        service.addOrder(order);

        // 创建配送订单
        DeliveryOrder deliveryOrder = new DeliveryOrder();
        deliveryOrder.setuID(u.getuID());
        deliveryOrder.setcID(availableWheelchair.getcID());
        deliveryOrder.setOrderStatus(0); //0代表配送订单需要管理员后台确认
        deliveryOrder.setAddress(address);
        deliveryOrder.setName(name);
        deliveryOrder.setPhone(phone);
        deliveryOrder.setType(0); //0代表送出轮椅
        deliveryOrder.setDate(startDate);

        service.addDeliveryOrder(deliveryOrder);

        // 更新t_chair表中轮椅状态
        availableWheelchair.setStatus(1);
        chairServiceImpl.updateOrderedChair(order);
        wheelchairServiceImpl.decreaseWheelchairType(hID); // 该轮椅可用数量 - 1

        return "OK";
    }

    @RequestMapping("/myOrderInfo")
    @ResponseBody
    public UserOrderData findAllOrder(int page, int limit, HttpServletRequest request) {
        Page p = new Page();
        p.setPage((page - 1) * limit);
        p.setLimit(limit);

        Users u = (Users) request.getSession().getAttribute("loginUser");
        if (u == null) {
            UserOrderData errorResponse = new UserOrderData();
            errorResponse.setCode(1); // 1 表示错误
            errorResponse.setMsg("用户没有登录");
            return errorResponse;
        }

        p.setuID(u.getuID());
        UserOrderData uod = new UserOrderData();
        List<UserOrder> order = service.findAllOrder(p);
        uod.setCode(0);
        uod.setCount(service.getOrderCount(u.getuID()));
        uod.setData(order);
        uod.setMsg("200");
        return uod;
    }


    @RequestMapping("/deleteOrder")
    @ResponseBody
    public String deleteOrder(int oID) {
        int n = service.deleteOrder(oID);
        if (n > 0) return "OK";
        return "FAIL";
    }

    @RequestMapping("/applyRepairOrder")
    @ResponseBody
    public String applyRepairOrder(@RequestParam("oID") int oID, @RequestParam("cID") int cID, @RequestParam("type") String type, @RequestParam("pickupDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date pickupDate, @RequestParam("address") String address, @RequestParam("phone") String phone, @RequestParam("orderStatus") int orderStatus, HttpServletRequest request) {
        // 获取登录用户信息
        Users u = (Users) request.getSession().getAttribute("loginUser");
        if (u == null) {
            return "用户没有登录";
        }

        if (orderStatus != 3){
            return "Chair not using";
        }

        // 创建维修保养订单
        RepairOrder repairOrder = new RepairOrder();
        repairOrder.setOID(oID);
        repairOrder.setUID(u.getuID());
        repairOrder.setType(type);
        repairOrder.setPickupDate(pickupDate);
        repairOrder.setAddress(address);
        repairOrder.setPhone(phone);
        repairOrder.setOrderStatus(0);  // 0 表示 pending

        // 调用 service 保存订单
        service.applyRepairOrder(repairOrder);

        // 创建配送订单
        DeliveryOrder deliveryOrder = new DeliveryOrder();
        deliveryOrder.setuID(u.getuID());
        deliveryOrder.setcID(cID);
        deliveryOrder.setOrderStatus(0); //0代表配送订单需要管理员后台确认
        deliveryOrder.setAddress(address);
        deliveryOrder.setName(u.getuName());
        deliveryOrder.setPhone(phone);
        deliveryOrder.setType(1); //1代表收回轮椅
        deliveryOrder.setDate(pickupDate);

        int n = service.addDeliveryOrder(deliveryOrder);
        if (n > 0) return "OK";
        return "FAIL";
    }

    @RequestMapping("/deleteRepairOrder")
    @ResponseBody
    public String deleteRepairOrder(int id) {
        int n = service.deleteRepairOrder(id);
        if (n > 0) return "OK";
        return "FAIL";
    }

}
