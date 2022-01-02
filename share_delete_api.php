<?php
require __DIR__. '/parts/__connect_db.php';


if(isset($_GET['sid'])){
    $sid = intval($_GET['sid']);
    $pdo->query("DELETE FROM `share_item` WHERE `share_item_id`=$sid");
}

$come_from = $_SERVER['HTTP_REFERER'] ?? 'list.php';

header("Location: $come_from");