package com.ute.auctionwebapp.models;

import com.ute.auctionwebapp.beans.*;
import com.ute.auctionwebapp.utills.DbUtills;
import org.sql2o.Connection;
import com.ute.auctionwebapp.beans.User;

import java.time.LocalDateTime;
import java.util.List;

public class HistoryModel {
    public static boolean addHistory(int proid, String proname, int sell_pid, int bid_id, LocalDateTime buy_day) {
        String insertSql = "INSERT INTO history (proid, proname, sell_pid, bid_id, buy_day) VALUES (:proid, :proname, :sell_pid, :bid_id, :buy_day)";
        try (Connection con = DbUtills.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("proid", proid)
                    .addParameter("proname", proname)
                    .addParameter("sell_pid", sell_pid)
                    .addParameter("bid_id", bid_id)
                    .addParameter("buy_day", buy_day)
                    .executeUpdate();
            return true;
        }
        catch (Exception e){
            return false;
        }
    }
    public static List<History> findAll(){
        final String query = "select * from histories";
        try (Connection con = DbUtills.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(History.class);
        }
    }
    public static boolean findByProduct(int proid, String proname) {
        final String query = "select * from histories where proid = :proid and proname= :proname";
        try (Connection con = DbUtills.getConnection()) {
            List<History> list = con.createQuery(query)
                    .addParameter("proid", proid)
                    .addParameter("proname", proname)
                    .executeAndFetch(History.class);

            if (list.size() == 0) {
                return true;
            }
            return false;
        }
    }
    public static boolean deleteHistory(int id) {
        String Sql = "delete from watch_list where id=:proid";
        try (Connection con = DbUtills.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("proid", id)
                    .executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
