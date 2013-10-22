<div style="width: 500px; float: left">
    <?php if($this->session->keep_flashdata('order-status')) {
        echo $this->session->keep_flashdata('order-status');
    } ?>
    <?php echo form_open("orders/add"); ?>
        Откуда <input type="text" name="address-from"> <br>
        Куда<input type="text" name="address-to"> <br>

        <input type="hidden" name="user-id" value="" id="user-id">
        Номер телефона <input type='text' name='user-phone' value='' class='auto'> <br>
        Имя <input type="text" name="user-name" id="user-name"> <br>
        Время подачи авто<input type="text" name="arrive-time"> <br>

        Тариф<select name="rates">
                <option value="1">1</option>
                <option value="2">2</option>
             </select>
            <fieldset title="требования">
                Кондишин <input type="checkbox" name="requirements[air_conditioning]">
                Детское кресло <input type="checkbox" name="requirements[child_seat]">
                перевозка животных<input type="checkbox" name="requirements[transport_animals]">
                Для куряих <input type="checkbox" name="requirements[for_smokers]">
            </fieldset>
    Автопоиск <input type="checkbox" name="auto-search">
    <input type="submit" value="Add">
    <input type="button" value="Cancel">
    <?php echo form_close();?>

    <?php echo $orderList; ?>
</div>

<div id="map" style="width: 500px; height: 400px; float: left">

</div>