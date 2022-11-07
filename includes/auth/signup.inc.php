<?php 

// Getting data
if(isset($_POST['submit'])){
    $username = $_POST['username'];
    $pwd = $_POST['pwd'];
    $pwdrepeat = $_POST['pwdrepeat'];
    $email = $_POST['email'];

    //Instantiate SignupContr class
    include "../../classes/dbh.class.php";
    include "../../classes/auth/signup.class.php";
    include "../../classes/auth/signup-contr.class.php";
    $signup = new SignupContr($username, $pwd, $pwdrepeat, $email);
    //Running error handlers

    $signup->signupUser();
    header('Location: ../../index.php?error=none');
    //Going back to index.php

    


    
}