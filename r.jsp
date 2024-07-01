<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>
    <link rel="stylesheet" href="styles1.css">
</head>
<body>
    <form action="register.jsp" method="post">
    <div class="signup-container">
        <div class="signup-image">
        </div>
        <div class="signup-form">
            <h1>SIGN UP</h1>
                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="username" required>
                </div>
                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="email address" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="password" required>
                </div>
                <div class="input-group">
                    <label for="cpassword">Confirm Password</label>
                    <input type="password" id="cpassword" name="cpassword" placeholder="confirm password" required>
                </div>
                <div class="nav-links">
                    <button type="submit">Sign Up</button>
                    <p>Already have an account? <a href="login.html" class="text-white">LOGIN</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
