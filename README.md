# Auction Web App
1. Set up Local Sever
  - IDE           : IntelliJ (Ultimate version)
  - Tomcat version: 9.0.54
         In Tomcat Sever Configurations ==> Deployment ==> Add artifact auctionWebapp:war exploded ==> Modify Application context in below to /auctionWebapp
  - JDK version   : 11.0.12
    - Database      : Mysql (8.0.27)
         Run script actionData.sql
2. Modify code in project
  - Modify local port of your database in line 10 (java/utills/DbUtills)
  - Modify port of your local sever (only port 8080,8081,8082,8083) in line 18 (java/utills/GoogleUtills) and line 122 (webapp/views/vwAccount/Login.jsp)
  - Modify your username and password of your admin email in line 14,15 (java/utills/MailUtills)
3. Run project
  - Admin  account: username: admin    password: 123
  - Bidder account: username: bidder1  password: 123
  - Seller account: username: seller1  password: 123
  
