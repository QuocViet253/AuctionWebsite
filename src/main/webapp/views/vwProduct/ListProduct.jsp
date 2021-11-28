<%--
  Created by IntelliJ IDEA.
  User: Tri
  Date: 11/22/2021
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<t:main>
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
            function add (otp){
                $.getJSON(otp, function (data) {
                    if (data === 'false') {
                        alert('Not Added');
                    } else alert("successfully");
                });
            }
            // $('.addWatchList').on('click', function (e) {
            //
            // });
        </script>
    </jsp:attribute>

    <jsp:body>
        <div class="right col-sm-10 mt-1" >
            <section class="on-sale">
                <div class="container-fluid t1">
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
                                            <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proid}"><img style="width: 232px;height: 232px; object-fit: contain;" src="${pageContext.request.contextPath}/public/imgs/products/${p.proid}/main.jpg"></a>
                                            <div class="overlay-right">
                                                <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proid}" class="btn btn-secondary" title="Detail">
                                                    <i class="fa fa-eye" style="border-radius: 50%" aria-hidden="true"></i>
                                                </a>
                                                    <button type="button"  href="${pageContext.request.contextPath}/Product/AddWatchList?proid=${p.proid}&proname=${p.proname}&price_start=${p.price_start}&uid=1" onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${p.proid}&proname=${p.proname}&price_start=${p.price_start}&uid=1')" class=" btn btn-secondary " title="Add to WatchList">
                                                        <i class="fa fa-heart-o" style="border-radius: 50%"></i>
                                                    </button>

                                            </div>
                                        </div>
                                        <div class="product-bottom text-center">
                                            <h3 name="proname">${p.proname}</h3>
                                            <p name="price_start" style="margin: 0">Start price: ${p.price_start}</p>
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
        <%--<nav aria-label="Page navigation example" class=" mt-3" style="margin-left: 85%;">--%>
        <%--    <ul class="pagination">--%>
        <%--        <li class="page-item">--%>
        <%--            <a class="page-link" href="#" aria-label="Previous">--%>
        <%--                <span aria-hidden="true">&laquo;</span>--%>
        <%--            </a>--%>
        <%--        </li>--%>
        <%--        <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
        <%--        <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
        <%--        <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
        <%--        <li class="page-item">--%>
        <%--            <a class="page-link" href="#" aria-label="Next">--%>
        <%--                <span aria-hidden="true">&raquo;</span>--%>
        <%--            </a>--%>
        <%--        </li>--%>
        <%--    </ul>--%>
        <%--</nav>--%>
    </jsp:body>
</t:main>

