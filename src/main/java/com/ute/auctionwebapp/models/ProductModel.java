package com.ute.auctionwebapp.models;

import com.ute.auctionwebapp.beans.Product;
import com.ute.auctionwebapp.utills.DbUtills;
import org.sql2o.Connection;

import java.util.List;

public class ProductModel {
    public static List<Product> findAll(){
        final String query = "select * from products";
        try (Connection con = DbUtills.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }
    public static List<Product> findByCatId(int catId){
        final String query = "select * from products where catid = :catid";
        try (Connection con = DbUtills.getConnection()) {
            return con.createQuery(query)
                    .addParameter("catid",catId)
                    .executeAndFetch(Product.class);
        }
    }
    public static Product findByID(int id){
        final String query = "select * from products where proid=:proid";
        try (Connection con = DbUtills.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .addParameter("proid",id)
                    .executeAndFetch(Product.class);
            if(list.size()==0)
            {
                return null;
            }
            return list.get(0);
        }
    }
}
