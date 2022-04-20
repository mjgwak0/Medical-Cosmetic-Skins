<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style type="text/css">
        @import url(https://fonts.googleapis.com/css?family=Lato:300,400,700);

        @font-face {
            font-family: 'LeeSeoyun';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2202-2@1.0/LeeSeoyun.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }


        * {
            font-family: 'LeeSeoyun';

        }

        body {
            background-color: #e6e6e6;
            font-size: 100%;
            font-family: "Lato", sans-serif;
            font-weight: 400;
        }

        div,
        textarea,
        input {
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        .container {
            max-width: 500px;
            min-width: 324px;
            margin: 50px auto 0px;
            background-color: #fff;
            border: 1px solid #cfcfcf;
            border-bottom: 3px solid #ccc;
        }

        .row {
            width: 100%;
            margin: 0 0 1em 0;
            padding: 0 2.5em;
        }

        .row.header {
            padding: 1.5em 2.5em;
            border-bottom: 1px solid #ccc;
            background: url(https://images2.imgbox.com/a5/2e/m3lRbCCA_o.jpg) left -80px;
            color: #fff;
        }

        .row.body {
            padding: 0.5em 2.5em 1em;
        }

        .pull-right {
            float: right;
        }

        h1 {
            font-family: "Lato", sans-serif;
            font-weight: 300;
            display: inline-block;
            font-weight: 100;
            font-size: 2.8125em;
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
            margin: 0 0 0.1em 0;
            padding: 0 0 0.4em 0;
        }

        h3 {
            font-family: "Lato", sans-serif;
            font-weight: 400;
            font-size: 1.25em;
            margin: 1em 0 0.4em 0;
        }

        .btn {
            font-size: 1.0625em;
            display: inline-block;
            padding: 0.74em 1.5em;
            margin: 1.5em 0 0;
            color: #fff;
            border-width: 0 0 0 0;
            border-bottom: 5px solid;
            text-transform: uppercase;
            background-color: #b3b3b3;
            border-bottom-color: #8c8c8c;
            font-family: "Lato", sans-serif;
            font-weight: 300;
        }

        .btn:hover {
            background-color: #bfbfbf;
        }

        .btn.btn-submit {
            background-color: #4f6fad;
            border-bottom-color: #374d78;
        }

        .btn.btn-submit:hover {
            background-color: #5f7db6;
        }

        form {
            max-width: 100%;
            display: block;
        }

        form ul {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        form ul li {
            margin: 0 0 0.25em 0;
            clear: both;
            display: inline-block;
            width: 100%;
        }

        form ul li:last-child {
            margin: 0;
        }

        form ul li p {
            margin: 0;
            padding: 0;
            float: left;
        }

        form ul li p.right {
            float: right;
        }

        form ul li .divider {
            margin: 0.5em 0 0.5em 0;
            border: 0;
            height: 1px;
            width: 100%;
            display: block;
            background-color: #4f6fad;
            background-image: linear-gradient(to right, #ee9cb4, #4f6fad);
        }

        form ul li .req {
            color: #ee9cb4;
        }

        form label {
            display: block;
            margin: 0 0 0.5em 0;
            color: #4f6fad;
            font-size: 1.2em;
        }

        form input {
            margin: 0 0 0.5em 0;
            border: 1px solid #ccc;
            padding: 6px 10px;
            color: #555;
            font-size: 1em;
        }

        form textarea {
            border: 1px solid #ccc;
            padding: 6px 10px;
            width: 100%;
            color: #555;
            font-size: 1em;
        }

        form small {
            color: #4f6fad;
            margin: 0 0 0 0.5em;
        }

        @media only screen and (max-width: 480px) {
            .pull-right {
                float: none;
            }

            input {
                width: 100%;
            }

            label {
                width: 100%;
                display: inline-block;
                float: left;
                clear: both;
            }

            li,
            p {
                width: 100%;
            }

            input.btn {
                margin: 1.5em 0 0.5em;
            }
            
            h1 {
                font-size: 2.25em;
            }

            h3 {
                font-size: 1.125em;
            }

            li small {
                display: none;
            }
        }
    </style>

    <title>문의글등록</title>
</head>

<body>
    <div class="container">
        <div class="row header">
            <h1>Product Inquiry &nbsp;</h1>
            <h3>Fill out the form below to learn more!</h3>
        </div>
        <div class="row body">
            <form id="frm" name="frm" method="post" action="/board/updateBoard">
                <ul>
                    <li>
                        <p>
                            <label>글유형</label>
                            <input type="text" name="board_type" value="제품문의" readonly />
                        </p>
                    </li>
                    <li>
                        <p>
                            <label>제목 <span class="req">*</span></label>
                            <input type="text" name="board_title" value="${board.board_title}"/>
                        </p>
                    </li>
                    <li><label for="comments">내용 <span class="req">*</span></label>
                        <textarea cols="46" rows="5" name="board_content">${board.board_content}</textarea>
                    </li>
                    <li>
                        <p>
                            <label>답변상태</label>
                            <input type="text" name="board_state" disabled />
                        </p>
                    </li>
                    <li>
                        <p>
                            <label>회원아이디</label>
                            <input type="text" name="userid" value="${board.userid}" readonly />
                        </p>
                    </li>

                    <li><input class="btn btn-submit" type="submit" onclick="next()" value="Modify" />
                    	<input class="btn btn-submit" type="button" id="delete" onClick="location.href='/board/deleteBoard?boardnum=${board.boardnum}'" value="Delete">
                    </li>

                    <input type="hidden" name="board_name" value="${board.board_name}" />
                    <input type="hidden" name="pronum" value="${board.pronum}" />
                    <input type="hidden" name="boardnum" value="${board.boardnum}" />
                    

                </ul>
            </form>
        </div>
    </div>
    <script type='text/javascript'>
        function next() {
            alert("등록되었습니다.")
        }
    </script>
</body></html>