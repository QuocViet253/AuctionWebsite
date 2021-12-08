package com.ute.auctionwebapp.filters;

import com.ute.auctionwebapp.beans.User;
import com.ute.auctionwebapp.utills.ServletUtills;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AuthFilter")
public class AuthFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;

        HttpSession session = request.getSession();
        boolean auth = (boolean) session.getAttribute("auth");
        User authUser = (User) session.getAttribute("authUser");
        if (auth == false) {
            session.setAttribute("retUrl", request.getRequestURI());
            ServletUtills.redirect("/Account/Login", request, (HttpServletResponse) res);
            return;
        }

        if (request.getPathInfo() == "/Product/Add") {
            if (authUser.getRole() == 1) {
                ServletUtills.redirect("/Home", request, (HttpServletResponse) res);
                return;
            }
        }

        chain.doFilter(req, res); // cho phép request tiếp tục thực hiện
    }
}
