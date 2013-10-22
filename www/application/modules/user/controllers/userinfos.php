<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Userinfos extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
        $this->load->library('form_validation');
    }

    public function getUserByPhone(){

        $userPhone = (int)$_GET['term'];
        $userId = 0;

        $usersArray = $this->user_model->get_user($userPhone);
        $usersName = array();

        foreach ($usersArray ->result() as $row)
        {
            $usersName[] = array('label' => $row->phone ." ".$row->name,'value' => $row->id);
        }


        echo json_encode($usersName);
    }
}