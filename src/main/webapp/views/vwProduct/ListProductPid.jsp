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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<jsp:useBean id="authUser" scope="session" type="com.ute.auctionwebapp.beans.User" />
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
                    $('#nav').append('<a href="#" class="btn-outline-warning btn-sm text-decoration-none rounded-lg border border-warning" rel="' + i + '">&emsp;' + pageNum + '&emsp;</a> ');
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
            window.onload=()=>{
                if(!${auth})
                    $('.heart').attr("onclick","location.href='${pageContext.request.contextPath}/Account/Login'")
            }
            function add (otp){
                {
                    $.getJSON(otp, function (data) {
                        if (data === false) {
                            swal({
                                title: "Failed!",
                                text: "Failed added to your watchlist!",
                                icon: "error",
                                button: "OK!",
                                dangerMode: true,
                                closeOnClickOutside: false,
                            });
                        } else swal({
                            title: "Successfully!",
                            text: "Successfully added to your watchlist!",
                            icon: "success",
                            button: "OK!",
                            closeOnClickOutside: false,
                        });
                    });
                }
            }
            //Countdown timer in product
            $(function(){
                $('[data-countdown]').each(function() {
                    let $this = $(this), finalDate = $(this).data('countdown');
                    $this.countdown(finalDate, function(event) {
                        $this.html(event.strftime('%D days %H:%M:%S'))}).on('finish.countdown', function() {
                        $this.text('EXPIRED');
                    });
                });
            });
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
                                    <div class="col-md-3 mb-4 shadow mt-3"  >
                                        <div class="product-top mt-2 text-center">
                                            <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proid}&catid=${p.catid}"><img style="height: 232px; width: 232px;object-fit:contain " src="${pageContext.request.contextPath}/public/imgs/products/${p.proid}/main.jpg"></a>
                                            <div class="overlay-right">
                                                <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proid}&catid=${p.catid}" class="btn btn-secondary" title="Detail">
                                                    <i class="fa fa-eye" style="border-radius: 50%" aria-hidden="true"></i>
                                                </a>
                                                <button type="button" href="${pageContext.request.contextPath}/Product/AddWatchList?proid=${p.proid}&proname=${p.proname}&price_start=${p.price_start}&uid=1" onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${p.proid}&proname=${p.proname}&price_start=${p.price_start}&uid=${authUser.id}&catid=${p.catid}')"  class="heart btn btn-secondary" title="Add to WatchList">
                                                    <i class="fa fa-heart-o" style="border-radius: 50%"></i>
                                                </button>
                                            </div>
                                            <div class="d-none">
                                                <fmt:parseDate value="${p.start_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="start" type="both" />
                                                <fmt:formatDate type="time" value="${start}"/>
                                            </div>
                                            <fmt:parseNumber type="number" pattern="##" var="date" value="${((now.time - start.time) / (1000*60*60*24)) }" integerOnly="true" />
                                            <c:if test="${date <1}">
                                                <c:if test="${(((now.time - start.time) % (1000 * 60 * 60))/ (1000 * 60)) <30}">
                                                    <span class="new-title"></span>
                                                </c:if>
                                            </c:if>
                                        </div>
                                        <div class="product-bottom text-center">
                                            <h3 class="mx-auto mt-4" style="width: 250px;height: 75px; object-fit: contain">${p.proname}</h3>
                                            <h5 class="text-primary" style="margin: 0"><b>Price Current:</b> $
                                                <fmt:formatNumber value="${p.price_current}" type="number" />
                                            </h5>
                                            <c:if test="${p.price_now!=0}">
                                                <h5 class="text-danger"><b>Price Buy Now:</b> $
                                                    <fmt:formatNumber value="${p.price_now}" type="number" />
                                                </h5>
                                            </c:if>
                                            <h5><b>Start Date:</b>
                                                <fmt:parseDate value="${p.start_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                                <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                                            </h5>
                                            <h5><b>End Date:</b>
                                                <fmt:parseDate value="${p.end_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                                <span class="text-success" data-countdown="<fmt:formatDate pattern="MM/dd/yyyy HH:mm:ss" value="${parsedDateTime}" />"></span>
                                            </h5>
                                            <h5><b>Sum of bids:</b> ${p.bid_count}</h5>
                                            <h5 class="text-danger"><b>Highest bidder:</b> ${p.name}</h5>
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
</t:main>