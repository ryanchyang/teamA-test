<?php
require __DIR__ . '/parts/__connect_db.php';

$sql = " SELECT `c_product_name`, `c_product_img_path`
FROM `classic_product` cp
JOIN `classic_orders` co 
ON cp.`c_product_id` = co.`product_id`
JOIN `cart` c 
ON co.`member_id`= c.`cart_member_id`
WHERE c.`cart_status`='3'    
AND co.`member_id`=1 AND cp.`c_product_category` != 'bx' ";
$rows = $pdo->query($sql)->fetchAll();


?>
<?php include __DIR__ . '/parts/__html_head.php' ?>
<?php include __DIR__ . '/parts/__navbar.php' ?>


<div class="container">
  <div class="row justify-content-center">
    <div class="col-lg-6">

      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">會員ID</th>
           
          </tr>
        </thead>
        <tbody>
        
          <?php foreach($rows as $row): ?>
          
          <tr>
            <th scope="row"><?= $row['c_product_name'];?></th>
            <th scope="row"><img src=" <?= $row['c_product_img_path'];?>" alt="" style="width:100px;"> </th>       
            <th scope="row"><?= $row['share_status'] = '1' ? "已分享" : "未分享";?></th>
          </tr>
          <?php endforeach; ?>
        </tbody>

      </table>
    </div>
  </div>
</div>


<?php include __DIR__ . '/parts/__scripts.php' ?>
<?php include __DIR__ . '/parts/__html_foot.php' ?>