<%--
  Created by IntelliJ IDEA.
  User: johnn
  Date: 2023-06-24
  Time: 오전 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/jsp/template/common2.jsp" flush="true"></jsp:include>
<script type="text/javascript" src="<c:url value='/js/kendoui/jquery.min.js'/>"></script>
<script type="text/javascript" src="/js/project/login/login.js?v=2"></script>
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
    input[type=submit], .submit{
        background-color: #8aa1a1;
        border:none;
        color:white;
        border-radius: 5px;
        width:100%;
        height:35px;
        font-size: 14pt;
        margin-top:100px;
    }
    .submit:link {
        color: red;
        text-decoration: none;
    }
    .submit:hover {
        text-decoration: none;
        color: white;
        background-color: #758b8b;
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
    <form:form name="loginForm" method="post" action="#LINK">
        <div class="input-box">
            <input id="id" type="text" name="id" placeholder="아이디">
            <label for="id">아이디</label>
        </div>

        <div class="input-box">
            <input id="password" type="password" name="password" placeholder="비밀번호">
            <label for="password">비밀번호</label>
        </div>
        <div id="forgot">비밀번호 찾기</div>
        <%--<input type="submit" value="로그인">--%>
        <a href="#" onclick="actionLogin()" type="button" class="submit" title="">로그인</a>
    </form:form>
</div>


</body>
</html>
<script>
    //login.default();
    $(function(){
        var key = getCookie("key");
        if(key != null && key != ""){
            $("#id").val(key);
            $("#password").val(key);
        }

        $("#id").on("keydown", function(key){
            if(key.keyCode == 13){
                actionLogin();
            }
        });
        $("#password").on("keydown", function(key){
            if(key.keyCode == 13){
                actionLogin();
            }
        });
    });

    var idChk = 0;
    function actionLogin(){
        if ($("#id").val() ==""){
            alert("아이디를 입력하세요");
            return false;
        } else if ($("#password").val() =="") {
            alert("비밀번호를 입력하세요");
            return false;
        }
        var data = {
            id : $("#id").val(),
            password : $('#password').val(),
        }
        console.log(data);
        $.ajax({
            url : "<c:url value='/loginCheck'/>",
            type : "post",
            data : data,
            dataType : "json",
            async: false,
            success:function(data){
                console.log(data);
                if(parseInt(data.cnt) == 0) {
                    alert(data.message);
                }else if (parseInt(data.cnt) == 1) {
                    alert(data.message);
                }else {
                    document.loginForm.action="<c:url value='/loginAccess.do'/>";
                    document.loginForm.submit();
                }
            },
            error:function(error){
                alert("아이디를 다시 입력해 주세요");
            }
        });

    }


    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if (start != -1) { // 쿠키가 존재하면
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정
                end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }

    function setCookie(cookieName, value, exdays) {
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value)
            + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }

    function deleteCookie(cookieName) {
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires="
            + expireDate.toGMTString();
    }
</script>
