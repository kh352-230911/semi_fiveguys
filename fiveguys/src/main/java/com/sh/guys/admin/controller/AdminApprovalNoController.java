package com.sh.guys.admin.controller;

import com.sh.guys.admin.model.service.AdminService;
import com.sh.guys.restaurant.model.entity.Approval;
import com.sh.guys.restaurant.model.entity.Restaurant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/adminApprovalNo")
public class AdminApprovalNoController extends HttpServlet {
    private AdminService adminService = new AdminService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자입력값 처리
        String rno = req.getParameter("rno");

        Restaurant restaurant = new Restaurant();
        restaurant.setNo(rno);

        // 2. 업무로직
        int result = adminService.deleteApproval(restaurant);

        req.getSession().setAttribute("confirm", "승인 취소 시 복구가 불가능합니다, 진행하시겠습니까?");

        // 3. redirect
        resp.sendRedirect(req.getContextPath() + "/admin/adminApprovalList");
    }
}