<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:account>
    <jsp:attribute name="js">
        <script>
            // Forgot password form
            $('#formRegister').on('submit', function (e) {
                e.preventDefault();
                Validator({
                    form: '#formForgot',
                    formGroupSelector: '.form-group',
                    errorSelector: '.form-message',
                    rules: [
                        Validator.isRequired('#forgotName', 'Please fill your mail'),
                    ],
                });
                const email = $('#forgotName').val();
                const otp = $('#forgotOTP').val();
                $.getJSON('${pageContext.request.contextPath}/Account/IsAvailable?email=' + email, function (data) {
                    if (data === false) {
                        $.getJSON('${pageContext.request.contextPath}/Account/SendOTP?email=' + email+'&otp=' +otp, function (otpData) {
                            if (otpData === false) {
                                alert('Wrong OTP');
                            } else {
                                $('#formForgot').off('submit').submit();
                                alert('Password Reset Successfully');
                            }
                        });
                    } else {
                        alert('Email is not available.');
                    }
                });
            });

            $('#btnOTP').on('click', function () {
                if ($('#forgotName').val() == 0)
                {
                    alert('Please fill your email')
                } else {
                    const otp = $('#forgotOTP').val();
                    const email = $('#forgotName').val();
                    $.getJSON('${pageContext.request.contextPath}/Account/SendOTP?email=' + email+'&otp=' +otp, function (data) {
                        if (data === false) {
                            alert('Please send OTP email again.');
                        } else alert('OTP has been send to your email');
                    });
                }
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <form action="" method="post" class=" mx-auto shadow rounded-lg bg-white " id="formForgot">
            <!-- Logo -->
            <div class="text-center mb-3">
                <h3>Forgot Password</h3>
            </div>

            <!-- Email-->
            <div class="form-group justify-content-center d-flex">
                <div class="justify-content-center d-flex">
                    <input type="text" placeholder="Email" name="email" class="form-control mr-1 " style="width: 240px" id="forgotName">
                    <button type="button" name="button" class="btn btn-info p-0" style="width: 80px" id="btnOTP">Send OTP</button>
                </div>
            <span class="form-message" style="margin-right: 215px;"></span>
            </div>

            <%--OTP input--%>
            <div class="form-group justify-content-center d-flex">
                <input type="text" placeholder="OTP" name="otp" class="form-control" style="width: 240px; margin-right: 80px" id="forgotOTP">
                <span class="form-message" style="margin-right: 215px;"></span>
            </div>

            <!-- Button send forgot password request -->
            <div class="text-center">
                <button type="submit" class="btn btn-info w-75" name="button" value="btnForgot">Send password reset email</button>
            </div>

            <hr class="w-75 mx-auto bg-info">
            <!-- Back to login page -->
            <div class="text-center">
                <a class="btn btn-outline-info" href="${pageContext.request.contextPath}/Account/Login" role="button">
                    <i class="fa fa-arrow-left mr-3" aria-hidden="true"></i>
                    Back to login page
                </a>
            </div>
        </form>
    </jsp:body>
</t:account>
