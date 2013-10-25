<div id="content">
	<a name="top"></a>
	<ul>
		<li><a href="<?php echo site_url('control'); ?>">Диспетчерская</a></li>
		<li><a href="<?php echo site_url('add-car'); ?>">Доабвить машину</a></li>
		<li><a href="<?php echo site_url('/'); ?>">Главная</a></li>
	</ul>
	<?php print (isset($content)) ? $content : NULL; ?>
	<?php
	$this->load->view($page);
	?>
</div>