package com.ute.auctionwebapp.models;

import com.ute.auctionwebapp.beans.Feedback;
import com.ute.auctionwebapp.beans.Product;
import com.ute.auctionwebapp.beans.User;
import com.ute.auctionwebapp.utills.DbUtills;
import org.sql2o.Connection;

import java.util.List;

public class FeedbackModel {
    public static boolean add(Feedback f){
        final String query = "INSERT INTO feedback (uid, uname, review_id, review_name, des, like1, dislike, proid,proname) VALUES (:uid,:uname,:reviewId,:reviewName,:des,:like1,:dislike,:proid,:proname)\n";
        try (Connection con = DbUtills.getConnection()) {
            con.createQuery(query)
                    .addParameter("uid",f.getUid())
                    .addParameter("uname",f.getUname())
                    .addParameter("reviewId",f.getReview_id())
                    .addParameter("reviewName",f.getReview_name())
                    .addParameter("des",f.getDes())
                    .addParameter("like1",f.getLike())
                    .addParameter("dislike",f.getDislike())
                    .addParameter("proid",f.getProid())
                    .addParameter("proname",f.getProname())
                    .executeUpdate();
            return true;
        }
    }
    public static int getUserRate(int uid){
        final String query = "select cast((sum(like1)/(sum(like1) + sum(dislike)))*100 as UNSIGNED) as rate\n" +
                "    from feedback\n" +
                "    where uid = :uid";
        try (Connection con = DbUtills.getConnection()) {
            List<Feedback> f = con.createQuery(query)
                    .addParameter("uid",uid)
                    .executeAndFetch(Feedback.class);
            return f.get(0).getRate();
        }
    }

    public static List<Feedback> getListUserRate(){
        final String query = "select uid, cast((sum(like1)/(sum(like1) + sum(dislike)))*100 as UNSIGNED) as rate\n" +
                "        from feedback\n" +
                "group by uid";
        try (Connection con = DbUtills.getConnection()) {
            List<Feedback> f = con.createQuery(query)
                    .executeAndFetch(Feedback.class);
            return f;
        }
    }

    public static boolean checkByReviewIDandProID(int review_id, int proid){
        final String query = "select *\n" +
                "    from feedback\n" +
                "    where review_id = :review_id and proid = :proid";
        try (Connection con = DbUtills.getConnection()) {
            List<Feedback> f = con.createQuery(query)
                    .addParameter("review_id",review_id)
                    .addParameter("proid",proid)
                    .executeAndFetch(Feedback.class);
            if (f.size() == 0) return false;
            return true;
        }
    }

    public static List<Feedback> findAll(){
        final String query = "select * from feedback";
        try (Connection con = DbUtills.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Feedback.class);
        }
    }


}
