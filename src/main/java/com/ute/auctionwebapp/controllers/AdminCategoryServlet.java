package com.ute.auctionwebapp.controllers;

import com.ute.auctionwebapp.beans.Category;
import com.ute.auctionwebapp.beans.Product;
import com.ute.auctionwebapp.beans.User;
import com.ute.auctionwebapp.models.CategoryModel;
import com.ute.auctionwebapp.models.ProductModel;
import com.ute.auctionwebapp.models.UserModel;
import com.ute.auctionwebapp.utills.ServletUtills;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
@WebServlet(name = "AdminCategoryServlet", value = "/AdminCategory/*")
public class AdminCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/AdminCategory";
            switch (path) {
                case "/Add":
                    ServletUtills.forward("/views/vwAdministrator/AddCategory.jsp", request, response);
                    break;
                default:
                    ServletUtills.forward("/views/404.jsp", request, response);
                    break;
            }
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
