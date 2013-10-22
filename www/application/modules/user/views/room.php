<div class="content">
    <h2>Welcome Back, <?php echo $this->session->userdata('user_email'); ?>!</h2>
    <p>This section represents the area that only logged in members can access.</p>
    <ul>
        <li><a href="">Редактировать мои данные</a> </li>
        <li><a href="">Сделать заказ</a> </li>
        <li><a href="<?php echo site_url('/history') ?>">История заказов</a> </li>
    </ul>
    <ul>
        <li><a href="<?php echo site_url("/logout"); ?>" > Выход </a> </li>
    </ul>
</div>