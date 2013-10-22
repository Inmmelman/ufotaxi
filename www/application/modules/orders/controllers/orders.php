<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Orders extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('order_model');
    }

	public function add()
	{

        $requirementsBits = array(
            'air_conditioning' => 1,
            'child_seat'       => 2,
            'for_smokers'      => 4,
            'ransport_animals' => 8
        );

        $carsRequirements = 0;

        foreach($this->input->post('requirements') as $key => $car_requirement){
            $carsRequirements += $requirementsBits[$key];
        }

        $data = array(
            'from'=>$this->input->post('address-from'),
            'to'=>$this->input->post('address-to'),
            'user'=>$this->input->post('user'),
            'cars_requirements'=> $carsRequirements,
            'rate' => $this->input->post('rates'),
            'arrive_time' => $this->input->post('arrive-time'),
            'status' => 1
        );

        $this->order_model->addOrder($data);

	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */