<?php
class Signup extends Dbh{

    protected function setUser($username, $pwd, $pwdrepeat, $email){
        $sql = "INSERT INTO users (username, user_email, user_pwd) VALUES (?,?,?)";

        $hashedPwd = password_hash($pwd, PASSWORD_DEFAULT);

        $stmt = $this->connect()->prepare($sql);
        if (!$stmt->execute([$username,$email,$hashedPwd])){
            $stmt = null;
            header('Location: ../../index.php?error=stmtfailed');
            exit();
        }
        $stmt = null;
        header('Location: ../../index.php?error=none');
        exit();
    }
    protected function checkUser($username,$email){
        $sql = "SELECT * FROM users WHERE username = ? OR user_email = ?";
        $stmt = $this->connect()->prepare($sql);

        if (!$stmt->execute([$username,$email])){
            $stmt = null;
            header('Location: ../../index.php?error=stmtfailed');
            exit();
        }
        $resultData = true;
        if($stmt->rowCount() > 0){
            $resultData = false;
        }
        else{
            $resultData = true;
        }
        return $resultData;
    }
}