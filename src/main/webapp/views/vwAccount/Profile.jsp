<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="authUser" scope="session" type="com.ute.auctionwebapp.beans.User"/>
<t:account>

    <jsp:body>

        <div class="card mx-auto justify-content-center d-flex mt-5" style="width: 30rem;">
            <div class="text-center mt-3">
                <h3 class="text-info">Profile</h3>
            </div>
            <div class="card-body justify-content-center d-flex">
                <h5 class="card-title"><b>${authUser.name}</b> </h5>
            </div>
            <ul class="list-group list-group-flush">
                    <li class="list-group-item"><b>Email:</b> ${authUser.email} </li>
                    <li class="list-group-item"><b>Address:</b> ${authUser.address} </li>
                    <li class="list-group-item"><b>Birthday:</b> ${authUser.dob}</li>
            </ul>
            <div class="card-body justify-content-center d-flex">
                <a href="${pageContext.request.contextPath}/Account/EditProfile" class="card-link">Edit Information</a>
                <a href="${pageContext.request.contextPath}/Account/ChangePwd" class="card-link">Change Password</a>
            </div>
        </div>
    </jsp:body>
</t:account>

