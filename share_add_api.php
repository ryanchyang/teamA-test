<?php

require __DIR__. '/parts/__connect_db.php';

$output = [
    'success' => 0,
    'code' => 0,
    'error' => '',
    'files' => [],
];

$upload_folder = __DIR__. '/pic/product';

$exts = [
    'image/jpeg' => '.jpg',
    'image/png' => '.png',
    'image/gif' => '.gif',
];

$share_id = isset($_POST['share_id']) ? intval($_POST['share_id']) : 0;
if(empty($share_id)) {
    $output['code'] = 400;
    $output['error'] = '沒有 share_item_id';
    echo json_encode($output, JSON_UNESCAPED_UNICODE); exit;
}

$title = $_POST['title'] ?? '';
$pics = $_FILES['pics'] ?? '';
$desc = $_POST['desc'] ?? '';
$htags = $_POST['htags'] ?? ''; //array



// TODO: 檢查欄位資料
if(empty($title)) {
    $output['code'] = 401;
    $output['error'] = '請輸入正確標題';
    echo json_encode($output, JSON_UNESCAPED_UNICODE); exit;
}
if(empty($pics)) {
    $output['code'] = 403;
    $output['error'] = '請上傳照片';
    echo json_encode($output, JSON_UNESCAPED_UNICODE); exit;
}
if(empty($desc)) {
    $output['code'] = 405;
    $output['error'] = '請輸入敘述';
    echo json_encode($output, JSON_UNESCAPED_UNICODE); exit;
}

// TODO: 照片路徑

if(! empty($pics) and !empty($pics['name'])){
  
    foreach($pics['name'] as $i => $name){
      $ext = $exts[$pics['type'][$i]] ?? ''; //拿到對應的副檔名
  
    if(! empty($ext)){
      $filename = sha1($name.rand()).$ext;
  
      $target = $upload_folder .'/'. $filename;
  
      if(move_uploaded_file($pics['tmp_name'][$i],$target)){
        $output['success'] ++;
        $output['files'][]= $filename; //push 圖檔位置進去
      } else {
        $output['error']= '無法移動檔案';
      }
    }else {
      $output['error']= '檔案格式不對';
    }
  
    };}
    
    // $ext = $exts[$pic['type']] ?? '';  // 拿到對應的副檔名
    // if(! empty( $ext )){

    //     $filename = sha1($pic['name']. rand()). $ext;

    //     $target = $upload_folder. '/'. $filename;
    //     if( move_uploaded_file($pic['tmp_name'], $target)){
    //         $output['success'] = true;
    //         $output['filename'] = $filename;
    //         // TODO: 可以將檔案寫入資料表
    //     } else {
    //         $output['error'] = '無法移動檔案';
    //     }

    // } else {
    //     $output['error'] = '不合法的檔案類型';
    // }



 
// TODO: HASHTAG 轉換
if(! empty($htags)){
    $newtags = array_filter($htags, function($tag) {
        return trim($tag) !== "";
    });

    $tagstr = implode(',', $newtags);
} 

$sql = "UPDATE `share_item` SET 
                          `share_title`=?,
                          `share_img`=?,
                          `share_hash`=?,
                          `share_desc`=?,
                          `share_status`=?,
                          `share_date`= NOW()
WHERE `share_item_id`=?";

$stmt = $pdo->prepare($sql);

$stmt->execute([
    $title,
    implode(",", $output['files']) ,
    empty($htags) ? NULL : $tagstr,
    $desc,
    '1',
    $share_id
]);

if($stmt->rowCount()==0){
    $output['error'] = '資料沒有修改';  
} else {
    $output['tags'] = $tagstr;
}

echo json_encode($output, JSON_UNESCAPED_UNICODE);