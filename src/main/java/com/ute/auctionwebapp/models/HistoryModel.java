package com.ute.auctionwebapp.models;

import com.ute.auctionwebapp.beans.User;
import com.ute.auctionwebapp.utills.DbUtills;
import org.sql2o.Connection;

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
}
