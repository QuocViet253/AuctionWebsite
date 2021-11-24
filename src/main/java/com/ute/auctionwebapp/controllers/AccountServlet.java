package com.ute.auctionwebapp.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.auctionwebapp.beans.User;
import com.ute.auctionwebapp.models.UserModel;
import com.ute.auctionwebapp.utills.MailUtills;
import com.ute.auctionwebapp.utills.ServletUtills;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

@WebServlet(name = "AccountServlet", value = "/Account/*")
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Register":
                ServletUtills.forward("/views/vwAccount/Register.jsp", request, response);
                break;

            case "/Login":
                ServletUtills.forward("/views/vwAccount/Login.jsp", request, response);
                break;

            case "/ForgotPassword":
                ServletUtills.forward("/views/vwAccount/ForgotPassword.jsp", request, response);
                break;

            case "/Profile":
                ServletUtills.forward("/views/vwAccount/Profile.jsp", request, response);
                break;

            case "/IsAvailable":
                String username = request.getParameter("email");
                User user = UserModel.findByUsername(username);
                boolean isAvailable = (user == null);

                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                out.print(isAvailable);
                out.flush();
                break;

            case "/SendOTP":
                username = request.getParameter("email");
                String otp = request.getParameter("otp");
                boolean sendOTP =  MailUtills.sendOTP(username,otp);
                out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                out.print(sendOTP);
                out.flush();
                break;

            default:
                ServletUtills.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Register":
                registerUser(request, response);
                break;

            case "/Login":
                login(request, response);
                break;

            case "/ForgotPassword":
                forgot(request, response);
                break;

            default:
                ServletUtills.forward("/views/404.jsp", request, response);
                break;
        }
    }
    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rawpwd = request.getParameter("rawpwd");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());

        String strDob = request.getParameter("dob") + " 00:00";
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        LocalDateTime dob = LocalDateTime.parse(strDob, df);

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int role = 1;
        int reQuest = 0;

        User c = new User(name, email, address,  bcryptHashString, dob, role, reQuest);
        UserModel.add(c);
        ServletUtills.forward("/views/vwAccount/Register.jsp", request, response);
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // String name = request.getParameter("CatName");
        // Category c = new Category(name);
        // CategoryModel.add(c);
        // ServletUtils.forward("/views/vwCategory/Add.jsp", request, response);
    }

    private void forgot(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, email.toCharArray());
        UserModel.resetPassword(email,bcryptHashString);

        MailUtills.sendResetPassword(email);
        ServletUtills.forward("/views/vwAccount/ForgotPassword.jsp", request, response);
    }

}
