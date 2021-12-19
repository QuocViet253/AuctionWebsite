package com.ute.auctionwebapp.controllers;

import com.ute.auctionwebapp.beans.Category;
import com.ute.auctionwebapp.beans.Product;
import com.ute.auctionwebapp.beans.User;
import com.ute.auctionwebapp.models.CategoryModel;
import com.ute.auctionwebapp.models.ProductModel;
import com.ute.auctionwebapp.models.UserModel;
import com.ute.auctionwebapp.models.WatchListModel;
import com.ute.auctionwebapp.utills.ServletUtills;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/Admin/*")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Admin";
        }

        switch (path) {
            case "/Admin":
                ServletUtills.forward("/views/vwAdministrator/AdminManager.jsp", request, response);
                break;
            case "/Product":
                List<Product> productList = ProductModel.findAll();
                request.setAttribute("products", productList);
                ServletUtills.forward("/views/vwAdministrator/AdminProduct.jsp", request, response);
                break;
            case "/User":
                List<User> userList = UserModel.findAll();
                request.setAttribute("users", userList);
                ServletUtills.forward("/views/vwAdministrator/AdminUser.jsp", request, response);
                break;

            case "/EditUser":
                int id = Integer.parseInt(request.getParameter("id"));
                User inforuser = UserModel.findById(id);
                request.setAttribute("users", inforuser);
                ServletUtills.forward("/views/vwAdministrator/AdminEditUser.jsp", request, response);
                break;

            case "/Category":
                List<Category> categoryList = CategoryModel.findAll();
                request.setAttribute("categories", categoryList);
                ServletUtills.forward("/views/vwAdministrator/AdminCategory.jsp", request, response);
                break;
            default:
                ServletUtills.forward("/views/404.jsp", request, response);
                break;

            case "/Upgrare":
                int uid = Integer.parseInt(request.getParameter("uid"), 10);
                int reQ = 1;
                /*boolean check = UserModel.findByuid(uid);*/
           /*     if(check == true)
                {*/
                User c = new User(uid,reQ);
                UserModel.upgrare(c);

                /* if(upgrare == true){*/
               /* PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out.print(upgrare);
                out.flush();*/

               /* } else {
                    System.out.println("faile");
                    PrintWriter out = response.getWriter();
                    response.setContentType("application/json");
                    response.setCharacterEncoding("utf-8");
                    out.print(false);
                    out.flush();
                }*/
                break;
        }

}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        request.setCharacterEncoding("UTF-8");
        switch (path) {
            case "/EditUser":
                updateUser(request, response);
                break;
        }
    }

        private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int id = Integer.parseInt(request.getParameter("uid"));
            String strDob = request.getParameter("dob") + " 00:00";
            DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
            LocalDateTime dob = LocalDateTime.parse(strDob, df);
            String name = request.getParameter("name");
            String address = request.getParameter("address");

            User c = new User(name,address,dob,id);
            UserModel.update(c);
            ServletUtills.redirect("/Admin/User",request,response);
        }
    }

