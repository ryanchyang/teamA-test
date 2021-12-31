<?php
require __DIR__ . '/parts/__connect_db.php';
$title = '會員資料';
$pageName = 'member';

$perPage = 5;
$page = isset($_GET['page']) ? intval($_GET['page']) : 1;

if($page<1) {
    header('Location: member_list.php');
    exit;
}//用轉向來解決往前一頁的問題


$t_sql = "SELECT COUNT(1) FROM member";
$totalRows = $pdo->query($t_sql)->fetch(PDO::FETCH_NUM)[0];
$totalPages = ceil($totalRows / $perPage);

if($page>$totalPages) {
    header('Location: member_list.php?page='. $totalPages);
    exit;
}//用轉向來解決往後一頁的問題

$sql = sprintf("SELECT * FROM member LIMIT %s, %s", ($page-1)*$perPage, $perPage); 
$rows = $pdo->query($sql)->fetchAll();


?>
<?php include __DIR__ . '/parts/__html_head.php' ?>
<?php include __DIR__ . '/parts/__navbar.php' ?>
<div class="container">
    <div class="row">
        <div class="col">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item <?= 1==$page ? 'disabled' : '' ?>">
                        <a class="page-link" href="?page=<?= $page-1 ?>">
                            <i class="fas fa-arrow-left"></i>
                        </a>
                    </li>

                    <?php for($i=$page-2; $i<=$page+2; $i++):
                         if($i>=1 && $i<=$totalPages): ?>
                    <li class="page-item <?= $i==$page ? 'active' : '' ?>">
                        <a class="page-link" href="?page=<?= $i ?>"><?= $i ?></a>
                    </li>
                    <?php endif;
                    endfor; ?>
                    
                    <li class="page-item <?= $totalPages==$page ? 'disabled' : '' ?>">
                        <a class="page-link" href="?page=<?= $page+1 ?>">
                            <i class="fas fa-arrow-right"></i>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <table class="table table-striped table-bordered" style="table-layout:auto;">
        <thead>
            <tr>
                <th scope="col">登入帳號</th>
                <th scope="col">姓名</th>
                <th scope="col">等級</th>
                <th scope="col">點數</th>
                <th scope="col">會員總積分</th>
                <th scope="col">手機</th>
                <th scope="col">地址</th>
                <th scope="col">郵件</th>
                <th scope="col">生日</th>
                <th scope="col">會員收藏</th>

            </tr>
        </thead>
        <tbody>
            <?php foreach ($rows as $r) : ?>
                <tr>
                    <td><?= $r['member_account'] ?></td>
                    <td><?= $r['member_name'] ?></td>
                    <td><?= $r['member_level'] ?></td>
                    <td><?= $r['member_credit'] ?></td>
                    <td><?= $r['member_total_credit'] ?></td>
                    <td><?= $r['member_mobile'] ?></td>
                    <td><?= $r['member_address'] ?></td>
                    <td><?= $r['member_email'] ?></td>
                    <td><?= $r['member_birthday'] ?></td>
                    <td><?= $r['member_shares'] ?></td>
                </tr>
            <?php endforeach; ?>

        </tbody>

    </table>



</div>
<?php include __DIR__ . '/parts/__scripts.php' ?>
<?php include __DIR__ . '/parts/__html_foot.php' ?>