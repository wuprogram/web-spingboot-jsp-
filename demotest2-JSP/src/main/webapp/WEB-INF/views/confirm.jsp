<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>信息安全验证</title>
    <script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
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

        .confirm {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .confirm h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .confirm form {
            display: flex;
            flex-direction: column;
        }

        .confirm label {
            margin-bottom: 5px;
        }

        .confirm input {
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }

        .confirm button {
            padding: 10px;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }

        .confirm button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="confirm">
    <h2>信息安全验证</h2>
    <form action="/processConfirm" method="post">
        <input type="hidden" id="username" name="username" value="${username}" readonly>
        
        <label for="displayUsername">用户名</label>
        <input type="text" id="displayUsername" value="${username}" readonly>

        <label for="password">密码</label>
        <input type="password" id="password" name="password" required="required">

        <button type="submit">验证</button>
    </form>
</div>
</body>
</html>
