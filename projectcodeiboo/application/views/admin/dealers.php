<? defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="content">

        <h2 id='col'>Panel Gestion Proveedores</h2>
        

            <table class="most cent">
                <tr>
                    
                    <th>Id</th>
                    <th>Nombre</th>
                    <th><input class='btn btn-info createt'   data-toggle='modal' data-target='#myModal' type='button' name='modi' value='Añadir proveedor'/></th>
                   
                </tr>
<?php 
            foreach ($dealers as $cos=>$valor){
            echo "
            <tr> 
                <td>$valor->id</td>
                <td>$valor->nombre</td>
                <td><input class='btn btn-warning modi' data-id='$valor->id' data-nom='$valor->nombre' data-toggle='modal' data-target='#myModal' type='button' name='modi' value='Modificar'/>
                <input class='btn btn-danger delete' data-delid='$valor->id' data-nom='$valor->nombre' data-toggle='modal' data-target='#myModal' type='button' name='delete' value='Eliminar'></td> 
                    
            </tr>";
            }
            echo "</table>";
?>
</div>
<div id="modaler">
  <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content cont-modal">
      <div class="modal-header">
        <button type="button" class="close"  data-dismiss="modal";>&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <span>Some text in the modal.</span>
        <button type="button" class="btn btn-success">Modificar</button>
      </div>
      <div class="modal-footer">
        <span id="resu"></span>
        <button type="button" onclick="refresca();" data-dismiss="modal"  class="btn btn-default" >Close</button>
      </div>
    </div>

  </div>
</div>
</div>
