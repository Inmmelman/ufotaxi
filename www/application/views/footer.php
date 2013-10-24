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
</div>
</body>
</html>