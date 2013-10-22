<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Main extends CI_Controller {

	public function index()
	{
        $data['header'] = "assaassa";
        $data['page'] = 'main';
        $data['module'] = 'welcome';
        $this->load->view($this->_container,$data);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */