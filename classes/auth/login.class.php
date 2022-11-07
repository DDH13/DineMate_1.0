<?php
class Login extends Dbh{

    protected function getUser($username, $pwd){

        //Look for passwords matching the username entered
        $sql = "SELECT user_pwd FROM users WHERE username = ?;";

        $stmt = $this->connect()->prepare($sql);
        if (!$stmt->execute([$username])){
            $stmt = null;
            header('Location: ../../index.php?error=stmtfailed');
            exit();
        }

        if($stmt->rowCount() == 0){
            $stmt = null;
            header('Location: ../../index.php?error=usernotfound');
            exit();
        }

        $hashedPwd = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $checkPwd = password_verify($pwd, $hashedPwd[0]['user_pwd']);
        
        if($checkPwd == false){
            $stmt = null;
            header('Location: ../../index.php?error=wrongpwd');
            exit();
        }
        else if($checkPwd == true){

            $stmt = $this->connect()->prepare("SELECT * FROM users WHERE username = ? AND user_pwd =?;");

            if(!$stmt->execute([$username, $hashedPwd[0]['user_pwd']])){
                $stmt = null;
                header('Location: ../../index.php?error=stmtfailed');
                exit();
            }
            if($stmt->rowCount() == 0){
                $stmt = null;
                header('Location: ../../index.php?error=usernotfound');
                exit();
            }
            $user = $stmt->fetchAll(PDO::FETCH_ASSOC);
            session_start();
            $_SESSION['user_id'] = $user[0]['user_id'];
            $_SESSION['username'] = $user[0]['username'];
        }


    }

}