package com.ute.auctionwebapp.utills;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.ute.auctionwebapp.beans.GoogleUser;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import java.io.IOException;

public class GoogleUtills {
    public static String GOOGLE_CLIENT_ID = "968786308056-9k67nqlp92f8m7ak4060b75n1pjsfj0n.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "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";
    //Sửa port ở đây
    public static String GOOGLE_REDIRECT_URI = "http://localhost:8082/auctionWebApp/Account/GoogleLogin";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v2/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";

    public static String getToken(final String code) throws ClientProtocolException, IOException {
        String response = Request.Post(GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", GOOGLE_CLIENT_ID)
                        .add("client_secret", GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri",GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static GoogleUser getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        GoogleUser googlePojo = new Gson().fromJson(response, GoogleUser.class) ;
        return googlePojo;
    }
}
