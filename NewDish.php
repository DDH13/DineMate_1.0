<html <!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>

        </title>
    <style>
        input{
            width: 200px;
            height: 30px;
            margin: 25px;
            padding: 25px;

        }
    </style>
    </head>
    <body>
    <form action = "<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method = "post"enctype="multipart/form-data"> 
        <input type = "text" name = "name" placeholder = "Name">
        <input type = "number" name = "preptime" placeholder = "Preparation Time">
        <input type = "number" name = "netprice" placeholder = "Net Price">
        <input type = "number" name = "sellprice" placeholder = "Selling Price">
        <input type = "text" name = "description" placeholder = "Description">
        
        Select image to upload:
        <input type="file" name="fileToUpload" id="fileToUpload">
    
        <input type = "submit" name = "submit" value = "Save">
    </form>
        
    </body>
</html>

<?php 
include "utils/filehandling.php";
include "./classes/dbh.class.php";
include "./classes/dishes/dish.class.php";
include "./classes/dishes/dish-contr.class.php";


if (isset($_POST['submit'])){
    $name = $_POST['name'];
    $preptime = $_POST['preptime'];
    $netprice = $_POST['netprice'];
    $sellprice = $_POST['sellprice'];
    $description = $_POST['description'];
    $file = $_FILES["fileToUpload"];

    $target_dir = "uploads/";

    if (checkforActualImage($file) && checkforSize($file,5000000) && checkforImage($file)) {

        // Set path to store the uploaded image
        $target_file = getFileName($target_dir, $name, $file);
        
        if (!move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
            echo "Sorry, there was an error uploading your file.";
        }
    }

    $dish = new DishContr();
    $dish->addDish($name, $preptime, $netprice, $sellprice, $description, $target_file);
    header("Location: NewDish.php?success");
}