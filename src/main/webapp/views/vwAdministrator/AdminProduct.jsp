
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<t:manager>
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
            function remove (otp){
                $.getJSON(otp, function (data) {
                    if (data == false) {
                        swal({
                            title: "Failed!",
                            text: "Failed deleted to this product!",
                            icon: "error",
                            button: "OK!",
                            dangerMode: true,
                            closeOnClickOutside: false,
                        });
                    } else
                    {
                        swal({
                            title: "Successfully!",
                            text: "Successfully deleted to this product!",
                            icon: "success",
                            button: "OK!",
                            closeOnClickOutside: false,
                        })
                            .then(function(){
                                    location.reload();
                                }
                            );
                    }
                });
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="title-box bg-warning mt-1 w-100 justify-content-center mb-3" style="border-radius: 5px;background-image: url('https://images.squarespace-cdn.com/content/v1/5be4abdf0dbda37a57d6b5cd/1542130803615-0392V5SC5CWYPEEA1FTH/Header-bgr-V1.jpg?format=1500w'); background-size: cover">
            <h2 style="font-family: 'Bauhaus 93'">Product Manager</h2>
        </div>
        <div class="right col-sm-10 mt-1 mx-auto" >
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
                                    <div class="col-md-3 mb-2 mt-3" >
                                        <div class="product-top mt-3 text-center">
                                            <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proid}&catid=${p.catid}"><img style="width: 232px;height: 232px; object-fit: contain;" src="${pageContext.request.contextPath}/public/imgs/products/${p.proid}/main.jpg"></a>
                                            <div class="overlay-right">
                                                <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proid}&catid=${p.catid}" class="btn btn-secondary" title="Detail">
                                                    <i class="fa fa-eye" style="border-radius: 50%" aria-hidden="true"></i>
                                                </a>
<%--                                                <button type="button"  href="${pageContext.request.contextPath}/Product/AddWatchList?proid=${p.proid}&proname=${p.proname}&price_start=${p.price_start}&uid=${authUser.id}" onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${p.proid}&proname=${p.proname}&price_start=${p.price_start}&uid=${authUser.id}&catid=${p.catid}')" class="heart btn btn-secondary " title="Add to WatchList">--%>
<%--                                                    <i class="fa fa-heart-o" style="border-radius: 50%"></i>--%>
<%--                                                </button>--%>
                                                <button type="button"  onclick="remove('${pageContext.request.contextPath}/Admin/DeleteProduct?id=${p.proid}')"href="${pageContext.request.contextPath}/WatchList/deleteWatchList?id=${w.id}" onclick="remove('${pageContext.request.contextPath}/WatchList/deleteWatchList?id=${w.id}')" class=" btn btn-secondary" title="Remove Product">
                                                    <i class="fa fa-trash" aria-hidden="true" style="border-radius: 50%"></i>
                                                </button>
                                               <%-- <button  onclick="remove('${pageContext.request.contextPath}/Admin/DeleteProduct?id=${p.proid}')">
                                                    <i class="fa fa-trash-o" style="border-radius: 50%" aria-hidden="true"></i>
                                                </button>--%>
                                            </div>
                                        </div>
                                        <div class="product-bottom text-center" >
                                            <h3 class="mx-auto mt-4" style="width: 230px;height: 75px; object-fit: contain;">${p.proname}</h3>
                                            <h5><b>Price Current:</b>
                                                <span class="text-danger font-weight-bold" style="font-size: 30px">$<fmt:formatNumber value="${p.price_current}" type="number" /></span>
                                            </h5>
                                            <c:if test="${p.price_now!=0}">
                                                <h5> <b>Price Buy Now:</b>
                                                    <span class="text-primary" style="font-size: larger">$<fmt:formatNumber value="${p.price_now}" type="number"/></span>
                                                </h5>
                                            </c:if>
                                            <h5><b>Start Date</b> :
                                                <fmt:parseDate value="${p.start_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                                <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                                            </h5>
                                            <h5><b>  End Date:</b>
                                                <fmt:parseDate value="${p.end_day}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="end" type="both" />
                                                <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ end }" />
                                            </h5>
                                            <%--<h5><b>Sum of bids:</b> ${p.bid_count}</h5>--%>
                                            <%--<h5><b>Highest bidder: </b>--%>
                                            <%--    <c:choose>--%>
                                            <%--    <c:when test="${empty p.name}">--%>
                                            <%--        Nobody bidding.--%>
                                            <%--    </c:when>--%>
                                            <%--    <c:otherwise>--%>
                                            <%--    <span class="text-danger">${p.name}</span></h5>--%>
                                            <%--</c:otherwise>--%>
                                            <%--</c:choose>--%>
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
</t:manager>
