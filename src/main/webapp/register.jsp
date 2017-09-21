<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--Bootstrap 使用到的某些 HTML 元素和 CSS 属性需要将页面设置为 HTML5 文档类型。--%>
<%
    String path = request.getContextPath();
%>
<html lang="zh-CN">
<head>
    <title>注册界面</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--引入jquery的js--%>
    <script src=" plugins/jquery-3.2.1.min.js"></script>
    <%--引入bootstrap的js--%>
    <script src="plugins/bootstrap.min.js"></script>
    <%--引入bootstrap的css--%>
    <link rel="stylesheet" type="text/css" href="plugins/bootstrap.min.css">
    <style type="text/css">
        body{
            background-image: url("imgs/login_background.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }
        #a{
            background-color: #5e5e5e;
            padding-top: 2%;
            margin: 0 auto;
        }
        #aa{

        }
        label{
            color: #cccccc;
        }
    </style>
</head>
<body>
<div class="row" id="aa" style="padding-top: 10%">
    <div class="col-md-4"></div>
    <div id="a" class="col-md-4">
        <form action="<%=path%>/user/register" method="post">
            <div class="form-group">
                <label for="InputUsername">用户名</label><input type="text" class="form-control" id="InputUsername" name="username" placeholder="请输入名字">
            </div>
            <div class="form-group">
                <label for="InputEmail">Email</label><input type="email" class="form-control" id="InputEmail" name="email" placeholder="请输入邮箱账号"/>
            </div>
            <div class="form-group">
                <label for="InputPasswordone">密码</label><input type="password" class="form-control" id="InputPasswordone" name="password1" placeholder="请输入密码"><br>
            </div>
            <div class="form-group">
                <label for="InputPasswordtwo">确认密码</label><input type="password" class="form-control" id="InputPasswordtwo" name="password2" placeholder="请再次输入密码"><br>
            </div>
            <div class="checkbox">
                <label for="InputVerificationCode">验证码</label><br>
                <input type="text" class="form-group-lg" id="InputVerificationCode" name="verificationCode" placeholder="请输入图片中的验证码">
                <img src="imgs/code.png" alt="1234">
            </div>
            <button type="submit" class="center-block btn-primary">注册</button>
        </form>
    </div>
    <div class="col-md-4"></div>
</div>
</body>
</html>
