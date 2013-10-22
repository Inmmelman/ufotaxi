<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class User_model extends CI_Model {
    public function __construct()
    {
        parent::__construct();
    }
    function login($login,$password)
    {

        $this->db->where("email",$login);
        $this->db->or_where("phone",$login);
        $this->db->where("password",$password);

        $query=$this->db->get("users");

        if($query->num_rows()>0)
        {
            foreach($query->result() as $rows)
            {
                $newdata = array(
                    'user_id'  => $rows->id,
                    'user_phone'  => $rows->phone,
                    'user_email'    => $rows->email,
                    'user-group'    => $rows->user_group,
                    'logged_in'  => TRUE,
                );
            }
            $this->session->set_userdata($newdata);
            return true;
        }
        return false;
    }
    public function add_user()
    {
        $data = array(
            'phone'=>$this->input->post('user-phone'),
            'email'=>$this->input->post('user-email'),
            'password'=>md5($this->input->post('password')),
            'user_group'=> 2
        );

        $this->db->insert('users',$data);
    }
    public function get_user($userPhone){
        $this->db->select('name,id,phone');
        $this->db->like('phone', $userPhone);
        $usersArray = $this->db->get('users');

        return $usersArray;
    }
}
?>