<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Order_model extends CI_Model {
    public function __construct()
    {
        parent::__construct();
    }

    public function addOrder($data){
        $this->db->insert('orders',$data);
    }

}
?>