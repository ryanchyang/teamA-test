<?php
require __DIR__ . '/parts/__connect_db.php';

$co_sql = "SELECT `share_title`, `share_img`
FROM `share_item` s
WHERE s.`share_order_category`='co' AND s.`share_status` = 0
AND s.`member_id`=1";
$co_rows = $pdo->query($co_sql)->fetchAll();

$cuso_sql = "SELECT `share_title`, `share_img`
FROM `share_item` s
WHERE s.`share_order_category`='cuso' AND s.`share_status` = 0  
AND s.`member_id`=1";
$cuso_rows = $pdo->query($cuso_sql)->fetchAll();


?>
<?php include __DIR__ . '/parts/__html_head.php' ?>
<?php include __DIR__ . '/parts/__navbar.php' ?>


<div class="container">
  <div class="row justify-content-center">
    <div class="col-lg-6">

    <div>
      <a href="#">待分享區</a>
      <a href="share_shared.php">已分享區</a>
      <a href="share_preview.php">預覽牆</a>
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
            <th scope="row" class="py-5 ps-3"><?= $row['share_title'];?></th>
            <th scope="row"><img src=" <?= $row['share_img'];?>" alt="" style="width:100px;"></th>       
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
            <th scope="row" class="py-5 ps-3"><?= $row['share_title'];?></th>
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