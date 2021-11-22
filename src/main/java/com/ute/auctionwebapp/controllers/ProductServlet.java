package com.ute.auctionwebapp.controllers;

import com.ute.auctionwebapp.beans.Product;
import com.ute.auctionwebapp.model.ProductModel;
import com.ute.auctionwebapp.utills.ServletUtills;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/Product/*")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/List":
                int catId = Integer.parseInt(request.getParameter("id"));
                List<Product> list = ProductModel.findByCatId(catId);
                request.setAttribute("products",list);
                ServletUtills.forward("/views/vwProduct/ListProduct.jsp", request, response);
                break;

            case "/Detail":
                int proId = Integer.parseInt(request.getParameter("id"));
                Product product = ProductModel.findByID(proId);
                if(product==null)
                {
                    ServletUtills.redirect("/Home",request,response);
                }
                else {
                    request.setAttribute("product",product);
                    ServletUtills.forward("/views/vwProduct/Detail.jsp", request, response);
                    break;
                }
            default:
                ServletUtills.forward("/views/404.jsp", request, response);
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
