    <div id="footer"></div>
    <script type="text/javascript">
        $(function() {

            //autocomplete
            $(".auto").autocomplete({
                source: "users",
                minLength: 1,
                select: function( event, ui ) {
                    $('#user-id').val(ui.item.user_id);
                    $('#user-name').val(ui.item.user_name)
                }
            });

        });
    </script>
    <ul>
        <li><a href="<?php echo site_url('control'); ?>">Диспетчерская</a></li>
        <li><a href="<?php echo site_url('add-car'); ?>">Доабвить машину</a></li>
        <li><a href="<?php echo site_url('/'); ?>">Главная</a></li>
    </ul>
</div>
</body>
</html>