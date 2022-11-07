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
    <?php 
    include "./classes/dbh.class.php";
    include "./classes/dishes/dish.class.php";
    include "./classes/dishes/dish-contr.class.php";

    $dish = new DishContr();
    $results = $dish->viewDishes();
?>

    <table>
        <tr>
            <th>Name</th>
            <th>Preparation Time</th>
            <th>Net Price</th>
            <th>Selling Price</th>
            <th>Description</th>
        </tr>
        <?php foreach($results as $result){ ?>
        <tr>
            <td><?php echo $result['dish_id'];?></td>
            <td><?php echo $result['name']; ?></td>
            <td><?php echo $result['prepTime']; ?></td>
            <td><?php echo $result['netPrice']; ?></td>
            <td><?php echo $result['sellingPrice']; ?></td>
            <td><?php echo $result['description']; ?></td>
        </tr>
        <?php } ?>
    </table>
        
    </body>
</html>

