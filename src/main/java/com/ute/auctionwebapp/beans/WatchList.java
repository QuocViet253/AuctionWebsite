package com.ute.auctionwebapp.beans;

public class WatchList {
    private int id;
    private int proid;
    private String proname;
    private int price_start;
    private int uid;

    public WatchList() {
    }


    public WatchList(int id, int proid, String proname, int price_start, int uid) {
        this.id = id;
        this.proid = proid;
        this.proname = proname;
        this.price_start = price_start;
        this.uid=uid;
    }
    public int getUid() {
        return uid;
    }
    public int getId() {
        return id;
    }

    public int getProid() {
        return proid;
    }

    public String getProname() {
        return proname;
    }

    public int getPrice_start() {
        return price_start;
    }
}
