<?php
	class Templ{	
		
		//PONE EL FORMULARIO DE LOGIN
		public static function login(){
			?>
		
			<form class="navbar-form navbar-right" method="post" id="login" autocomplete="off">
				<div class="form-group">
            		<input placeholder="User" class="form-control" type="text" name="user" required="required" />
            	<div class="form-group">
            	</div>
					<input placeholder="Password" class="form-control" type="password" name="password" required="required"/>
				</div>
				<div class="form-group">
					<input type="submit" name="login" class="btn btn-success" value="Login"/>
           		</div>
				
			</form>
			<?php 
		}
		
		//PONE LA INFO DEL USUARIO IDENTIFICADO Y EL FORMULARIO DE LOGOUT
		public static function logout($usuario){
			?>
		<form class="navbar-form navbar-right" method="post">
				<div class="form-group">
					<span class="logger"> Hola <a href="#" title="modificar datos"></span>
						<span class="logge"><?php echo $usuario->nombre;?></a></span>
					<span class="logger"> 	<?php echo ' ('.$usuario->email.')';?>
					<?php if($usuario->admin) echo ', eres administrador';?></span>
					<input class="btn btn-danger" type="submit" name="logout" value="Logout" />
				</span>
				</div>
		</form>	
			<?php 
		}
		
		
		//PONE EL MENU DE LA PAGINA
		public static function menu($usuario){
			
			?>

				<ul class="nav navbar-nav">
				
					<li class="unem"><a href="<?php echo base_url()?>">Inicio</a></li>
					<?php if(!$usua=Login::getUsuario()){ ?>
						<li class="unem"><a href="<?php echo base_url()?>usuario/registro">Registro</a></li>
					<?php } ?>
					<li class="unem"><a href="<?php echo base_url()?>producto/listar">Productos</a></li>
					
		<?php
				if($usuario){ echo "<li class='unem'><a href='".base_url()."producto/showcart'>Carrito</a></li>";
				if($usuario->admin) echo "<li class='unem'><a href='".base_url()."admin/showpanel'>Panel de control</a></li>";}?>
				</ul>
		<?php 	
		}
	
		
		//PONE EL PIE DE PAGINA
		public static function footer(){
			?>
			<footer class="navbar navbar-inverse navbar-fixed-bottom foot">
				
					<br/>
					<span><a href="info@kite-shopping.com ">info@kite-shopping.com</span><span> Esta pagina solo es un proyecto academico de : </span> <span> <a  href="#">David Sanchez Devesa</a></span>
         		
			</footer>
			
    <!-- Bootstrap core JavaScript-->
    
    <script src="<?php echo base_url()?>js/jquerymin.js"></script>
    <script src="<?php echo base_url()?>js/bootstrap.js"></script> 
  </body>
</html>		
<?php
		}
		
	}
?>