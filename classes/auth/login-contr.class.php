<?php
class Logincontr extends Login{
    private $username;
    private $pwd;


    public function __construct($username, $pwd){
        $this->username = $username;
        $this->pwd = $pwd;
    }
    
    public function LoginUser(){
        if($this->emptyInput($this->username, $this->pwd) !== false){
            header('Location: ../../index.php?error=emptyinput');
            exit();
        }
        $this->getUser($this->username, $this->pwd);
    }
    
    // Empty Input
    private function emptyInput($username, $pwd){
        $result= true;
        if(empty($username) || empty($pwd)){
            $result = true;
        }
        else{
            $result = false;
        }
        return $result;
    }

}