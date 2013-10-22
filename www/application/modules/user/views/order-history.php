<?php if($order_list): ?>
    <table>
        <tr>
            <td>Откуда</td>
            <td>Куда</td>
            <td>Время отправки</td>
        </tr>
        <?php foreach($order_list as $order):?>
            <tr>
                <td><?php echo $order->from ?></td>
                <td><?php echo $order->to ?></td>
                <td><?php echo $order->arrive_time ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
<?php else:?>
    Список пуст
<?php endif;?>