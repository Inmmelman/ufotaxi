<div id="content">
    <a name="top"></a>
    <?php print (isset($content)) ? $content : NULL; ?>

    <?php
        $this->load->view($page);
    ?>
</div>