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
import java.time.LocalDate;
import java.util.Date;
import java.util.List;


@Controller
public class OrderController {

    @Autowired
    private IOrderService sevice;
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
    public String addOrder(@RequestParam("hID") int hID,
                           @RequestParam("name") String name,
                           @RequestParam("phone") String phone,
                           @RequestParam("address") String address,
                           @RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
                           @RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,
                           HttpServletRequest request) {
        Users u = (Users) request.getSession().getAttribute("loginUser");
        Chair availableWheelchair = chairServiceImpl.findAvailableWheelchairByHID(hID);
        if(availableWheelchair == null) {
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

        sevice.addOrder(order);

        //更新t_chair表中轮椅状态
        availableWheelchair.setStatus(1);
        chairServiceImpl.updateOrderedChair(order);
        wheelchairServiceImpl.decreaseWheelchairType(hID);

        return "OK";
    }

    @RequestMapping("/myOrderInfo")
    @ResponseBody
    public UserOrderData findAllOrder(int page, int limit, HttpServletRequest request) {
        Page p = new Page();
        p.setPage((page - 1) * limit);
        p.setLimit(limit);
        Users u = (Users) request.getSession().getAttribute("loginUser");
        p.setuID(u.getuID());
        UserOrderData uod = new UserOrderData();
        List<UserOrder> order = sevice.findAllOrder(p);
        uod.setCode(0);
        uod.setCount(sevice.getOrderCount(u.getuID()));
        uod.setData(order);
        uod.setMsg("200");
        return uod;
    }

    @RequestMapping("/deleteOrder")
    @ResponseBody
    public String deleteOrder(int oID) {
        int n = sevice.deleteOrder(oID);
        if (n > 0) return "OK";
        return "FAIL";
    }
}
