<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Control extends CI_Controller {

	public function index()
	{

        if($this->user['user-group'] != 1 ){
            redirect('/');
        }

        $list = $this->load->view('order-list', '', true);
        $this->_loadViews('control',array('orderList' => $list));
	}
}

