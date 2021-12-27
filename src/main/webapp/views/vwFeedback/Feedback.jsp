
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="Feedback" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Feedback>"/>
<jsp:useBean id="authUser" scope="session" type="com.ute.auctionwebapp.beans.User"/>

<t:history>
     <jsp:attribute name="js">
        <script></script>
    </jsp:attribute>
    <jsp:body>
        <div class="history-image">
            <div class="title-box bg-warning mt-1 mb-3 w-100 justify-content-center" style="border-radius: 5px; font-family: 'Bauhaus 93'">
                <h2>My Comment</h2>
            </div>
            <div class="tableFixHistory" style="cursor: pointer">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col" style="background-color: black; color: white">To</th>
                        <th scope="col" style="background-color: black; color: white">Product</th>
                        <th scope="col" style="background-color: black; color: white">Comment</th>
                        <th scope="col" style="background-color: black; color: white">Like/Dislike</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${Feedback.size()==0}">
                            <div class="card-body">
                                <p class="card-text">No data</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${Feedback}" var="f">
                                <c:if test="${f.review_id == authUser.id}">
                                    <tr>
                                        <th scope="col">${f.uname}</th>
                                        <th>${f.proname}</th>
                                        <th >${f.des}</th>
                                 <c:if test="${f.like ==1}">
                                     <th >
                                         <a type="button" class="btn btn-outline-dark btn-sm btn-block w-51">
                                             <i class="fa fa-thumbs-up" aria-hidden="true"></i>
                                         </a>
                                     </th>
                                 </c:if>
                                        <c:if test="${f.like ==1}">
                                            <th >
                                                <a type="button" class="btn btn-outline-dark btn-sm btn-block w-51">
                                                    <i class="fa fa-thumbs-down" aria-hidden="true"></i>
                                                </a>
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
</t:history>