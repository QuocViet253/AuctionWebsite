package com.ute.auctionwebapp.controllers;


import com.ute.auctionwebapp.models.WatchListModel;
import com.ute.auctionwebapp.utills.ServletUtills;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "HistoryServlet", value = "/History/*")
public class HistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/"))
        {
            path = "/History";
        }

        switch (path) {
            case "/History":
                ServletUtills.forward("/views/vwHistory/History.jsp", request, response);
                break;
            default:
                ServletUtills.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
    }
}
