package com.ute.auctionwebapp.utills;


import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class MailUtills {
    private static int randomOTP;
    public static void send(String to, String sub,
                            String msg) {
        final String user = "auctionwebapp6@gmail.com";
        final String pass = "auction1.";
        //create an instance of Properties Class
        Properties props = new Properties();

        /* Specifies the IP address of your default mail server
     	   for e.g if you are using gmail server as an email sever
           you will pass smtp.gmail.com as value of mail.smtp host.
           As shown here in the code.
           Change accordingly, if your email id is not a gmail id
         */
        props.put("mail.smtp.host", "smtp.gmail.com");
        //below mentioned mail.smtp.port is optional
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        /* Pass Properties object(props) and Authenticator object
           for authentication to Session instance
         */
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {

            /* Create an instance of MimeMessage,
 	      it accept MIME types and headers
             */
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setContent(msg, "text/html");

            /* Transport class is used to deliver the message to the recipients */
            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static boolean sendOTP(String email, String userOTP) {
        if (userOTP == "") {
            try {
                Random rnd = new Random();
                int random = rnd.nextInt(999999);
                randomOTP = random;
                String.format("%06d", random);
                String subject = "OTP from reset password | Auction Website";
                String message = "<!DOCTYPE html>\n"
                        + "<html lang=\"en\">\n"
                        + "\n"
                        + "<head>\n"
                        + "</head>\n"
                        + "\n"
                        + "<body>\n"
                        + "    <h3 style=\"color: blue;\">Your OTP to reset password.</h3>\n"
                        + "    <div>Email :" + email + "</div>\n"
                        + "    <div>Your OTP :" + random + "</div>\n"
                        + "\n"
                        + "</body>\n"
                        + "\n"
                        + "</html>";
                MailUtills.send(email, subject, message);
                return true;
            } catch (Exception e) {
                return false;
            }
        } else {
            if (Integer.parseInt(userOTP,10) == randomOTP) {
                return true;
            } else return false;
        }
    }

    public static void sendResetPassword(String email ){
        String subject = "Reset password request | Auction Website";
        String message = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "\n"
                + "<head>\n"
                + "</head>\n"
                + "\n"
                + "<body>\n"
                + "    <h3 style=\"color: blue;\">Your password has been reset.</h3>\n"
                + "    <div>Email :" + email + "</div>\n"
                + "    <div>Your reset password :" + email + "</div>\n"
                + "\n"
                + "</body>\n"
                + "\n"
                + "</html>";
        MailUtills.send(email, subject, message);
    }
}
