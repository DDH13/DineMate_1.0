<?php
require_once 'includes/auth/authcheck.inc.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    Hi there this can only be accessed if logged in
    <a href = "index.php"> Go back to index </a>
    <a href = "NewDish.php"> Add a new dish </a>
    <a href = "ViewDishes.php"> View all dishes </a>
</body>
</html>