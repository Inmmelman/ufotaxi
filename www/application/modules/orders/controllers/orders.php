<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Orders extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('order_model');
        $this->load->library('encrypt');
    }

	public function add()
	{
        $userId = 0;

        $carsRequirements = getBinaryMaskHelper($this->input->post('requirements'));

        if($this->input->post('user-id')){
            $userId = $this->encrypt->decode($this->input->post('user-id'));
        }else{
            $userId = $this->order_model->addTemporaryUser($this->input->post('user-name'),
                                                           $this->input->post('user-phone')
                                                          );
        }

        $data = array(
            'from'=> $this->input->post('address-from'),
            'to'=> $this->input->post('address-to'),
            'user'=> $userId,
            'cars_requirements'=> $carsRequirements,
            'rate' => $this->input->post('rates'),
            'arrive_time' => $this->input->post('arrive-time'),
            'status' => 1
        );

        $this->order_model->addOrder($data);
        //$this->session->set_flashdata('order-status', 'Заказ доабвлен' );
        redirect('control');
	}

    public function addQuickOrder(){
        $carsRequirements = getBinaryMaskHelper($this->input->post('requirements'));
        $userId = $this->user['user_id'];

        $data = array(
            'from'=> $this->input->post('address-from'),
            'to'=> $this->input->post('address-to'),
            'user'=> $userId,
            'cars_requirements'=> $carsRequirements,
            'rate' => 1,
            'arrive_time' => $this->input->post('arrive-time'),
            'status' => 3
        );

        $this->order_model->addOrder($data);
        //$this->session->set_flashdata('order-status', 'Заказ доабвлен' );
        redirect('/room');
    }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */