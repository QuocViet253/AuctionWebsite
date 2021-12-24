<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="catParent" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Category>"/>
<t:manager>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <h4 class="card-header">
                    New Category
                </h4>
                <div class="card-body">
                    <div class="form-group">
                    <label for="txtCat">Category Parent</label>
                    <select name="catpid" id="txtCat" class="w-100" style="border-radius: 25px; border-color: orange; height: 40px">
                    <option value="0">None</option>
                    <c:forEach items="${catParent}" var="catParent">
                        <option value="${catParent.catid}">${catParent.catname}</option>
                    </c:forEach>
                    </select>
                        <span class="form-message" ></span>
                    </div>
                    <div class="mb-3">
                        <label for="txtCatName" class="form-label">Category</label>
                        <input type="text" class="form-control" id="txtCatName" name="CatName" autofocus>
                    </div>
                    <c:if test="${hasSuccess}">
                        <div class="alert alert-success alert-dismissible fade show w-75 mx-auto" role="alert">
                            <strong>${Message}</strong>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </c:if>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Category" role="button">
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

