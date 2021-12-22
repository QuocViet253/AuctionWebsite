<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="Category" scope="request" type="com.ute.auctionwebapp.beans.Category" />

<t:manager>
    <jsp:body>
        <jsp:useBean id="category" scope="request" type="com.ute.auctionwebapp.beans.Category"/>
        <form action="" method="post">
            <div class="card">
                <h4 class="card-header">
                    Category
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtCatID">Category</label>
                        <input type="text" class="form-control" id="txtCatID" name="CatID" readonly value="${category.catid}">
                    </div>
                    <div class="form-group">
                        <label for="txtCatName">Category</label>
                        <input type="text" class="form-control" id="txtCatName" name="CatName" autofocus value="${category.catname}">
                    </div>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Category" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        List
                    </a>
                    <button type="submit" class="btn btn-danger">
                        <i class="fa fa-trash-o" aria-hidden="true"></i>
                        Delete
                    </button>
                    <button type="submit" class="btn btn-info">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Save
                    </button>
                </div>
            </div>
        </form>
    </jsp:body>
</t:manager>