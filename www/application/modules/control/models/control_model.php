<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Control_model extends CI_Model {
    public function __construct()
    {
        parent::__construct();
    }

    public function addCar($carInfo){
        $this->db->insert('cars',$carInfo);
    }

}
