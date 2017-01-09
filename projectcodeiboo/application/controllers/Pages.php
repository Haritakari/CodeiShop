<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pages extends CI_Controller {
	public function __construct()
	{
		parent::__construct();
	}

	public function view($page= 'home'){
		if (!file_exists(APPPATH.'views/pages/'.$page.'.php')){
			show_404();
		}	

		$usua=Login::getUsuario();
		$data['usuario']=$usua;
		$this->load->view('templates/header', $data);
		$this->load->view('pages/'.$page, $data);
		$this->load->view('templates/footer', $data);
	}
	
}
