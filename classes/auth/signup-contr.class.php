<?php
class SignupContr extends Signup{
    private $username;
    private $pwd;
    private $pwdrepeat;
    private $email;

    public function __construct($username, $pwd, $pwdrepeat, $email){
        $this->username = $username;
        $this->pwd = $pwd;
        $this->pwdrepeat = $pwdrepeat;
        $this->email = $email;
    }
    
    public function signupUser(){
        if($this->emptyInput($this->username, $this->pwd, $this->pwdrepeat, $this->email) !== false){
            header('Location: ../../index.php?error=emptyinput');
            exit();
        }
        if($this->checkUser($this->username,$this->email) == false){
            header('Location: ../../index.php?error=usernametaken');
            exit();
        }
        if($this->invalidEmail() !== false){
            header('Location: ../../index.php?error=invalidemail');
            exit();
        }
        if($this->pwdMatch() !== false){
            header('Location: ../../index.php?error=passwordsdontmatch');
            exit();
        }
        $this->setUser($this->username, $this->pwd, $this->pwdrepeat, $this->email);

    }


    // Error Handlers
    
    // Empty Input
    private function emptyInput($username, $pwd, $pwdrepeat, $email){
        $result= true;
        if(empty($username) || empty($pwd) || empty($pwdrepeat) || empty($email)){
            $result = true;
        }
        else{
            $result = false;
        }
        return $result;
    }
    // Wrong email
    private function invalidEmail(){
        $result = true;
        if(!filter_var($this->email, FILTER_VALIDATE_EMAIL)){
            $result = true;
        }
        else{
            $result = false;
        }
        return $result;
    }

    // Password doesn't match
    private function pwdMatch(){
        $result = true;
        if($this->pwd !== $this->pwdrepeat){
            $result = true;
        }
        else{
            $result = false;
        }
        return $result;
    }
    // Already exists
    private function uniqueEntry(){
        $result = true;
        if($this->checkUser($this->username, $this->email)){
            $result = true;
        }
        else{
            $result = false;
        }
    }

}