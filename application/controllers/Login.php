<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Login extends CI_Controller {

	public function index()
	{
		$this->load->view('welcome_message');
	}
	public function checkLogin ()
	{
		$this->input->get('numero');
		$this->input->get('idType');

	}
}

