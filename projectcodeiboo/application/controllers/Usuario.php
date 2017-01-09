<?php
defined('BASEPATH') OR exit('No direct script access allowed');
	
	class Usuario extends CI_Controller {
		
		public function __construct()
		{
			parent::__construct();
			$this->load->library('templ');
		}
		//PROCEDIMIENTO PARA REGISTRAR UN USUARIO
		public function registro(){
			//si el usuario esta logeado ya no debe registrarse
			if($usua=Login::getUsuario())
				redirect(base_url());
				$this->load->library('form_validation');
			//si no llegan los datos a guardar
			if(empty($_POST['guardar'])){
				
				//mostramos la vista del formulario
				
				if(!empty($usua=Login::getUsuario()));
					$data['usuario']=$usua;
				
				$this->load->view('templates/header', $data);
				$this->load->view('usuario/registro.php', $data);
				$this->load->view('templates/footer', $data);
			
			//si llegan los datos por POST
			}else{
				//crear una instancia de Usuario
				$u = new UsuarioModel();
				
				//tomar los datos que vienen por POST
				$u->nombre = $this->input->post('nombre');
				$u->apellidos =$this->input->post('apellidos');
				$u->telefono = $this->input->post('telefono');
				$u->fecha_nacimiento = $this->input->post('fecha_nacimiento');
				$u->direccion = $this->input->post('direccion');
				$u->dni = $this->input->post('dni');
				$u->email = $this->input->post('email');
				$u->user = $this->input->post('user');
				$u->password = MD5($this->input->post('password'));
				$u->ciudad = $this->input->post('ciudad');
				$u->pais = $this->input->post('pais');
				
				//Validacion por php  
				$this->form_validation->set_rules('nombre','nombre','required|min_length[2]|alpha|max_length[15]');
				$this->form_validation->set_rules('apellidos','apellidos','required|min_length[2]|max_length[40]');
				$this->form_validation->set_rules('telefono','telefono','required|is_natural|min_length[5]|max_length[11]');
				$this->form_validation->set_rules('fecha_nacimiento','Fecha de nacimiento','required|exact_length[10]');
				$this->form_validation->set_rules('direccion','direccion','min_length[2]|max_length[40]');
				$this->form_validation->set_rules('dni','DNI','required|is_unique[usuarios.dni]|alpha_numeric|regex_match[/^[XYZ0-9][0-9]{7}[A-Z]$/i]');
				$this->form_validation->set_rules('email','Correo electronico','required|valid_email');
				$this->form_validation->set_rules('user','user','required|min_length[2]|max_length[10]');
				$this->form_validation->set_rules('password','password','required|min_length[4]|max_length[16]');
				$this->form_validation->set_rules('ciudad','ciudad','required|min_length[2]|alpha|max_length[15]');
				$this->form_validation->set_rules('pais','pais','required|min_length[2]|max_length[15]');
				
				// salta el control de validacion si alguien se salta el de html5 i/o javascript
				if($this->form_validation->run()===FALSE){ 
					
					if(!empty($usua=Login::getUsuario()));
					$data['usuario']=$usua;
					$this->load->view('templates/header', $data);
					$this->load->view('usuario/registro.php', $data);
					$this->load->view('templates/footer', $data);
				}
				else {
				//guardar el usuario en BDD
				
					if(!$u->guardar())
						show_error('No se pudo registrar el usuario',404,'Error en el registro');

					//mostrar la vista de éxito
					
					$data['usuario'] = Login::getUsuario();
					$data['mensaje'] = 'Operación de registro completada con éxito';
					$this->load->view('templates/header', $data);
					$this->load->view('exito', $data);
					$this->load->view('templates/footer', $data);
					
				}
			}
		}
		//*******************************************FALTA POR MIGRAR DEL QUE TENIA ECHO* ********************************
		/*//PROCEDIMIENTO PARA MODIFICAR UN USUARIO
		public function modificacion(){
			//si no hay usuario identificado... error
			if(!Login::getUsuario())
				throw new Exception('Debes estar identificado para poder modificar tus datos');
				
			//si no llegan los datos a modificar
			if(empty($_POST['modificar'])){
				
				//mostramos la vista del formulario
				$datos = array();
				$datos['usuario'] = Login::getUsuario();
				
				$this->load_view('view/usuarios/modificacion.php', $datos);
					
				//si llegan los datos por POST
			}else{
				//recuperar los datos actuales del usuario
				$u = Login::getUsuario();
				
				
				//comprueba que el usuario se valide correctamente
				$p = MD5($_POST['password']);
				if($u->password != $p)
					throw new Exception('El password no coincide, no se puede procesar la modificación');
								
				//recupera el nuevo password (si se desea cambiar)
				if(!empty($_POST['newpassword']))
					$u->password = MD5($_POST['newpassword']);
				
				//recupera el nuevo nombre y el nuevo email
				$u->nombre = $this->input->post('nombre');
				$u->apellidos =$this->input->post('apellidos');
				$u->telefono = $this->input->post('telefono');
				$u->fecha_nacimiento = $this->input->post('fecha_nacimiento');
				$u->direccion = $this->input->post('direccion');
				$u->dni = $this->input->post('dni');
				$u->email = $this->input->post('email');
				$u->user = $this->input->post('user');
				$u->password = MD5($this->input->post('password'));
				$u->ciudad = $this->input->post('ciudad');
				$u->pais = $this->input->post('pais');
			
					
			
				//modificar el usuario en BDD
				if(!$u->actualizar())
					throw new Exception('No se pudo modificar');
		
				//hace de nuevo "login" para actualizar los datos del usuario
				//desde la BDD a la variable de sesión.
				Login::log_in($u->user, $u->password);
					
				//mostrar la vista de éxito
			
				$datos['usuario'] = Login::getUsuario();
				$datos['mensaje'] = 'Modificación OK';
				$this->load_view('view/exito.php', $datos);
			}
		}
		
		
		//PROCEDIMIENTO PARA DAR DE BAJA UN USUARIO
		//solicita confirmación
		public function baja(){		
			//recuperar usuario
			$u = Login::getUsuario();
			
			//asegurarse que el usuario está identificado
			if(!$u) throw new Exception('Debes estar identificado para poder darte de baja');
			
			//si no nos están enviando la conformación de baja
			if(empty($_POST['confirmar'])){	
				//carga el formulario de confirmación
				$datos = array();
				$datos['usuario'] = $u;
				$this->load_view('view/usuarios/baja.php', $datos);
		
			//si nos están enviando la confirmación de baja
			}else{
				//validar password
				$p = MD5(Database::get()->real_escape_string($_POST['password']));
				if($u->password != $p) 
					throw new Exception('El password no coincide, no se puede procesar la baja');
				
				//de borrar el usuario actual en la BDD
				if(!$u->borrar())
					throw new Exception('No se pudo dar de baja');

				//cierra la sesion
				Login::log_out();
					
				//mostrar la vista de éxito
				$datos = array();
				$datos['usuario'] = null;
				$datos['mensaje'] = 'Eliminado OK';
				$this->load_view('view/exito.php', $datos);
			}
		}
		public function ajaxvery(){
			$user = $this->input->post('filtro');
			$usuario = new UsuarioModel;
			$usuario->user = $user;
			$usrequest = $usuario->getUsuario();
			if ($usrequest[0] == NULL){
				return FALSE;
			}
			else {
				return TRUE;
			}
		}*/
	}





