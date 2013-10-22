<div>
    <form action="orders/addQuickOrder" method="post">
        address from<input type="text" name="address-from">
        address to<input type="text" name="address-to">
        Время подачи авто<input type="text" name="arrive-time"> <br>
        <fieldset title="требования">
            Кондишин <input type="checkbox" name="requirements[air_conditioning]">
            Детское кресло <input type="checkbox" name="requirements[child_seat]">
            перевозка животных<input type="checkbox" name="requirements[transport_animals]">
            Для куряих <input type="checkbox" name="requirements[for_smokers]">
        </fieldset>
        <input type="submit" value="order">
    </form>
</div>