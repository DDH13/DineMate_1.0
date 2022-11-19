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
    <style>
        a{
            margin: 10px;
            padding: 10px;
            display: block;
        }
    </style>
</head>

<body>
    <br>
    <h1>Hi there this can only be accessed if logged in</h1>
    <br>
    <a href="index.php"> Go back to index </a>
    <br>
    <a href="./views/dishes/NewDish.php"> Add a new dish </a>
    <br>
    <a href="./views/dishes/ViewDishes.php"> View all dishes </a>

    <?php
    $output = shell_exec('idk.py');
    echo "<div>".$output."</div>";

    ?>

</body>

</html>

