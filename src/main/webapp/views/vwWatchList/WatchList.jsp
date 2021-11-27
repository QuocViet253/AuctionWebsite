<%--
  Created by IntelliJ IDEA.
  User: Tri
  Date: 11/26/2021
  Time: 3:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="watchlists" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.WatchList>" />
<%--<jsp:useBean id ="watchlist" scope="request" type="com.ute.auctionwebapp.beans.WatchList" >--%>
<t:watchlist>
    <jsp:attribute name="js">
        <script>
            //Add paging
            $(document).ready(function() {
                $('.t1').after('<div id="nav" class="text-center"></div>');
                let itemsShown = 8;
                let itemsTotal = $('.t1 .col-md-3').length;
                let numPages = itemsTotal / itemsShown;
                for (let i = 0; i < numPages; i++) {
                    let pageNum = i + 1;
                    $('#nav').append('<a href="#" class="btn-outline-info btn-sm text-decoration-none rounded-lg border border-info" rel="' + i + '">&emsp;' + pageNum + '&emsp;</a> ');
                }
                $('.t1 .col-md-3').hide();
                $('.t1 .col-md-3').slice(0, itemsShown).show();
                $('#nav a:first').addClass('active');
                $('#nav a').bind('click', function(e) {
                    e.preventDefault();
                    $('#nav a').removeClass('active');
                    $(this).addClass('active');
                    let currPage = $(this).attr('rel');
                    let startItem = currPage * itemsShown;
                    let endItem = startItem + itemsShown;
                    $('.t1 .col-md-3').css('opacity', '0').hide().slice(startItem, endItem).
                    css('display', 'block').animate({
                        opacity: 1
                    }, 300);
                });
            });
            //function
            function remove (otp){
                $.getJSON(otp, function (data) {
                    if (data === 'false') {
                        alert('Cannot Delete');
                    } else
                    {
                        alert("Successfully");
                        location.reload();
                    }
                });
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <h3 class="text-center mb-3 mt-3 bg-danger text-light">My WatchList</h3>
        <div class="row">
            <section class="on-sale">
                <div class="container-fluid t1">
                    <div class="row mt-2">
                        <c:choose>
                            <c:when test="${watchlists.size()==0}">
                                <div class="card-body">
                                    <p class="card-text">No data</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${watchlists}" var="w">
                                    <div class="col-md-3 mb-4" >
                                        <div class="product-top">
                                            <a href="${pageContext.request.contextPath}/Product/Detail?id=${w.proid}"><img src="https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-xanh-duong-new-2-600x600.jpg"></a>
                                            <div class="overlay-right">
                                                <a href="${pageContext.request.contextPath}/Product/Detail?id=${w.proid}" class="btn btn-secondary" title="Detail">
                                                    <i class="fa fa-eye" style="border-radius: 50%" aria-hidden="true"></i>
                                                </a>
                                                <button type="button" href="${pageContext.request.contextPath}/WatchList/deleteWatchList?id=${w.id}" onclick="remove('${pageContext.request.contextPath}/WatchList/deleteWatchList?id=${w.id}')" class=" btn btn-secondary" title="Add to WatchList">
                                                    <i class="fa fa-trash" aria-hidden="true" style="border-radius: 50%"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="product-bottom text-center">
                                            <h3>Tên sản phẩm: ${w.proname}</h3>
                                            <p style="margin: 0">Giá: ${w.price_start}</p>
                                            <a class="btn btn-success btn-sm" href="#" role="button">Auction now</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </section>
        </div>
    </jsp:body>
</t:watchlist>