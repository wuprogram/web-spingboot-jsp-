<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
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
            height: 150vh;
        }

        .updateProfile {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .updateProfile h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .updateProfile form {
            display: flex;
            flex-direction: column;
        }

        .updateProfile label {
            margin-bottom: 5px;
        }
        
        .updateProfile .gender-labels {
            display: flex;
            justify-content: space-between; /* 让标签之间的间距自动分配 */
        }

        .updateProfile .gender-labels label {
            flex: 1; /* 让标签占据父容器的相同宽度 */
        }
        
        .updateProfile input,
        .updateProfile select {
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }

        .updateProfile input {
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }

        .updateProfile button {
            padding: 10px;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }

        .updateProfile button:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>
<div class=updateProfile>
    <h2>个人信息修改</h2>

    <!-- Display profile update form -->
    <form action="/updateProfile" method="post" onsubmit="return validateForm()">
        <label for="username">用户名:</label>
        <input type="text" id="username" name="username" value="${username}" onblur="checkUsername()">
        <span id="usernameError" style="color: red;"></span>
        
         <input type="hidden" id="id" name="id" value="${id}" readonly>    
        <label for="displayId">编号</label>
        <input type="text" id="displayId" value="${id}" readonly>
        
        <div class = "gender-labels">
        <input type="radio" id="male" name="gender" value="男">
  		<label for="male">男</label><br>
  		<input type="radio" id="female" name="gender" value="女">
  		<label for="female">女</label><br>
  		</div>

        <label for="password">密码:</label>
        <input type="password" id="password" name="password" placeholder="密码必须由大小写字母和数字组成，且至少为六位数" >
        <label for="password">确认密码:</label>
        <input type="password" id="confirmPassword" name="confirmPassword"  placeholder="密码必须由大小写字母和数字组成，且至少为六位数" >
        

        <label for="email">邮箱:</label>
        <input type="email" id="email" name="email" >

        <label for="realname">真实姓名:</label>
        <input type="text" id="realname" name="realname">

        <label for="phone">电话号码:</label>
        <input type="tel" id="phone" name="phone" pattern="[0-9]{11}" placeholder="请输入11位的电话号码">

        <label for="country">国家:</label>
			<select id="country" name="country" onchange="populateCities()" >
    			<option value="">请选择国家</option>
   				<option value="中国">中国</option>
    			<option value="日本">日本</option>
			</select>

		<label for="city">城市:</label>
			<select id="city" name="city" >
    			<option value="">请选择城市</option>
			</select>

        <label for="address">具体地址:</label>
        <textarea id="address" name="address" ></textarea>

        <button type="submit">更新</button>
    </form>
    </div>

    <!-- Add additional content, links, or messages as needed -->
    <script>
        document.getElementById('username').addEventListener('blur', function() {
            var username = this.value;
            var xhr = new XMLHttpRequest();
            xhr.open('GET', '/checkusername2?username=' + username, true);
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
      <!-- function validateForm() {
        if (!validatePassword()) {
            return false;
        }

        if (!validateAddress()) {
            return false;
        }

        return true;
    }  -->
    
    	
    <script>
    function validateForm() {
    	
        // 检查密码是否为空
        var password = document.getElementById("password").value;
        if (password.trim() !== '') {
            if (!validatePassword()) {
                return false;
            }
        }

        // 检查验证密码是否为空
        var confirmPassword = document.getElementById("confirmPassword").value;
        if (confirmPassword.trim() !== '') {
            if (!validateConfirmPassword()) {
                return false;
            }
        }

        // 检查地址是否为空
         if (!validateAddress()) {
                return false;
            }
        

        return true;
    }  
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
    
    <script >
    function validateConfirmPassword() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;

        // 密码长度至少为6位，包含大小写字母和数字
         var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;

        if (!passwordPattern.test(confirmPassword)) {
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
    
    <script>
    function validateAddress() {
    	var country = document.getElementById("country").value;
		var city = document.getElementById("city").value;
		var address = document.getElementById("address").value;

		if(country !== '' ){
			if(address.trim() == ''){
				return false;
			}else{
				// 合并国家、城市和地址
				var fullAddress = country  + city  + address;
				// 更新地址字段的值
				document.getElementById("address").value = fullAddress;
			
				// 返回true以继续表单提交
				return true;
			}
		}else if(country == '' ){
			if(address.trim() !== ''){
				return false;
			}else{
				return true;
			}
		}else{
			return true;
		}
		
    }
    
    </script>
    <script>
    function populateCities() {
        var countrySelect = document.getElementById("country");
        var citySelect = document.getElementById("city");

        // 清除旧的城市选项
        citySelect.innerHTML = "";

        // 获取选定的国家值
        var country = countrySelect.value;

        // 根据国家加载相应的城市选项
        if (country === "中国") {
            var cities = ["北京", "上海", "广州", "深圳", "杭州"];
        } else if (country === "日本") {
            var cities = ["东京", "横滨", "川崎", "大阪", "京都"];
        } else {
            var cities = [];
        }

        // 添加新的城市选项
        cities.forEach(function(city) {
            var option = document.createElement("option");
            option.text = city;
            option.value = city;
            citySelect.appendChild(option);
        });
    }
	</script>

</body>
</html>