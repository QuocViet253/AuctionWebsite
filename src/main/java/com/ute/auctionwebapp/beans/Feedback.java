package com.ute.auctionwebapp.beans;

public class Feedback {
    private int uid,review_id,proid,like1,dislike,rate;
    private String uname,review_name,des,proname;

    public Feedback(int uid, int review_id, int proid, int like1, int dislike, String uname, String review_name, String des, String proname) {
        this.uid = uid;
        this.review_id = review_id;
        this.proid = proid;
        this.like1 = like1;
        this.dislike = dislike;
        this.uname = uname;
        this.review_name = review_name;
        this.des = des;
        this.proname = proname;
    }

    public Feedback() {
    }

    public int getUid() {
        return uid;
    }

    public int getReview_id() {
        return review_id;
    }

    public int getProid() {
        return proid;
    }

    public int getLike() {
        return like1;
    }

    public int getDislike() {
        return dislike;
    }

    public String getUname() {
        return uname;
    }

    public String getReview_name() {
        return review_name;
    }

    public String getDes() {
        return des;
    }

    public String getProname() {
        return proname;
    }

    public int getRate() {
        return rate;
    }
}
