<?php

class User {

    var $id = 0;
    var $logged_in = false;
    var $username = '';
    var $table = 'admin';

    public function __construct() {

        $this->obj = & get_instance();

        $this->_session_to_library();
    }

    function _prep_password($password) {
        // Salt up the hash pipe
        // Encryption key as suffix.

        return $this->obj->encrypt->sha1($password . $this->obj->config->item('encryption_key'));
    }

    function _session_to_library() {
        // Pulls session data into the library.

        $this->id = $this->obj->session->userdata('id');
        $this->username = $this->obj->session->userdata('name');
        $this->logged_in = $this->obj->session->userdata('logged_in');
//		
    }

    function _start_session($user) {
        // $user is an object sent from function login();
        // Let's build an array of data to put in the session.

        $data = array(
            'id' => $user->id,
            'name' => $user->name,
            'logged_in' => true,
            'locked' => 0
        );

        $this->obj->session->set_userdata($data);
//        echo $this->session->userdata('name');die();
        $this->_session_to_library();
    }

    function _destroy_session() {
        $data = array(
            'id' => 0,
            'username' => '',
            'logged_in' => false,
            'locked' => 0
        );

        $this->obj->session->set_userdata($data);

        foreach ($data as $key => $value) {
            $this->$key = $value;
        }
    }

    function login($username, $password) {
//        echo $username;die();
        $query = $this->obj->db->get($this->table);

        // First up, let's query the DB.
        // Prep the password to make sure we get a match.
        // And only allow active members.

        $this->obj->db->where('name', $username);
        $this->obj->db->where('password', md5($password));

        $query = $this->obj->db->get($this->table);
//        echo($this->obj->db->last_query());die();
        if ($query->num_rows() == 1) {

            // We found a user!
            // Let's save some data in their session/cookie/pocket whatever.

            $user = $query->row();
            //print_r ($user);
            $this->_start_session($user);

            $this->obj->session->set_flashdata('user', 'Login successful...');

            return true;
        } else {
            // Login failed...
            // Couldn't find the user,
            // Let's destroy everything just to make sure.

            $this->_destroy_session();

            $this->obj->session->set_flashdata('user', 'Login failed...');

            return false;
        }
    }

    function logout() {
        $this->_destroy_session();
        $this->obj->session->set_flashdata('notification', 'Successfully Logout');
    }

}

?>