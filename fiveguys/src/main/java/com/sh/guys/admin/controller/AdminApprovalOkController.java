package com.sh.guys.admin.controller;

import com.sh.guys.admin.model.service.AdminService;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.user.model.entity.Role;
import com.sh.guys.user.model.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebServlet("admin/adminApprovalOk")
public class AdminApprovalOkController extends HttpServlet {

private AdminService adminService = new AdminService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자입력값 처리
        String no = req.getParameter("no");
        String _role = req.getParameter("role");
        Role role = Role.valueOf(_role);
        String _approval = req.getParameter("approval");
//        Approval approval = Approval.valueof(_approval);

        User user = new User();
        user.setId(no);
        user.setRole(role);

        Restaurant restaurant = new Restaurant();
        restaurant.setUsersNo(no);
//        restaurant.setApproval(approval);


        // 2. 업무로직
        int resultRole = adminService.updateRole(user);
        int resultApproval = adminService.updateApproval(restaurant);

        req.getSession().setAttribute("msg", "식당 승인이 완료되었습니다.");

        // 3. redirect
        resp.sendRedirect(req.getContextPath() + "admin/adminApprovalList");
    }
}
