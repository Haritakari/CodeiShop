
function mostrar(e){                //para mostrar detalles producto      //Modales echos por mi (antes de conocer bootstrap o foundation)
	var src=(e.getAttribute("src"))
	var nom=(e.getAttribute("alt"))
	var car=(e.nextElementSibling.innerHTML)
	var pre=(e.nextElementSibling.nextElementSibling.innerHTML)
	var id=(e.nextElementSibling.nextElementSibling.nextElementSibling.innerHTML)
	
	document.getElementsByTagName('body')[0].innerHTML+=
	'<div id="borr">'+
		'<div id="in">'+
			'<img src="http://localhost/projectcodeiboo/images/x.png" onclick="cerrar();" class="butt"/><br/><br/>'+
			'<p>'+nom+'</p>'+	
			'<div class="flexinit">'+
				'<figure class="flex"><img src="'+src+'" alt="'+nom+'"/></figure><br/><br/>'+
				'<div class="flex">'+
					'<p>'+car+'</p>'+
					'<br/>'+
					'<p id="pre">   '+pre+' €</p>'+
					'<form action="" method="post"/>'+
					'<input type="hidden" name="id" value="'+id+'"/>'+
					'<input type="hidden" name="pre" value="'+pre+'"/>'+
					'<input type="hidden" name="foto" value="'+src+'"/>'+
					'<input type="hidden" name="nom" value="'+nom+'"/>'+
					'<p> <input class="butadd" value="add" name="add" type="submit"/></p>'+
					'</form>'+
				'</div>'+
			'</div>'+
		'</div>'+
	'</div>';
}
function cerrar(){										//cierra ventana
	var div=document.querySelector("#borr");
	div.parentNode.removeChild(div);
}
function change(){										//ver o no ver la direccion de envio alternativa
	var hidd=document.querySelectorAll('.rev')
	for(var i=0; i<=hidd.length; i++){
		if(hidd[i].className=='rev hidd'){
			hidd[i].className='rev disp'
		}
		else{
			hidd[i].className='rev hidd'
		}	
	}
}
function mosrar(e){                //para mostrar detalles producto a gente sin registrar (capado en php por si se lo saltan)
	var src=(e.getAttribute("src"))
	var nom=(e.getAttribute("alt"))
	var car=(e.nextElementSibling.innerHTML)
	var pre=(e.nextElementSibling.nextElementSibling.innerHTML)
	var id=(e.nextElementSibling.nextElementSibling.nextElementSibling.innerHTML)
	
	document.getElementsByTagName('body')[0].innerHTML+=
	'<div id="borr">'+
		'<div id="in">'+
		'<img src="http://localhost/projectcodeiboo/images/x.png" onclick="cerrar();" class="butt"/><br/><br/>'+
			'<p>'+nom+'</p>'+	
			'<div class="flexinit">'+
				'<figure><img src="'+src+'" alt="'+nom+'"/></figure><br/><br/>'+
				'<div class="flex">'+
					'<p>'+car+'</p>'+
					'<br/>'+
					'<p>   '+pre+' €</p>'+
					'<p> <a class="butadd" href="'+baseurl+'usuario/registro">Registrate</a></p>'+
				'</div>'+
			'</div>'+
		'</div>'+
	'</div>'
}                              //Utilizando modales de Bootstrap
$(document).ready(function() {     //al pulsar modificar en proveedores sale modal el modal de bootstrap
	$(".modi").click(function(){	//con esta funcion lo rellenamos
		var id=$(this).data('id');
		var nom=$(this).data('nom');

		$(".modal-title").html('Modificar proveedor');
		$(".modal-body>span").html('<input class="'+nom+'" value="'+nom+'"/>');
        $(".modal-body>button").html('Modificar');
        $(".modal-body>button").removeClass().addClass('btn btn-warning');
		$(".modal-body>span>input").change(function(){
				 nom2=$(".modal-body>span>input."+nom+"").val();
			})
		$(".modal-body>button").click(function(){
			
			 //asignamos el nuevo valor del input a l avariable que ira a BD
			
			$.post('http://localhost/projectcodeiboo/index.php/admin/updateDeal',{filtro:id,nombre:nom2},function(htmlexterno){
   $("#resu").html(htmlexterno);
			//modificamos el listado que hay por debajo del modal	
			
			$('*[data-id="'+id+'"]').parent().prev().html(''+nom2+'');
			$('*[data-id="'+id+'"]').data('nom',''+nom2+'');
            $(".modal-body>button").prop( "disabled", true );
			id=null;
            nom=null;
			});
		});	
	});
});

function refresca() {                           //Reset de modal de Bootstrap
        $(".modal-title").html("");
        $(".modal-body>span").html("");
        $(".modal-body>button").html("");
        $("#resu").html("");
        $("#creator").val("");
        $(".modal-body>button").unbind( "click" );
        $(".modal-body>button").prop( "disabled", false );
};

