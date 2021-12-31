<?php
require __DIR__ . '/parts/__connect_db.php';

$co_sql = " SELECT `c_product_name`, `c_product_img_path`
FROM `classic_product` cp
JOIN `classic_orders` co 
ON cp.`c_product_id` = co.`product_id`
JOIN `cart` c 
ON co.`member_id`= c.`cart_member_id`
WHERE c.`cart_status`='3'    
AND co.`member_id`=1 AND cp.`c_product_category` != 'bx' ";
$co_rows = $pdo->query($co_sql)->fetchAll();

$cuso_sql = " SELECT `cm_product_name`
FROM `customized_product` cusp
JOIN `customized_orders` cuso
ON cusp.`cm_product_id` = cuso.`customed_product_id`
JOIN `cart` c 
ON cuso.`member_id`= c.`cart_member_id`
WHERE c.`cart_status`='3'    
AND cuso.`member_id`=1 ";
$cuso_rows = $pdo->query($cuso_sql)->fetchAll();


?>
<?php include __DIR__ . '/parts/__html_head.php' ?>
<?php include __DIR__ . '/parts/__navbar.php' ?>


<div class="container">
  <div class="row justify-content-center">
    <div class="col-lg-6">

    <div>
      <h2 class="fw-bold py-5">分享產品</h2>
    </div>
      <table class="table table-striped mb-5">
        <thead>
          <tr>
            <th scope="col">經典商品</th>
            <th scope="col"></th>
            <th scope="col"></th>          
          </tr>
        </thead>
        <tbody>
        
          <?php foreach($co_rows as $row): ?>
          
          <tr class=" ">
            <th scope="row" class="py-5 ps-3"><?= $row['c_product_name'];?></th>
            <th scope="row"><img src=" <?= $row['c_product_img_path'];?>" alt="" style="width:100px;"></th>       
            <th scope="row" class="pt-5  text-end"><button  button type="button" class="btn btn-primary ">分享</button><button type="button" class="btn btn-secondary ms-2">刪除</button></th>       
            <!-- <th scope="row"><?= $row['share_status'] = '1' ? "已分享" : "未分享";?></th> -->
          </tr>
          <?php endforeach; ?>
        </tbody>

      </table>

      <table class="table table-striped ">
        <thead>
          <tr>
            <th scope="col">客製化商品</th>
            <th scope="col"></th>
            <th scope="col"></th>          
          </tr>
        </thead>
        <tbody>
        
          <?php foreach($cuso_rows as $row): ?>
          
          <tr class=" ">
            <th scope="row" class="py-5 ps-3"><?= $row['cm_product_name'];?></th>
            <th scope="row" class="pt-5  text-end"><button  button type="button" class="btn btn-primary ">分享</button><button type="button" class="btn btn-secondary ms-2">刪除</button></th>       
            <!-- <th scope="row"><?= $row['share_status'] = '1' ? "已分享" : "未分享";?></th> -->
          </tr>
          <?php endforeach; ?>
        </tbody>

      </table>
    </div>  
  </div>
</div>


<?php include __DIR__ . '/parts/__scripts.php' ?>
<?php include __DIR__ . '/parts/__html_foot.php' ?>