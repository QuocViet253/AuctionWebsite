package com.ute.auctionwebapp.controllers;

import com.ute.auctionwebapp.beans.Feedback;
import com.ute.auctionwebapp.models.FeedbackModel;

import com.ute.auctionwebapp.utills.ServletUtills;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "FeedbackServlet", value = "/Feedback/*")
public class FeedbackServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            default:
                ServletUtills.forward("/views/404.jsp", request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        request.setCharacterEncoding("UTF-8");
        switch (path) {
            case "/AddSoldFeedback":
                int uid = Integer.parseInt(request.getParameter("uid"),10);
                String uname = request.getParameter("uname");
                int review_id = Integer.parseInt(request.getParameter("review_id"),10);
                String review_name = request.getParameter("review_name");
                int proid = Integer.parseInt(request.getParameter("soldproid"),10);
                String proname = request.getParameter("soldproname");
                String soldcomment = request.getParameter("soldcomment");
                int soldlike = Integer.parseInt(request.getParameter("soldlike"),10);
                int solddislike = 0;
                    if(soldlike == 0) solddislike = 1;
                Feedback fb= new Feedback(uid,review_id,proid,soldlike,solddislike,uname,review_name,soldcomment,proname);
                FeedbackModel.add(fb);
                ServletUtills.redirect("/Account/YourProduct?uid="+review_id,request,response);
                break;
            default:
                ServletUtills.forward("/views/404.jsp", request, response);

        }

    }
}