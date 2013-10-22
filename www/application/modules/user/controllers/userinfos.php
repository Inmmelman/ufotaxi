<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Userinfos extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
        $this->load->library('encrypt');
    }

    public function getUserByPhone(){

        $userPhone = (int)$_GET['term'];

        $usersArray = $this->user_model->get_user($userPhone);
        $usersName = array();



        foreach ($usersArray ->result() as $row)
        {
            $_encodeUserId = $this->encrypt->encode($row->id);
            $usersName[] = array('label' => $row->phone ." ".$row->name,'value' => $row->phone, 'user_id' => $_encodeUserId,'user_name' => $row->name);
        }

        echo json_encode($usersName);
    }
}