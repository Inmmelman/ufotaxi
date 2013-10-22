<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Control extends CI_Controller {

    function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->model('control_model');
        $this->load->library('grocery_CRUD');

    }
    public function index()
	{

        if($this->user['user-group'] != 1 ){
            redirect('/');
        }
        $this->grocery_crud->set_table('orders');
        $this->grocery_crud->set_relation('user','users','name');
        $output = $this->grocery_crud->render();

        $list = $this->load->view('order-list', $output , true);

        $this->_loadViews('control',array('orderList' => $list));
	}

    public function addCarForm(){
        $this->_loadViews('add-car-form');
    }

    public function addCar(){

        $carServicesBinary = getBinaryMaskHelper($this->input->post('requirements'));
        $carInfo = array('callsign' => $this->input->post('callsign'),
                        'services' => $carServicesBinary
        );
        $this->control_model->addCar($carInfo);

        redirect('control');
    }

}

