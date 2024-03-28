<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.example.pojo.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .profile {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .profile h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile form {
            display: flex;
            flex-direction: column;
        }

        .profile label {
            margin-bottom: 5px;
        }

        .profile input {
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }

        .profile button {
            padding: 10px;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }

        .profile button:hover {
            background-color: #0056b3;
        }

        .profile p {
            margin-top: 10px;
            text-align: center;
        }

        .profile a {
            color: #007bff;
            text-decoration: none;
        }

        .profile a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <%
        
        User user = (User) request.getAttribute("user");
       
    %>
    <div class="profile" >
        <h2>个人信息展示</h2>

        <div>
            <label>用户名:</label>
            <span><%= user.getUsername() %></span>
        </div>
        
        <div>
            <label>编号:</label>
            <span><%= user.getId() %></span>
        </div>
        
        <div>
            <label>性别:</label>
            <span><%= user.getGender() %></span>
        </div>
        
        <div>
            <label>邮箱:</label>
            <span><%= user.getEmail() %></span>
        </div>

        <div>
            <label>真实姓名:</label>
            <span><%= user.getRealname() %></span>
        </div>

        <div>
            <label>电话号码:</label>
            <span><%= user.getPhone() %></span>
        </div>

        <div>
            <label>地址:</label>
            <span><%= user.getAddress() %></span>
        </div>

        <p>信息有误？<a href="/confirm?username=<%= user.getUsername() %>">立即修改</a></p>

    </div>
</body>
</html>
