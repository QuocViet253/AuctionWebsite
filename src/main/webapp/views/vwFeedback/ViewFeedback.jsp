
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="users" scope="request" type="com.ute.auctionwebapp.beans.User"/>
<jsp:useBean id="Feedback" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Feedback>"/>


<t:admin>
     <jsp:attribute name="js">
        <script>

        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="history-image">
            <div class="title-box bg-danger mt-1 mb-3 w-100 justify-content-center" style="border-radius: 5px; font-family: 'Bauhaus 93'">
                <h2>Feedback</h2>
            </div>
            <div class="text-center">
                <div text-center>
                    <b class="text-secondary "style="text-align: center">Feedback about: ${users.name}</b>
                </div>

                <div class=" text-center">
                    <b style="align-items: center">
                        <script>
                            let countlike = 0;
                            let countdislike = 0;
                            <c:forEach items="${Feedback}" var="f">
                            <c:if test="${f.uid == users.id}">

                            <c:if test="${f.like == 1}">
                            countlike ++ ;
                            </c:if>

                            <c:if test="${f.dislike == 1}">
                            countdislike ++ ;
                            </c:if>

                            </c:if>
                            </c:forEach>
                            document.write("<b> Rate: </b>" + countlike + " <i class='text-primary fa fa-thumbs-up'></i> | "+ countdislike +" <i class='text-danger fa fa-thumbs-down'></i>")
                        </script>
                    </b>
                </div>

                <div class="form-group">
                    <b class="text-secondary"><label id="txtrate" class="col-form-label"></label></b>
                </div>
            </div>
            <div  class="tableFixHistory w-75 h-50 mx-auto" style="cursor: pointer" id="tableFixHistory2">
                <table class="table  table-hover">
                    <thead>
                    <tr>
                        <th scope="col" style="background-color: black; color: white">From</th>
                        <th scope="col" style="background-color: black; color: white">Product</th>
                        <th scope="col" style="background-color: black; color: white">Comment</th>
                        <th scope="col" style="background-color: black; color: white">Like/Dislike</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${Feedback.size()== 0}">
                            <div class="card-body">
                                <p class="card-text">No data</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${Feedback}" var="f">
                                <c:if test="${f.uid == users.id}">
                                    <tr>
                                        <th scope="col">${f.review_name}</th>
                                        <th>${f.proname}</th>
                                        <th >${f.des}</th>
                                        <c:if test="${f.like ==1}">
                                            <th >
                                                <i class="fa fa-thumbs-up text-primary" aria-hidden="true"></i>
                                            </th>
                                        </c:if>
                                        <c:if test="${f.dislike ==1}">
                                            <th >
                                                <i class="fa fa-thumbs-down text-danger" aria-hidden="true"></i>
                                            </th>
                                        </c:if>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>

        </div>
    </jsp:body>
</t:admin>