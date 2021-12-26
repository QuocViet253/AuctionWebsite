package com.ute.auctionwebapp.controllers;

import com.ute.auctionwebapp.beans.Feedback;
import com.ute.auctionwebapp.models.FeedbackModel;

import com.ute.auctionwebapp.utills.ServletUtills;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "FeedbackServlet", value = "/Feedback/*")
public class FeedbackServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/GetUserRate":
                int uid = Integer.parseInt(request.getParameter("uid"),10);
                int rate = FeedbackModel.getUserRate(uid);
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out.print(rate);
                out.flush();
                break;
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

            case "/AddWinFeedback":
                int winuid = Integer.parseInt(request.getParameter("winuid"),10);
                String winuname = request.getParameter("winuname");
                int winreview_id = Integer.parseInt(request.getParameter("review_id"),10);
                String winreview_name = request.getParameter("review_name");
                int winproid = Integer.parseInt(request.getParameter("winproid"),10);
                String winproname = request.getParameter("winproname");
                String wincomment = request.getParameter("wincomment");
                int winlike = Integer.parseInt(request.getParameter("winlike"),10);
                int windislike = 0;
                if(winlike == 0) windislike = 1;
                Feedback wfb= new Feedback(winuid,winreview_id,winproid,winlike,windislike,winuname,winreview_name,wincomment,winproname);
                FeedbackModel.add(wfb);
                ServletUtills.redirect("/Account/YourProduct?uid="+winreview_id,request,response);
                break;

            default:
                ServletUtills.forward("/views/404.jsp", request, response);

        }

    }
}
