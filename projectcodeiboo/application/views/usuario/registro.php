<div class="content">
		<div>
			<h2>Formulario de registro</h2>
			<form method="post" autocomplete="off">
			<?php echo validation_errors(); ?>
				<label>User:</label>
				<input type="text" name="user" required="required" id="userajax" autocomplete="off" 
					pattern="^[a-zA-Z]\w{2,10}" maxlength="10" title="3 a 10 caracteres (numeros, letras o guión bajo), comenzando por letra"/><br/>
				<label>Password:</label>
				<input type="password" required="required" name="password" 
					pattern=".{4,16}" maxlength="16" title="4 a 16 caracteres"/><br/>
				<label>Nombre:</label>
				<input type="text" name="nombre" maxlength="15" required="required"  title="de 2 a 15 letras" pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð]{2,15}"/><br/>
				<label>Apellidos:</label>
				<input type="text" name="apellidos" maxlength="30" required="required"  title="de 2 a 30 lletres" pattern="[a-zA-Z àáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð]{2,30}"/><br/>
				<label>Telefono:</label>
				<input type="text" name="telefono" maxlength="11" pattern="[0-9]{5,11}" title="Telefono" required="required"/><br/>
				<label>Fecha de nacimiento:</label>
				<input type="text" name="fecha_nacimiento"  pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" placeholder="  /  /    " id="nacontr" maxlength="10" required="required"/><br/>
				<label>Dirección:</label>
				<input type="text"  name="direccion" pattern="{5,40}" required="required"/><br/>
				<label>DNI o NIE:</label>
				<input type="text" maxlength="9" title="DNI o NIE" pattern="[XYZ0-9][0-9]{7}[A-Z]" required="required" name="dni" /><br/>
				<label>Email:</label>
				<input type="email" name="email" maxlength="30" title="Correo Electronico" required="required"/><br/>
				<label>Ciudad:</label>
				<input type="text" name="ciudad" maxlength="15" required="required"/><br/>
				<label>Pais:</label>
				<input type="text" name="pais" maxlength="15" required="required"/><br/>
	
				<input type="submit" name="guardar" class="btn btn-primary" id="butsel" disabled="disabled" value="guardar"/><br/>
			</form>
			</div>
		</div>