package com.wheelchair.wym.controller;

import com.wheelchair.wym.entity.Page;
import com.wheelchair.wym.entity.UserWheelchairData;
import com.wheelchair.wym.entity.Users;
import com.wheelchair.wym.entity.Wheelchair;
import com.wheelchair.wym.service.IWheelchairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class WheelchairController {

    @Autowired
    private IWheelchairService service;

    @RequestMapping("/findUserWheelchair")
    @ResponseBody
    public UserWheelchairData wheelchairByUser(HttpServletRequest request, int page, int limit) {
        Page p = new Page();
        Users u = (Users) request.getSession().getAttribute("loginUser");
        String publisher = u.getuNickName();
        p.setPublisher(publisher);
        p.setLimit(limit);
        p.setPage((page - 1) * limit);
        List<Wheelchair> list = service.findWheelchairByUser(p);
        System.out.println(list);
        return new UserWheelchairData(0, "200", list.size(), list);
    }

    @RequestMapping("/deleteUserWheelchair")
    @ResponseBody
    public String deleteUserWheelchair(String hID) {
        int n = service.deleteUserWheelchair(Integer.parseInt(hID));
        if (n > 0) {
            return "OK";
        }
        return "FAIL";
    }

    @RequestMapping("/updateWheelchair")
    @ResponseBody
    public String updateWheelchair(Wheelchair wheelchair) {
        int n = service.updateWheelchair(wheelchair);
        if (n > 0) return "OK";
        return "FAIL";
    }
}
