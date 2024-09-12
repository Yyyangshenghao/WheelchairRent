package com.wheelchair.wym.interceptor;

import com.wheelchair.wym.entity.Admin;
import com.wheelchair.wym.entity.Users;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UserInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        response.setCharacterEncoding("utf-8");
        String url = request.getRequestURL().toString();

        if (url.contains("toIndexPage") || url.contains("login") || url.contains("regist") || url.contains("toDetailsPage") || url.contains("findWheelchairByLike") || url.contains("findHousrOrderByAsc") || url.contains("findHousrOrderByDesc") || url.contains("toAdminLogin") || url.contains("adminAccess")) {
            return true;
        }
        HttpSession session = request.getSession();
        Users u = (Users) session.getAttribute("loginUser");
        Admin admin = (Admin) session.getAttribute("Admin");
        if (u != null || admin != null) {
            return true;
        }
        request.getRequestDispatcher("/WEB-INF/pages/demo.jsp").forward(request, response);

        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {

    }
}
