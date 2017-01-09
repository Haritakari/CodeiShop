<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {
	public function __construct(){
		parent::__construct();
	}
	public function showPanel(){
		$usua=Login::getUsuario();
		$data['usuario']=$usua;
		$this->load->view('templates/header', $data);
		$this->load->view('admin/frontPanel', $data);
		$this->load->view('templates/footer', $data);
	}
	public function verprodu($p=1,$f=20){
		$this->load->model('productModel');
		
			$producto=new ProductModel();
			$productos=$producto->showAll($p,$f);
			$numpag=$producto->calc_query();
			$numpag=ceil($numpag/$f);
			$usua=Login::getUsuario();
			$data['usuario']=$usua;
			$data['productos']= $productos;
			
			$data['numpag']=$numpag;
			$data['p']=$p;
			$this->load->view('templates/header', $data);
			$this->load->view('admin/gestproduct', $data);
			$this->load->view('templates/footer', $data);
	}
	public function getDealers(){
		$this->load->model('ml_dealer');

		$dealers= New Ml_dealer;
		$listdealers=$dealers->viewAll();
		$data['dealers']=$listdealers;
		$data['usuario']=Login::getUsuario();
		$this->load->view('templates/header', $data);
		$this->load->view('admin/dealers', $data);
		$this->load->view('templates/footer', $data);
	}
	public function updateDeal(){
												//header('Content-Type: application/json'); para json
		$id=$_POST['filtro'];
		$nom=$_POST['nombre'];
		$this->load->model('ml_dealer');
		$dealers= New Ml_dealer;
		if($dealers->modify($id,$nom))
			echo 'Modificado correctamente';
		else
			echo 'Incorrecto no se pudo modificar';
												//echo json_encode($carray);  para json
	}
	public function deleteDeal(){
		$this->load->model('ProductModel');
		$producto= New ProductModel;
		$productos=$producto->getAll();
		$id=$_POST['filtro'];
		foreach ($productos as $key => $value) {
			if($value->id_proveedor == $id)
				die('el proveedor esta vinculado');
		}
		
		$this->load->model('ml_dealer');
		$dealers= New Ml_dealer;
		if($dealers->delete($id))
			echo 'Borrado correctamente';
		else
			echo 'Error al borrar';
												
	}
	public function createDeal(){

		$nom=$_POST['filtro'];
		$this->load->model('ml_dealer');
		$dealers= New Ml_dealer;
		if($id=$dealers->add($nom))
			echo "<span data-newid='$id'>Creado correctamente</span>";
		else
			echo 'Incorrecto no se pudo crear';											
	}
}