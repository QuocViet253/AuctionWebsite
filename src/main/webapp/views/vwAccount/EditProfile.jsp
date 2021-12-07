<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="authUser" scope="session" type="com.ute.auctionwebapp.beans.User"/>
<t:account>
    <jsp:attribute name="css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>

            $('#formUpdate').on('submit', function (e) {
                e.preventDefault();
                Validator({
                    form: '#formUpdate',
                    formGroupSelector: '.form-group',
                    errorSelector: '.form-message',
                    rules: [
                        Validator.isRequired('#updateName', 'Please fill your full name'),
                        Validator.isRequired('#updateAddress', 'Please fill your address'),
                        Validator.isRequired('#updateEmail', 'Please fill your mail correctly'),
                        Validator.isRequired('#updateDob','Please fill your date of birth'),
                        Validator.isEmail('#updateEmail','Please fill your mail correctly'),
                    ],
                });
                let response = grecaptcha.getResponse();
                const email = $('#updaterEmail').val();
                const otp = $('#updateOTP').val();
                // Check if email exists
                $.getJSON('${pageContext.request.contextPath}/Account/IsAvailable?email=' + email, function (data) {
                    if (data === true) {
                        // Check captcha
                        if(response.length == 0) {
                            alert('Please select the Captcha');
                        } else {
                            // Check OTP
                            $.getJSON('${pageContext.request.contextPath}/Account/SendOTP?email=' + email+'&otp=' +otp, function (otpData) {
                                if (otpData === false) {
                                    alert('Wrong OTP');
                                } else {
                                    $('#formUpdater').off('submit').submit();
                                }
                            });
                        }
                    } else {
                        alert('Email is not available.');
                    }
                });
            });
            // Send OTP to client email
            $('#btnOTP').on('click', function () {
                if ($('#updateEmail').val() == 0)
                {
                    alert('Please fill your email')
                } else {
                    $('#btnOTP').html('<div class="spinner-grow text-info" role="status"> <span class="sr-only">Loading...</span></div>');
                    const otp = $('#updateOTP').val();
                    const email = $('#updateEmail').val();
                    $.getJSON('${pageContext.request.contextPath}/Account/SendOTP?email=' + email+'&otp=' +otp, function (data) {
                        $('#btnOTP').html('Send OTP');
                        if (data === false) {
                            alert('Please send OTP email again.');
                        } else alert('OTP has been send to your email');
                    });
                }
            });

            $('#updateDob').datetimepicker({
                format: 'd/m/Y',
                timepicker: false,
            })

            $('updateName').select();
        </script>
    </jsp:attribute>
    <jsp:body>
        <form class="mx-auto shadow rounded-lg bg-white mt-5 " action="" method="post" id="formUpdate">
            <!-- Logo -->
            <div class="text-center mb-3">
                <h3 class="text-info">EDIT PROFILE</h3>
                <input type="hidden" name="uid" value="${authUser.id}">
            </div>

            <!-- Họ và tên va dob -->
            <div class="form-group d-flex">
                     <input type="text" placeholder="Full name" class="form-control w-75" id="updateName" name="name" value="${authUser.name}">
                <span class="form-message" style="margin-right: 100px;"></span>
            </div>
            <div class="form-group justify-content-center d-flex">
                <input type="text" name="dob" placeholder="Date of birth (dd/mm/yyyy)" class="form-control w-75" id="updateDob" value="${authUser.dob}">
                <span class="form-message" style="margin-right: 160px;"></span>
            </div>

            <div class="form-group justify-content-center d-flex">
                <input type="text" placeholder="Address" class="form-control w-75" id="updateAddress" name="address" value="${authUser.address}">
                <span class="form-message" style="margin-right: 185px;"></span>
            </div>

            <!-- Email, OTP -->
            <div class="form-group justify-content-center d-flex">
                <div class="justify-content-center d-flex">
                    <input type="text" placeholder="Email" name="email" class="form-control mr-1 " style="width: 240px" id="updateEmail" value="${authUser.email}">
                    <button type="button" name="button" class="btn btn-info p-0" style="width: 80px" id="btnOTP">Send OTP</button>
                </div>
                <span class="form-message" style="margin-right: 215px;"></span>
            </div>
            <div class="form-group justify-content-center d-flex">
                <input type="text" placeholder="OTP" name="otp" class="form-control w-75" id="updateOTP">
                <span class="form-message" style="margin-right: 215px;"></span>
            </div>

            <!-- reCaptcha -->
            <div class="form-group justify-content-center d-flex">
                <div class="g-recaptcha" data-sitekey="6LfnC1IdAAAAABU-jCMtW_w5y6dbyCbFHm05XZVZ"></div>
            </div>

            <!-- Button update -->
            <div class="text-center">
                <button type="submit" class="btn btn-info w-75" id="btnUpdate">Update</button>
            </div>

            <div class="text-center mt-3">
                <a class="btn btn-outline-info" id="switchLogin"  href="${pageContext.request.contextPath}/Account/Profile" role="button">
                    Return Profile
                </a>
            </div>
        </form>
    </jsp:body>
</t:account>