$(document).ready(function() {     //al pulsar delete en proveedores sale modal de bootstrap
	$(".delete").click(function(){	//con esta funcion lo rellenamos
		var id=$(this).data('delid');
		var nom=$(this).data('nom');
		$(".modal-title").html('Eliminar proveedor');
		$(".modal-body>span").html('<span class="'+nom+'"> Estas seguro que quieres eliminar '+nom+'</span>');
		$(".modal-body>button").html('Eliminar');
		$(".modal-body>button").removeClass().addClass('btn btn-danger');
		$(".modal-body>button").click(function(){
			$.post('http://localhost/projectcodeiboo/index.php/admin/deleteDeal',{filtro:id},function(htmlexterno){
   			$("#resu").html(htmlexterno);
			if(htmlexterno!='el proveedor esta vinculado'){
				$('*[data-id="'+id+'"]').parent().parent().remove();
			}
            $(".modal-body>button").prop( "disabled", true );
			
			id=null;
            nom=null;
			});
		});	
	});
});
$(document).ready(function(){
	$('.createt').click(function(){
		$(".modal-title").html('Añadir proveedor');
		$(".modal-body>span").html('<input id="creator" value=""/>');
		$(".modal-body>button").html('Añadir');
		$(".modal-body>button").removeClass().addClass('btn btn-info');
		$(".modal-body>span>input").change(function(){
			 nom=$("#creator").val();
			})
			$(".modal-body>button").click(function(){
				$.post('http://localhost/projectcodeiboo/index.php/admin/createDeal',{filtro:nom},function(htmlexterno){
	   			$("#resu").html(htmlexterno);
              
	   			//modificamos el listado que hay por debajo del modal	
	   			var id=$('[data-newid]').data('newid');
                
	   			$('table.most').append(
	   			'<tr>'+
	                '<td>'+id+'</td>'+
	                '<td>'+nom+'</td>'+
	                '<td><input class="btn btn-warning modi" data-id="'+id+'" data-nom="'+nom+'" data-toggle="modal" data-target="#myModal" type="button" name="modi" value="Modificar" onclick="mod(this)"/> '+
	                '<input class="btn btn-danger delete" data-delid="'+id+'" data-nom="'+nom+'" data-toggle="modal" data-target="#myModal" type="button" name="delete" value="Eliminar" onclick="del(this)"/></td>'+  
            	'</tr>')
                $(".modal-body>button").prop( "disabled", true );
            id=null;
            nom=null;
	   		});
   		});
	});
});
    
function mod(el){	      //misma funcion que update con nombre para asignarla al new dealer
		var id=$(el).data('id');
		var nom=$(el).data('nom');
		$(".modal-title").html('Modificar proveedor');
		$(".modal-body>span").html('<input class="'+nom+'" value="'+nom+'"/>');
        $(".modal-body>button").html('Modificar');
        $(".modal-body>button").removeClass().addClass('btn btn-warning');
		$(".modal-body>span>input").change(function(){
				 nom2=$(".modal-body>span>input."+nom+"").val();
			})
		$(".modal-body>button").click(function(){
			
			 //asignamos el nuevo valor del input a l avariable que ira a BD
			
			$.post('http://localhost/projectcodeiboo/index.php/admin/updateDeal',{filtro:id,nombre:nom2},function(htmlexterno){
   			$("#resu").html(htmlexterno);
			//modificamos el listado que hay por debajo del modal	
			
			$('*[data-id="'+id+'"]').parent().prev().html(''+nom2+'');
			$('*[data-id="'+id+'"]').data('nom',''+nom2+'');
            $(".modal-body>button").prop( "disabled", true );
			id=null;
            nom=null;
			});
		});	
}
function del(el){	    //misma funcion que delete con nombre para asignarla al new dealer
		var id=$(el).data('delid');
		var nom=$(el).data('nom');
		$(".modal-title").html('Eliminar proveedor');
		$(".modal-body>span").html('<span class="'+nom+'"> Estas seguro que quieres eliminar '+nom+'</span>');
		$(".modal-body>button").html('Eliminar');
		$(".modal-body>button").removeClass().addClass('btn btn-danger');
		$(".modal-body>button").click(function(){
			$.post('http://localhost/projectcodeiboo/index.php/admin/deleteDeal',{filtro:id},function(htmlexterno){
   			$("#resu").html(htmlexterno);
			if(htmlexterno!='el proveedor esta vinculado'){
                $('*[data-id="'+id+'"]').parent().parent().remove();
            }
            $(".modal-body>button").prop( "disabled", true );
            id=null;
            nom=null;
			});
		});	
}
$(document).ready(function(){            //ajax para verificar user en el registro
	$('#userajax').keyup(function(){
		var user = $(this).val();
		var num = user.length;
		$.post( ""+baseurl+"usuario/ajaxvery",{filtro:user}, function( result ) {
			
  		if(result == false || num < 3){        //si no tine mas de 2 cifras o esta en base de datos  letras en rojo
  			$('#userajax').css('color','red');
  			$('#butsel').attr('disabled','disabled');
  			$('#butsel').css('color','grey');  //Deshabilito submit para no crear conflicto con user repetido
  		}
  		else{
  			$('#userajax').css('color','#40FF00');
  			$('#butsel').removeAttr("disabled");
  			$('#butsel').css('color','black');
  		}
		});
	});
});

        
        
	
    