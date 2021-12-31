  <style>
        .navbar-dark .navbar-nav .nav-link.active{
            background-color: darkred;
            margin-right: 4px;
            /* font-size: 12px; */
            border-radius: 5px;
        }
        .navbar-dark .navbar-brand {
            color:whitesmoke;
        }

  </style>
  
  
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand" href="index_cms.php">印食</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link text-white <?= $pageName=='#' ? 'active' : '' ?>" href="#">新聞活動</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white <?= $pageName=='#' ? 'active' : '' ?>" href="#">經典產品</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white <?= $pageName=='#' ? 'active' : '' ?>" href="#">客製化產品</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white <?= $pageName=='#' ? 'active' : '' ?>" href="#">食物材質表</a>
              </li>    
              <li class="nav-item">
                <a class="nav-link text-white <?= $pageName=='#' ? 'active' : '' ?>" href="#">購物車</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white <?= $pageName=='#' ? 'active' : '' ?>" href="#">分享牆</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white <?= $pageName=='#' ? 'active' : '' ?>" href="#">分享牆物件</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white <?= $pageName=='#' ? 'active' : '' ?>" href="#">訂閱分享</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white <?= $pageName=='#' ? 'active' : '' ?>" href="#">訂閱分享中的便當套餐</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white <?= $pageName=='#' ? 'active' : '' ?>"  href="#">新聞活動</a>
              </li>
            
              <li class="nav-item">
                <a class="nav-link text-white <?= $pageName=='member' ? 'active' : '' ?>" href="member_list.php">會員資料</a>
              </li>
              <li class="nav-item log_in">
                <a class="nav-link text-white <?= $pageName=='#' ? 'active' : '' ?>" href="#">登入</a>
              </li>
              <li class="nav-item log_out">
                <a class="nav-link text-white <?= $pageName=='#' ? 'active' : '' ?>" href="#">登出</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>