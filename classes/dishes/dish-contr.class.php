<?php
class DishContr extends Dish{

    public function addDish($name, $preptime, $netprice, $sellprice, $description, $image_url){
        if($this->emptyInput($name, $preptime, $netprice, $sellprice) !== false){
            header('Location: /DineMate/NewDish.php?error=emptyinput');
            exit();
        }
        $this->setDish($name, $preptime, $netprice, $sellprice, $description, $image_url);
    }
    public function viewDishes(){
        $results = $this->getDishes();
        return $results;
    }

    // Error Handlers
    
    // Empty Input
    private function emptyInput($name, $preptime, $netprice, $sellprice){
        $result= true;
        if(empty($name) || empty($preptime) || empty($netprice) || empty($sellprice)){
            $result = true;
        }
        else{
            $result = false;
        }
        return $result;
    }
}