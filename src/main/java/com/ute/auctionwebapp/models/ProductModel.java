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
    public static List<Product> findTop8End(){
        final String query = "SELECT * from products where TIMESTAMPDIFF(SECOND,NOW(),products.end_day)>0 order by products.end_day asc limit 8";
        try (Connection con = DbUtills.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }
    public static List<Product> findTop8Price(){
        final String query = "SELECT * from products where TIMESTAMPDIFF(SECOND,NOW(),products.end_day)>0 order by products.price_current desc limit 8";
        try (Connection con = DbUtills.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }
    public static List<Product> findByCatId(int catId){
        final String query = "select * from products where catid = :catid and CURDATE()<end_day and CURTIME()<end_day";
        try (Connection con = DbUtills.getConnection()) {
            return con.createQuery(query)
                    .addParameter("catid",catId)
                    .executeAndFetch(Product.class);
        }
    }
    public static List<Product> findByCatPid(String catname){
        final String query = "select products.proid,products.proname,products.price_current,products.catid,products.price_now,products.start_day,products.end_day\n" +
                "                from auction.products , auction.categories\n" +
                "                where auction.categories.pid=(select catid from auction.categories where catname=:catname)\n" +
                "             and categories.catid=products.catid and CURDATE() < products.end_day and CURTIME()<products.end_day";
        try (Connection con = DbUtills.getConnection()) {
            return con.createQuery(query)
                    .addParameter("catname",catname)
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
    public static List<Product> findNear(int catid, int proid){
        final String query = "select * from products where catid in (select catid from categories where pid = (\n" +
                "    select pid from categories where categories.catid = :catid\n" +
                ")) and proid not in (select proid from products where proid = :proid) order by field(catid,:catid) desc limit 8";
        try (Connection con = DbUtills.getConnection()) {
            return con.createQuery(query)
                    .addParameter("catid",catid)
                    .addParameter("proid",proid)
                    .executeAndFetch(Product.class);
        }
    }

    public static int price_max(int proid){
        final String query = "select price_max from auction.products where proid=:proid";
        try (Connection con = DbUtills.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .addParameter("proid",proid)
                    .executeAndFetch(Product.class);
            return list.get(0).getPrice_max();
        }
    }
    public static boolean updatePriceCur(int proid, int price_current){
        String Sql = "update auction.products set price_current=:price_current where proid=:proid";
        try (Connection con = DbUtills.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("proid",proid )
                    .addParameter("price_current", price_current)
                    .executeUpdate();
            return true;
        }
        catch (Exception e){return false;}
    }
    public static boolean updatePriceMax(int proid, int price_current,int price_max,int uid){
        String Sql = "update auction.products set price_current=:price_current, price_max=:price_max," +
                "bid_id=:bid_id where proid=:proid";
        try (Connection con = DbUtills.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("proid",proid )
                    .addParameter("price_current", price_current)
                    .addParameter("price_max", price_max)
                    .addParameter("bid_id", uid)
                    .executeUpdate();
            return true;
        }
        catch (Exception e){return false;}
    }
}
