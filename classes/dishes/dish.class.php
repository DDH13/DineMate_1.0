<?php 

class Dish extends Dbh{
    protected function getDish($dishId){
        $sql = "SELECT * FROM dishes WHERE dishId = ?";
        $stmt = $this->connect()->prepare($sql);
        $stmt->execute([$dishId]);
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function getDishes(){
        $sql = "SELECT * FROM dishes";
        $stmt = $this->connect()->prepare($sql);
        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $results;
    }

    protected function setDish($name, $preptime, $netprice, $sellprice, $description){
        $sql = "INSERT INTO dishes (name, prepTime, netPrice, sellingPrice, description) VALUES (?,?,?,?,?)";
        $stmt = $this->connect()->prepare($sql);
        if (!$stmt->execute([$name, $preptime, $netprice, $sellprice, $description])){
            $stmt = null;
            header('Location: ../../NewDish.php?error=stmtfailed');
            exit();
        }
        $stmt = null;
        header('Location: ../../NewDish.php?error=none');
        exit();
    }

}