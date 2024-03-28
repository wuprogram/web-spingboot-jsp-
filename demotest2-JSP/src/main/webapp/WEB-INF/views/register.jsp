<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册界面</title>
    <!-- Add your stylesheets and scripts here -->
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

        .register {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .register h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .register form {
            display: flex;
            flex-direction: column;
        }

        .register label {
            margin-bottom: 5px;
        }

        .register input {
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }

        .register button {
            padding: 10px;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }

        .register button:hover {
            background-color: #0056b3;
        }

    </style>
    
</head>
<body>
    

<div class="register">
<h2>注册界面</h2>
    <!-- Display registration form -->
    <form action="/register" method="post" onsubmit="return validatePassword()">
        <label for="username">*用户名:</label>
        <input type="text" id="username" name="username" required onblur="checkUsername()">
        <span id="usernameError" style="color: red;"></span>
        
        <input type="radio" id="male" name="gender" value="男">
  		<label for="male">男</label><br>
  		<input type="radio" id="female" name="gender" value="女">
  		<label for="female">女</label><br>

        <label for="password">*密码:</label>
        <input type="password" id="password" name="password"  placeholder="密码必须由大小写字母和数字组成，且至少为六位数" required>
        
        <label for="password">*确认密码:</label>
        <input type="password" id="confirmPassword" name="confirmPassword"  placeholder="密码必须由大小写字母和数字组成，且至少为六位数" required>

        <label for="email">*邮箱:</label>
        <input type="email" id="email" name="email" required>

        <label for="realname">*真实姓名:</label>
        <input type="text" id="realname" name="realname" required>

        <label for="phone">*电话号码:</label>
        <input type="tel" id="phone" name="phone" pattern="[0-9]{11}" placeholder="请输入11位的电话号码" required>

        <label for="address">*地址:</label>
        <textarea id="address" name="address" required></textarea>

        <button type="submit">注册</button>
    </form>
</div>
    <!-- Add additional content, links, or messages as needed -->
    
     <script>
        document.getElementById('username').addEventListener('blur', function() {
            var username = this.value;
            var xhr = new XMLHttpRequest();
            xhr.open('GET', '/checkusername?username=' + username, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    var response = xhr.responseText;
                    if (response === 'exists') {
                        document.getElementById('usernameError').innerText = '用户名已存在';
                    } else {
                        document.getElementById('usernameError').innerText = '';
                    }
                }else {
                    console.error('发生错误：' + xhr.status);
                }
            };
            xhr.send();
        });
    </script>
    <script >
    function validatePassword() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;

        // 密码长度至少为6位，包含大小写字母和数字
         var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;

        if (!passwordPattern.test(password)) {
            alert("密码必须由大小写字母和数字组成，且至少为六位数！");
            return false;
        } 

        // 确认密码是否与登录密码一致
        if (password !== confirmPassword) {
            alert("确认密码与登录密码不一致！");
            return false;
        }

        return true;
    }
    </script>

</body>
</html>
