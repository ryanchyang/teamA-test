<?php
require __DIR__. '/parts/__connect_db.php';

if(!isset($_GET['sid'])) {
    header('Location: share.php');
    exit;
}

$share_id = intval($_GET['sid']);

$row = $pdo->query("SELECT * FROM `share_item` WHERE `share_item_id`=$share_id")->fetch();



if(empty($row)){
    header('Location: share.php');
    exit;
}

?>
<?php include __DIR__. '/parts/__html_head.php' ?>
<?php include __DIR__. '/parts/__navbar.php' ?>
<style>
form .form-text {
  color: red;
}

.img-unit>img {
  width: 100px;

}

.img-unit {
  margin-top: 10px;
  margin-right: 10px;
  position: relative;
}

.del {
  position: absolute;
  top: -20px;
  right: 0px;
  color: #ccc;
}

.my-plus {
  font-size: 3rem;
  color: blue;
  margin-top: 40px;
  margin-left: 30px;
}
</style>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-lg-6">
      <div class="card my-5">
        <div class="card-body py-4">
          <h5 class="card-title">建立你的食物分享</h5>

          <form name="form1" onsubmit="sendData(); return false;">
            <input type="hidden" name="share_id" value="<?= $row['share_item_id'] ?>">
            <div class="mb-3">
              <label for="title" class="form-label">標題</label>
              <input type="text" class="form-control" id="title" name="title"
                value="<?= htmlentities($row['share_title']) ?>">
              <div class="form-text"></div>
            </div>

            <div class="mb-3">
              <label for="pic" class="form-label">照片</label>
              <input type="file" class="form-control visually-hidden" id="pic" name="pics" accept="image/*" multiple
                value="">


              <!-- <form runat="server">
                <input accept="image/*" type='file' id="imgInp" />
                <img id="blah" src="#" alt="your image" />
              </form> -->



              <div class="form-text"></div>
              <div id="imgs" class="d-flex flex-row " data-imgs="<?= $row['share_img'] ?>">

              </div>
            </div>
            <div class="mb-3">
              <label for="desc" class="form-label">敘述</label>
              <textarea id="desc" name="desc" class="md-textarea form-control"
                rows="3"><?= $row['share_desc']?></textarea>
              <div class="form-text"></div>
            </div>
            <div class="mb-3">
              <fieldset id="hashtags">
                <legend>標籤</legend>
                <label>#</label>
                <input id="htag1" name="htags[]" value="<?=explode("," ,$row['share_hash'])[0] ?? ''?>" />

                <label>#</label>
                <input id="htag2" name="htags[]" value="<?=explode("," ,$row['share_hash'])[1] ?? ''?>" />

                <label>#</label>
                <input id="htag3" name="htags[]" value="<?=explode("," ,$row['share_hash'])[2] ?? ''?>" />
              </fieldset>
              <div class="form-text"></div>
            </div>

            <button type="submit" class="btn btn-primary">分享</button>

          </form>
        </div>
      </div>
    </div>
  </div>
</div>


<?php include __DIR__. '/parts/__scripts.php' ?>
<script>
const title = document.querySelector('#title');
const pic = document.querySelector('#pic');
const desc = document.querySelector('#desc');
const imgsDiv = document.querySelector('#imgs');
const hashtags = document.querySelector('#hashtags');
const htag1 = document.querySelector('#htag1');
const htag2 = document.querySelector('#htag2');
const htag3 = document.querySelector('#htag3');

let imgData = [];

// const modal = new bootstrap.Modal(document.querySelector('#exampleModal'));

// const email_re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
// const mobile_re = /^09\d{2}-?\d{3}-?\d{3}$/;
imgData.push(...imgsDiv.dataset.imgs.split(','))
renderImgs();

pic.onchange = evt => {
  const [file] = pic.files
  if (file) {

    addimg.src = URL.createObjectURL(file)
    addimg.closest('.img-unit').classList.remove('visually-hidden')
  }
}



function imgUnitTpl(file) {
  return `<div
        class="img-unit"
        data-file="${file}"
      >
        <img
          src="pic/product/${file}"
          alt=""
        />

        <a href="#"><i class="fas fa-times-circle del"></i></a>
      </div> `;
}

function renderImgs() {
  imgsDiv.innerHTML = ''; // 清空

  for (let i of imgData) {
    imgsDiv.innerHTML += imgUnitTpl(i);
  }

  imgsDiv.innerHTML += `<div
        class="img-unit visually-hidden" >
        <img id="addimg" src="#" alt="your image">
        <a href="#"><i class="fas fa-times-circle del"></i></a>
        </div> `;

  imgsDiv.innerHTML += `<div
        class="img-unit">
        <a href="#" onclick="pic.click()"><i class="fas fa-plus my-plus"></i></a>
        </div>`
}

imgsDiv.addEventListener('click', function(e) {
  const t = e.target;

  if (t.classList.contains('del')) {
    const filename = t.closest('.img-unit')?.dataset.file;
    const dbfiles = imgsDiv.dataset.imgs;
    console.log(filename);
    console.log(dbfiles);
    
     //fetch 
     const fd = new FormData();
     fd.append('dbImg',dbfiles);
     fd.append('deleteImg', filename);

    fetch('share_edit_api_test.php', {
        method: 'POST',
        body: fd,
      }).then(r => r.json())
      .then(obj => {
        console.log(obj);
        if (obj.success) {
          alert('修改成功');
          location.href = 'share.php';
          imgData=[];
          imgData.push(...obj.files);
          renderImgs()

        } else {

          // document.querySelector('.modal-body').innerHTML = obj.error || '資料修改發生錯誤';
          // modal.show();
        }
  }
});



function sendData() {

  // name.nextElementSibling.innerHTML = '';
  // email.nextElementSibling.innerHTML = '';
  // mobile.nextElementSibling.innerHTML = '';

  let isPass = true;
  // 檢查表單的資料
  if (!title.value) {
    isPass = false;
    title.nextElementSibling.innerHTML = '請輸入標題';
  }
  // if (pic.files.length === 0) {
  //   isPass = false;
  //   pic.nextElementSibling.innerHTML = '請上傳照片';
  // }
  if (!desc.value) {
    isPass = false;
    desc.nextElementSibling.innerHTML = '請輸入敘述';
  }
  if (htag1.value.length > 30 || htag2.value.length > 30 || htag3.value.length > 30) {
    isPass = false;
    hashtags.nextElementSibling.innerHTML = '標籤文字過長';
  }

  //         if( document.getElementById("videoUploadFile").files.length == 0 ){
  //     console.log("no files selected");
  // }


  if (isPass) {
    const fd = new FormData(document.form1);

    fetch('share_edit_api.php', {
        method: 'POST',
        body: fd,
      }).then(r => r.json())
      .then(obj => {
        console.log(obj);
        if (obj.success) {
          alert('修改成功');
          location.href = 'share.php';


        } else {

          // document.querySelector('.modal-body').innerHTML = obj.error || '資料修改發生錯誤';
          // modal.show();
        }
      })
  }

}
</script>
<?php include __DIR__. '/parts/__html_foot.php' ?>