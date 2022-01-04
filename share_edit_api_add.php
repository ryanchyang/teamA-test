<?php

require __DIR__. '/parts/__connect_db.php';

$output = [
    'success' => false,
    'code' => 0,
    'error' => '',
    'dbfilename' =>[],
];


$upload_folder = __DIR__. '/pic/product';
// $share_id = isset($_POST['share_id']) ? intval($_POST['share_id']) : 0;
// if(empty($share_id)) {
//     $output['code'] = 400;
//     $output['error'] = '沒有 share_item_id';
//     echo json_encode($output, JSON_UNESCAPED_UNICODE); exit;
// }

$exts = [
    'image/jpeg' => '.jpg',
    'image/png' => '.png',
    'image/gif' => '.gif',
];

$title = $_POST['title'] ?? '';
$pic = $_FILES['pic'] ?? '';
$desc = $_POST['desc'] ?? '';
$htags = $_POST['htags'] ?? ''; //array
$status = '1';
$filenames = $_FILES['addImg'] ?? '';
$dbfilename = $_POST['dbImg2'] ?? '';    

$filearray = explode( ',', $dbfilename )?? '' ;
$output['filename']=$filenames;



    // TODO: 照片路徑

if(! empty($filenames) and !empty($filenames['name'])){
  
    foreach($filenames['name'] as $i => $name){
      $ext = $exts[$filenames['type'][$i]] ?? ''; //拿到對應的副檔名
  
    if(! empty($ext)){
      $filename = sha1($name.rand()).$ext;
  
      $target = $upload_folder .'/'. $filename;
  
      if(move_uploaded_file($filenames['tmp_name'][$i],$target)){
        $output['success'] ++;
        $output['dbfilename'][]= $filename; //push 圖檔位置進去
      } else {
        $output['error']= '無法移動檔案';
      }
    }else {
      $output['error']= '檔案格式不對';
    }
  
    };}
    
    $finalarray =array_merge($filearray,$output['dbfilename']);
    $output['dbfilename']= $finalarray;

// $filearray = explode( ',', $dbfilename ) ;
// if (($key = array_search($filename, $filearray)) !== false) {
//     unset($filearray[$key]);
// };

// $output['dbfilename']=$filearray;

// $output['pic'] = $pic;
// $output['desc'] = $desc;
// $output['htags'] = $htags;


// // TODO: 檢查欄位資料
// if(empty($title)) {
//     $output['code'] = 401;
//     $output['error'] = '請輸入正確標題';
//     echo json_encode($output, JSON_UNESCAPED_UNICODE); exit;
// }
// if(empty($pic)) {
//     $output['code'] = 403;
//     $output['error'] = '請上傳照片';
//     echo json_encode($output, JSON_UNESCAPED_UNICODE); exit;
// }
// if(empty($desc)) {
//     $output['code'] = 405;
//     $output['error'] = '請輸入敘述';
//     echo json_encode($output, JSON_UNESCAPED_UNICODE); exit;
// }

// // TODO: 照片路徑
// // TODO: HASHTAG 轉換

$sql = "UPDATE `share_item` SET 
                          `share_img`=?
                          
                          
WHERE `share_item_id`=?";

$stmt = $pdo->prepare($sql);

$stmt->execute([
  
    implode(",",$finalarray)?? '',
    1,
]);
$output['success'] = true;

if($stmt->rowCount()==0){
    $output['error'] = '資料沒有修改';
} else {
    $output['success'] = true;
}

echo json_encode($output, JSON_UNESCAPED_UNICODE);