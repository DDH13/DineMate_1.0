<?php
class DishContr extends Dish{

    public function addDish($name, $preptime, $netprice, $sellprice, $description){
        if($this->emptyInput($name, $preptime, $netprice, $sellprice, $description) !== false){
            header('Location: ../../NewDish.php?error=emptyinput');
            exit();
        }
        $this->setDish($name, $preptime, $netprice, $sellprice, $description);
    }
    public function viewDishes(){
        $results = $this->getDishes();
        return $results;
    }

    // Error Handlers
    
    // Empty Input
    private function emptyInput($name, $preptime, $netprice, $sellprice, $description){
        $result= true;
        if(empty($name) || empty($preptime) || empty($netprice) || empty($sellprice) || empty($description)){
            $result = true;
        }
        else{
            $result = false;
        }
        return $result;
    }
}