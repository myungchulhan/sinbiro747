<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style-signup.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>


</script>
<body>
<div class="panel-body">
    <div class="row">
        <div class="col-lg-12">
            <h4>이용약관</h4>
            <div class="panel-body" style="border: 1px solid #ccc">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        </div>
        </br>
        <h4>개인정보</h4>
        <div class="panel-body" style="border: 1px solid #ccc">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        </div>
        <br/>
        <form role="form" action="/insa/step2" method="POST">
            <div class="form-group">
                <label class="checkbox-inline">
                    <input type="checkbox" name="agree" value="true">동의합니다.
                </label>
            </div>
            <button type="submit" class="btn btn-default">다음 단계</button>
        </form>
    </div>
</div>

</body>
</html>