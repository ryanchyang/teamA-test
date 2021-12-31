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
                            <input type="file" class="form-control" id="pic" name="pic"
                                   value="">
                            <div class="form-text"></div>
                        </div>
                        <div class="mb-3">
                            <label for="desc" class="form-label">敘述</label>                       
                            <textarea id="desc" name="desc" 
                            class="md-textarea form-control" 
                            rows="3"><?= $row['share_desc']?></textarea>
                            <div class="form-text"></div>
                        </div>
                        <div class="mb-3">
                            <fieldset>
                                <legend>標籤</legend>
                                <label for="htage1">#</label>
                                <input id="htage1" name="htage1" value="<?=explode("," ,$row['share_hash'])[0] ?? ''?>" />

                                <label for="htage2">#</label>
                                <input id="htage2" name="htage2" value="<?=explode("," ,$row['share_hash'])[1] ?? ''?>"/>

                                <label for="htage3">#</label>
                                <input id="htage3" name="htage3" value="<?=explode("," ,$row['share_hash'])[2] ?? ''?>"/>
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

    const modal = new bootstrap.Modal(document.querySelector('#exampleModal'));

    const email_re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    const mobile_re = /^09\d{2}-?\d{3}-?\d{3}$/;

    function sendData(){

        name.nextElementSibling.innerHTML = '';
        email.nextElementSibling.innerHTML = '';
        mobile.nextElementSibling.innerHTML = '';

        let isPass = true;
        // 檢查表單的資料
        if(name.value.length < 2){
            isPass = false;
            name.nextElementSibling.innerHTML = '請輸入正確的姓名';

        }
        if(email.value && !email_re.test(email.value)){
            isPass = false;
            email.nextElementSibling.innerHTML = '請輸入正確的email';
        }
        if(mobile.value && !mobile_re.test(mobile.value)){
            isPass = false;
            mobile.nextElementSibling.innerHTML = '請輸入正確的手機號碼';
        }






        if(isPass) {
            const fd = new FormData(document.form1);

            fetch('edit-api.php', {
                method: 'POST',
                body: fd,
            }).then(r => r.json())
                .then(obj => {
                    console.log(obj);
                    if(obj.success){
                        alert('修改成功');
                        // location.href = 'list.php';
                    } else {

                        document.querySelector('.modal-body').innerHTML = obj.error || '資料修改發生錯誤';
                        modal.show();
                    }
                })
        }

    }



</script>
<?php include __DIR__. '/parts/__html_foot.php' ?>