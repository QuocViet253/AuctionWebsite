<%--
  Created by IntelliJ IDEA.
  User: Tri
  Date: 11/26/2021
  Time: 1:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<t:main>
    <jsp:body>
        <div class="right col-sm-10 mt-1" >
            <section class="on-sale">
                <div class="container-fluid">
                    <div class="row mt-2">
                        <c:choose>
                            <c:when test="${products.size()==0}">
                                <div class="card-body">
                                    <p class="card-text">No data</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${products}" var="p">
                                    <div class="col-md-3 mb-4" >
                                        <div class="product-top">
                                            <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proid}"><img src="https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-xanh-duong-new-2-600x600.jpg"></a>
                                            <div class="overlay-right">
                                                <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proid}" class="btn btn-secondary" title="Detail">
                                                    <i class="fa fa-eye" style="border-radius: 50%" aria-hidden="true"></i>
                                                </a>
                                                <a href="" class="btn btn-secondary" title="Add to WatchList">
                                                    <i class="fa fa-heart-o" style="border-radius: 50%"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="product-bottom text-center">
                                            <h3>${p.proname}</h3>
                                            <p style="margin: 0">Start price: ${p.price_start}</p>
                                            <a class="btn btn-success btn-sm" href="#" role="button">
                                                <i class="fa fa-gavel text-light fa-2x" aria-hidden="true"></i>
                                                Auction now
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </section>
        </div>
        <nav aria-label="Page navigation example" class=" mt-3" style="margin-left: 85%;">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </jsp:body>
</t:main>