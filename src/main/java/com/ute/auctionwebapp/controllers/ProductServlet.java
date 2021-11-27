package com.ute.auctionwebapp.controllers;

import com.ute.auctionwebapp.beans.Product;
import com.ute.auctionwebapp.beans.WatchList;
import com.ute.auctionwebapp.models.ProductModel;
import com.ute.auctionwebapp.models.WatchListModel;
import com.ute.auctionwebapp.utills.ServletUtills;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/Product/*")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/AddWatchList":
                int proid = Integer.parseInt(request.getParameter("proid"),10);
                String proname = request.getParameter("proname");
                int price_start=Integer.parseInt(request.getParameter("price_start"));
                int uid =Integer.parseInt(request.getParameter("uid"),10);
                boolean check = WatchListModel.findByProduct(proid,uid);
                if(check == true)
                 {
                     boolean add= WatchListModel.addWatchList(proid,proname,price_start,uid);
                     if( add==true){
                         PrintWriter out = response.getWriter();
                         response.setContentType("application/json");
                         response.setCharacterEncoding("utf-8");
                         out.print(add);
                         out.flush();
                     }
                 }
//                List<WatchList> list4 = WatchListModel.findAll();
//                request.setAttribute("watchlists",list4);
//                ServletUtills.forward("/views/vwWatchList/WatchList.jsp", request, response);
                break;
            case "/List":
                int catId = Integer.parseInt(request.getParameter("id"));
                List<Product> list = ProductModel.findByCatId(catId);
                request.setAttribute("products",list);
                ServletUtills.forward("/views/vwProduct/ListProduct.jsp", request, response);
                break;
            case "/ListPid":
                String catname = (request.getParameter("name"));
                List<Product> list3 = ProductModel.findByCatPid(catname);
                request.setAttribute("products",list3);
                ServletUtills.forward("/views/vwProduct/ListProductPid.jsp", request, response);
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
            case "/WatchList":
                ServletUtills.forward("/views/vwWatchList/WatchList.jsp", request, response);
                break;
            default:
                ServletUtills.forward("/views/404.jsp", request, response);
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
