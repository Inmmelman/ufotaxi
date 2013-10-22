<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Welcome to CodeIgniter</title>

</head>
<body>

<div id="container">
	<div id="body">sadsadsd
    <h1>Вход</h1>
        <?php echo form_open("login"); ?>
            login<input type="text" name="user-login" >
            pass<input type="password" name="user-password" >
            send <input type="submit" value="Login">
        <?php echo form_close();?>
    <h1>Регистрация</h1>
        <?php echo form_open("registration"); ?>
            email<input type="text" name="user-email">
            or phone<input type="phone" name="user-phone">
            pass<input type="password" name="user-password">
            re pass <input type="password" name="user-password-re">
            send <input type="submit" value="Login">
        <?php echo form_close();?>
    <h1>Быстрый заказ</h1>
        <form action="order/quice" method="post">
            address from<input type="text" name="address-from">
            address to<input type="text" name="address-to">
            phone<input type="text" name="phone">
            personal name<input type="text" name="name">
            order<input type="submit" value="order">
        </form>
	</div>

</div>

</body>
</html>