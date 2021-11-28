package com.ute.auctionwebapp.beans;

import java.time.LocalDateTime;

public class History {
    private int proid;
    private String proname;
    private int sell_pid;
    private int bid_id;
    private LocalDateTime buy_day;
    public History() {}

    public int getProid() { return proid; }

    public String getProname() {
        return proname;
    }

    public int getSell_pid() { return sell_pid; }

    public int getBid_id() { return bid_id; }

    public LocalDateTime getBuy_day(){ return buy_day; }

    public History(int proid, String proname, int sell_pid, int bid_id, LocalDateTime buy_day) {
        this.proid = proid;
        this.proname = proname;
        this.sell_pid = sell_pid;
        this.bid_id = bid_id;
        this.buy_day = buy_day;
    }
}
