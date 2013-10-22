<div>
    <?php echo form_open("control/addCar"); ?>
    <input type="text" name="callsign">
    кондишин    <input type="checkbox" name="requirements[air_conditioning]">
    десткое кресло <input type="checkbox" name="requirements[child_seat]">
    курящих<input type="checkbox" name="requirements[for_smokers]">
    транспортировка животных<input type="checkbox" name="requirements[transport_animals]">
    <input type="submit" value="add">
    <?php echo form_close();?>
</div>