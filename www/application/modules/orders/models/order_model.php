<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Order_model extends CI_Model {
    public function __construct()
    {
        parent::__construct();
    }

    public function addOrder($data){
        $this->db->insert('orders',$data);
    }

    public function addTemporaryUser($userName,$userPhone){
        $this->db->insert('users',array(
                                            'name' =>$userName,
                                            'phone' => $userPhone,
                                            'user_group' => 3
                                            ));
        return $this->db->insert_id();
    }

    public function addCar($carInfo){
        $this->db->insert('cars',$carInfo);
    }

}
