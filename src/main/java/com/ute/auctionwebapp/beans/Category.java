package com.ute.auctionwebapp.beans;

public class Category {
    private int catid;
    private String catname;
    private int pid;
    private int level;

    public Category(int i, String name) {
    }

    public int getPid() {
        return pid;
    }

    public int getLevel() {
        return level;
    }

    public Category(int catid, String catname, int pid, int level) {
        this.catid = catid;
        this.catname = catname;
        this.pid=pid;
        this.level = level;
    }
    public Category(String catname) {
        this.catid = -1;
        this.catname = catname;
    }
    public int getCatid() {
        return catid;
    }

    public String getCatname() {
        return catname;
    }
}
