package com.ute.auctionwebapp.models;

import com.ute.auctionwebapp.beans.Category;
import com.ute.auctionwebapp.utills.DbUtills;
import org.sql2o.Connection;

import java.util.List;

public class CategoryModel {
    public static List<Category> findAll(){
        final String query = "select * from categories";
        try (Connection con = DbUtills.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Category.class);
        }
    }
//    public static Category findByPID(int id){
//        final String query = "select * from categories where catid=:catid";
//        try (Connection con = DbUtills.getConnection()) {
//            List<Category> list = con.createQuery(query)
//                    .addParameter("catid",id)
//                    .executeAndFetch(Category.class);
//            if(list.size()==0)
//            {
//                return null;
//            }
//            return list.get(0);
//        }
//    }
    public static List<Category> findBylevel(){
        final String query = "select * from categories where level=0 ";
        try (Connection con = DbUtills.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Category.class);
        }
    }
    public static List<Category> findParent(){
        final String query = "select * from categories where pid=0";
        try (Connection con = DbUtills.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Category.class);
        }
    }
    public static List<Category> findParentID(){
        final String query = "select catid from categories where pid=0";
        try (Connection con = DbUtills.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Category.class);
        }
    }
    public static List<Category> findChild(){
        final String query = "select a.catid, a.catname, a.pid from auction.categories a, auction.categories b where a.pid = b.catid";
        try (Connection con = DbUtills.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Category.class);
        }
    }
}
