<%--
  Created by IntelliJ IDEA.
  User: johnn
  Date: 2023-06-24
  Time: 오전 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/js/kendoui/jquery.min.js'/>"></script>
<script type="text/javascript" src="/js/project/login/login.js?v=1"></script>
<style>
    .wrapper {
        display: block;
        text-align: center;
        position: absolute;
        left: 50%;
        top: 50%;
        margin-top: -250px;
        margin-left: -250px;
    }
    header{
        display:flex;
        justify-content: center;
    }
    form{
        padding:10px;
    }
    .input-box{
        position:relative;
        margin:10px 0;
    }
    .input-box > input{
        background:transparent;
        border:none;
        border-bottom: solid 1px #ccc;
        padding:20px 0px 5px 0px;
        font-size:14pt;
        width:100%;
    }
    input::placeholder{
        color:transparent;
    }
    input:placeholder-shown + label{
        color:#aaa;
        font-size:14pt;
        top:15px;

    }
    input:focus + label, label{
        color:#8aa1a1;
        font-size:10pt;
        pointer-events: none;
        position: absolute;
        left:0px;
        top:0px;
        transition: all 0.2s ease ;
        -webkit-transition: all 0.2s ease;
        -moz-transition: all 0.2s ease;
        -o-transition: all 0.2s ease;
    }

    input:focus, input:not(:placeholder-shown){
        border-bottom: solid 1px #8aa1a1;
        outline:none;
    }
    input[type=submit]{
        background-color: #8aa1a1;
        border:none;
        color:white;
        border-radius: 5px;
        width:100%;
        height:35px;
        font-size: 14pt;
        margin-top:100px;
    }
    #forgot{
        text-align: right;
        font-size:12pt;
        color:rgb(164, 164, 164);
        margin:10px 0px;
    }
</style>
<html>
<head>
    <meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
</head>
<body>
<div class="wrapper" style="width: 500px; height: 500px;">
    <header>
        <h2>Login</h2>
    </header>
    <form action="<c:url value='/main/loginCheck.do'/>" method="POST">
        <div class="input-box">
            <input id="username" type="text" name="username" placeholder="아이디">
            <label for="username">아이디</label>
        </div>

        <div class="input-box">
            <input id="password" type="password" name="password" placeholder="비밀번호">
            <label for="password">비밀번호</label>
        </div>
        <div id="forgot">비밀번호 찾기</div>
        <input type="submit" value="로그인">
    </form>
</div>


</body>
</html>
<script>
    login.default();
</script>
