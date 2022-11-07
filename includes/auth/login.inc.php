<?php 

// Getting data
if(isset($_POST['submit'])){
    $username = $_POST['username'];
    $pwd = $_POST['pwd'];


    //Instantiate SignupContr class
    include "../../classes/dbh.class.php";
    include "../../classes/auth/login.class.php";
    include "../../classes/auth/login-contr.class.php";
    $login = new Logincontr($username, $pwd);

    $login->LoginUser();
    header('Location: ../../securepage.php');

}