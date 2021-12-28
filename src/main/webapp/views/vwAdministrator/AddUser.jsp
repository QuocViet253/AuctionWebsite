<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<t:manager>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <h4 class="card-header">
                    New User
                </h4>
                <div class="card-body">
                    <div class="mb-3">
                        <label for="txtUser" class="form-label">User</label>
                        <input type="text" class="form-control" id="txtUser" name="User" autofocus>
                    </div>
                    <div class="mb-3">
                        <label for="txtMail" class="form-label">Email</label>
                        <input type="text" class="form-control" id="txtMail" name="Email" autofocus>
                    </div>
                    <div class="mb-3">
                        <label for="txtPass" class="form-label">Password</label>
                        <input type="password" class="form-control" id="txtPass" name="Password" autofocus>
                    </div>
                    <div class="mb-3">
                        <label for="txtRole">Role</label>
                        <select name="Role" id="txtRole" class="w-100" style="border-radius: 25px; border-color: orange; height: 40px">
                            <option value="0">Admin</option>
                            <option value="1">Bidder</option>
                            <option value="2">Seller</option>
                        </select>
                    </div>
                    <c:if test="${hasSuccess}">
                        <div class="alert alert-success alert-dismissible fade show w-75 mx-auto" role="alert">
                            <strong>${Message}</strong>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </c:if>
                    <c:if test="${hasError}">
                        <div class="alert alert-danger alert-dismissible fade show w-75 mx-auto" role="alert">
                            <strong>Error!</strong> ${errorMessage}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </c:if>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/User" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        List
                    </a>
                    <button type="submit" class="btn btn-info">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Save
                    </button>
                </div>
            </div>
        </form>
    </jsp:body>
</t:manager>

