<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body style="background: url('bag.jpg') no-repeat center center fixed; background-size: cover;">
    
    <div class="login-container">
        <div class="login-image">
            <img src="https://media.istockphoto.com/id/1136422297/photo/face-cream-serum-lotion-moisturizer-and-sea-salt-among-bamboo-leaves.jpg?s=2048x2048&w=is&k=20&c=z6udAz2awGU8VK_5LKKuM6e6lKOniWiX3dMSB8gdRB0=" alt="Illustration" width="700" height="1000">
        </div>
        <div class="login-form">
            <h1>WELCOME</h1>
            <form id="login-form">
                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Username" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Password" required>
                </div>
                <div class="input-group">
                    <button type="button" id="login-button" class="btn">Login</button>
                </div>
                <div class="register-link">
                    <p>Don't have an account? <a href="r.jsp" class="text-white">Register</a></p>
                </div>
            </form>
        </div>
    </div>
    <script>
        document.getElementById('login-button').addEventListener('click', function() {
            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value.trim();

            // You can validate against dynamic credentials here (example)
            // This is just for demonstration, replace with your actual validation logic
            if (username !== '' && password !== '') {
                // Assuming here that you have some logic to validate the credentials
                // For example, you could send an AJAX request to your server to validate
                // the username and password against your database.
                // For demo purposes, we'll just redirect to ing.html if any username and password are entered.
                alert('Logged in successfully');
                window.location.href = 'ing.html';
            } else {
                alert('Invalid Login');
            }
        });
    </script>
</body>
</html>
