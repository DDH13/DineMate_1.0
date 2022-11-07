<?php
session_start();
?>
<html>
<head>
    <title>My Page</title>
    <style>
        body {
            background-color: darkgoldenrod;
            color: #ffffff;
        }
        .signup, .login {
            background-color: #ffffff;
            color: #000000;
            width: fit-content;
            padding: 10px;
            margin: 30px;
            border-radius: 10px;
        }
        .login{
            float: right;
        }
        .signup{
            float: left;
        }

        input{
            display: block;
            margin: 10px;
            padding: 10px;
            border-radius: 10px;
        }
    </style>
</head>

<body> 
<div class = "header">
    <?php
            if(isset($_SESSION['username'])){
                echo "<h1>Welcome, " . $_SESSION['username'] . "</h1>";
                echo "<a href='includes/auth/logout.inc.php'>Logout</a>";
            }
            else{
                echo "<h1>Welcome, Guest</h1>";
            }
            ?>
</div>
<?php
if(!isset($_SESSION['username'])){?>  

<div class="signup">
    <h2> Register </h2>
    <form action="includes/auth/signup.inc.php" method="post">
        <input type="text" name="username" placeholder="Username" />
        <input type="password" name="pwd" placeholder="Password" />
        <input type= "password" name="pwdrepeat" placeholder="Repeat Password" />
        <input type = "text" name = "email" placeholder = "Email" />
        <button type="submit" name="submit">Sign Up</button>
    </form>
</div>
<br>

  
    <div class="login">
        <h2> Login </h2>
        <form action = "includes/auth/login.inc.php" method="POST">
            <input type="text" name="username" placeholder="Username" />
            <input type="password" name="pwd" placeholder="Password" />
            <button type="submit" name="submit">Login</button>
        </form>
    </div>
<?php } ?>

</body>

</html>