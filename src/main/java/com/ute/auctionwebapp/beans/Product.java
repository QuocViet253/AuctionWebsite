package com.ute.auctionwebapp.beans;

import java.time.LocalDateTime;
import java.util.Date;

public class Product {
    private int proid;
    private String proname,tinydes,fulldes;
    private int quantity,price_start,price_payment,price_step,price_now,price_current;
    private LocalDateTime start_day,end_day;
    private int catid,bid_id;
    private String status;

    public Product() {}

    public Product(int proid, String proname, String tinydes, String fulldes, int quantity, int price_start, int price_payment, int price_step, int price_now, int price_current, LocalDateTime start_day, LocalDateTime end_day, int catid, int bid_id, String status) {
        this.proid = proid;
        this.proname = proname;
        this.tinydes = tinydes;
        this.fulldes = fulldes;
        this.quantity = quantity;
        this.price_start = price_start;
        this.price_payment = price_payment;
        this.price_step = price_step;
        this.price_now = price_now;
        this.price_current = price_current;
        this.start_day = start_day;
        this.end_day = end_day;
        this.catid = catid;
        this.bid_id = bid_id;
        this.status = status;
    }

    public int getProid() {
        return proid;
    }

    public String getProname() {
        return proname;
    }

    public String getTinydes() {
        return tinydes;
    }

    public String getFulldes() {
        return fulldes;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getPrice_start() {
        return price_start;
    }

    public int getPrice_payment() {
        return price_payment;
    }

    public int getPrice_step() {
        return price_step;
    }

    public int getPrice_now() {
        return price_now;
    }

    public int getPrice_current() {
        return price_current;
    }

    public LocalDateTime getStart_day() {
        return start_day;
    }

    public LocalDateTime getEnd_day() {
        return end_day;
    }

    public int getCatid() {
        return catid;
    }

    public int getBid_id() {
        return bid_id;
    }

    public String getStatus() {
        return status;
    }
}
