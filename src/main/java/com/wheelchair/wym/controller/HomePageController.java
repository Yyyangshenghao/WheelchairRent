package com.wheelchair.wym.controller;


import com.wheelchair.wym.entity.Wheelchair;
import com.wheelchair.wym.service.IWheelchairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class HomePageController {

    @Autowired
    private IWheelchairService service;


    // 自动重定向 "/" 到 "/toIndexPage"
    @GetMapping("/")
    public String redirectToIndexPage() {
        return "redirect:/toIndexPage";
    }

    @RequestMapping("/toIndexPage")
    public String toIndexPage(HttpServletRequest request) {
        List<Wheelchair> findHomeInfo = service.findHomeInfo();
        request.getSession().setAttribute("Wheelchair", findHomeInfo);
        return "index";
    }

    @RequestMapping("/findWheelchairByLike")
    public String findWheelchairByLike(HttpServletRequest request, String keywords) {
        List<Wheelchair> findHomeInfo = service.findWheelchairByLike(keywords);
        request.getSession().removeAttribute("Wheelchair");
        request.getSession().setAttribute("Wheelchair", findHomeInfo);
        return "index";
    }

    @RequestMapping("/findHousrOrderByAsc")
    public String findHousrOrderByAsc(HttpServletRequest request) {
        List<Wheelchair> findHomeInfo = service.findWheelchairOrderByAsc();
        request.getSession().removeAttribute("Wheelchair");
        request.getSession().setAttribute("Wheelchair", findHomeInfo);
        return "index";
    }

    @RequestMapping("/findHousrOrderByDesc")
    public String findHousrOrderByDesc(HttpServletRequest request) {
        List<Wheelchair> findHomeInfo = service.findWheelchairOrderByDesc();
        request.getSession().removeAttribute("Wheelchair");
        request.getSession().setAttribute("Wheelchair", findHomeInfo);
        return "index";
    }
}
