package com.ute.auctionwebapp.utills;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

public class DbUtills {
//    static Sql2o sql2o = new Sql2o("jdbc:mysql://node2069-auctionwebapp.user.edgecloudph.com/auction", "root", "XROqtb08622");
    static Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/auction", "root", "");
    public static Connection getConnection () {
        return sql2o.open();
    }

//    Host: node2069-auctionwebapp.user.edgecloudph.com
//    Login: root
//    Password: XROqtb08622
}
