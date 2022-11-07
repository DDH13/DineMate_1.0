<?php
class Dbh{
    protected function connect(){
        $servername = "localhost";
        $username = "Dineth";
        $password = "1234";
        $dbname = "dinemate";
        $charset = "utf8mb4";

        try{
            $dsn = "mysql:host=".$servername.";dbname=".$dbname.";charset=".$charset;
            $pdo = new PDO($dsn, $username, $password);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $pdo;
        }
        catch(PDOException $e){
            echo "Connection failed: ".$e->getMessage();
        }
    }
}