<%@ tag pageEncoding="utf-8" %>
<%@attribute name="css" fragment="true" required="false" %>
<%@attribute name="js" fragment="true" required="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Register</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/main.css">
    <style>
        body {
            height: 100vh;
            background-image: url('https://assets.theedgemarkets.com/CC8_PropertiesAuction_TEM1360_20210309141323_theedgemarkets.jpg?s4zjV1d2tX8f3s3TAw4hfjvyDyJM21mP');
            background-size: 100%;
        }
        form {
            width: 35%;
            padding: 25px 0;
        }
    </style>
    <jsp:invoke fragment="css"/>
</head>
<body>
    <div class="">
        <a href="${pageContext.request.contextPath}/Home">
        <img src="https://www.seekpng.com/png/full/334-3345030_ta-logo-time-auction-logo.png" class="img-fluid rounded-top" alt="Logo" style=" width:140px ;height: 70px">
        </a>
    </div>
    <div class="container-fluid h-100">
        <div class="row h-100 align-items-center">
            <div class="col-sm-12">
                <jsp:doBody/>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/public/js/validator.js"></script>
    <jsp:invoke fragment="js"/>
</body>
</html>