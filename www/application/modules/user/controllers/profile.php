<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Profile extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
        $this->load->library('form_validation');
    }



    public function index()
    {
        if(($this->session->userdata('user_name') != ""))
        {
            $this->room();
        }
        else{
            $data['title']= 'Фейл';
            $this->_loadViews('form-registration',$data);
        }
    }

    public function login()
    {
        $login = $this->input->post('user-login');
        $password = md5 ($this->input->post('user-password'));
		die('asdas');
        $result = $this->user_model->login($login,$password);
        if ($result) {

            if($result['user-group'] == 1){
                redirect('control');
            }
            $this->user = $result;
            redirect('room');
        }
        else {
            $this->_login_fail();
        }
    }

    protected function _login_fail(){
        $this->_loadViews('login-fail');
    }

    public function room()
    {
        if($this->session->userdata('logged_in')){
            $this->_loadViews('room');
        }else{
            $this->index();
        }
    }

    protected function _callback_validate_phone($phone){
         return preg_match('/^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/', $phone);
    }

    public function registration()
    {

        if($this->input->post('user-email')){
            $this->form_validation->set_rules('user-email', 'Email', 'trim|required|valid_email');

        }elseif($this->input->post('user-phone')){
            $this->form_validation->set_rules('user-phone', 'Телефон', '_callback_validate_phone');
        }

        $this->form_validation->set_rules('user-password', 'Пароль', 'trim|required|min_length[4]|max_length[32]');
        $this->form_validation->set_rules('user-password-re', 'Пароль повтор', 'trim|required|matches[user-password]');

        if($this->form_validation->run() == FALSE)
        {
            $this->index();
        }
        else
        {
            $this->user_model->add_user();
            redirect('/room');
        }
    }

    public function logout()
    {
        $newdata = array('logged_in' => FALSE);
        $this->session->unset_userdata($newdata );
        $this->session->sess_destroy();
        $this->index();
    }

    public function userOrderHistory(){
        $id = $this->user['user_id'];
        $orderList = $this->user_model->getOrderHistoryById($id);

        $this->_loadViews('order-history',array('order_list' => $orderList));
    }

    public function createOrderView(){
        $this->_loadViews('create-order');
    }
}