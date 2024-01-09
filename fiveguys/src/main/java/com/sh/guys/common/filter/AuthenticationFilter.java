package com.sh.guys.common.filter;

import com.sh.guys.user.model.entity.Role;
import com.sh.guys.user.model.entity.User;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {
        "/user/userUpdate",
        "/user/userDelete",
        "/user/uqdatePassword",
        "/reservation/reservationRegister",
        "/oner/*"
})
public class AuthenticationFilter extends HttpFilter {

    @Override
    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        //인증여부 검사
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser == null){
            session.setAttribute("msg", "로그인후 사용가능합니다");
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        super.doFilter(request, response, chain);
    }
}
