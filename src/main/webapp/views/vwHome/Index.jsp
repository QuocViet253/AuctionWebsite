<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:main>
    <jsp:body>
        <div class="right col-sm-5 mt-1" >
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="card w-100" style="height: 600px" >
                            <img class="card-img-top h-75" src="https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-xanh-duong-new-2-600x600.jpg" alt="First slide">
                            <div class="card-body">
                                <h5 class="card-title text-center">Nike </h5>
                                <p class="card-text text-center">EPL</p>
                                <a href="#" class="btn btn-primary d-flex justify-content-center">View</a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card w-100" style="height: 600px" >
                            <img class="card-img-top h-75"  src="https://cdn.tgdd.vn/Products/Images/42/213033/iphone-12-pro-max-xanh-duong-new-600x600-600x600.jpg" alt="Card image cap">
                            <div class="card-body ">
                                <h5 class="card-title text-center">Adidas</h5>
                                <p class="card-text text-center">Seri A</p>
                                <a href="#" class="btn btn-primary d-flex justify-content-center">View</a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card w-100" style="height: 600px">
                            <img class="card-img-top h-75" src="https://cdn.tgdd.vn/Products/Images/42/114110/iphone-8-plus-hh-600x600-600x600.jpg" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title text-center">Puma</h5>
                                <p class="card-text text-center">La Liga</p>
                                <a href="#" class="btn btn-primary d-flex justify-content-center">View</a>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon bg-success" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon bg-success" aria-hidden="true"></span>
                    <span class="sr-only text-primary">Next</span>
                </a>
            </div>
        </div>
    </jsp:body>
</t:main>
