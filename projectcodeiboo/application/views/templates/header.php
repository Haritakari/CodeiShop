<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Kite shop</title>
    <link href="<?php echo base_url() ?>/css/bootstrap.css" rel="stylesheet">
    <link href="<?php echo base_url() ?>/css/style.css" rel="stylesheet">
    <script src="<?php echo base_url()?>js/jquerymin.js"></script>
	  <script src="<?php echo base_url()?>js/script.js"></script>
    <script>
     var baseurl='<?php echo base_url();?>';
    </script>
  </head>
  <body>
 <nav class="navbar navbar-inverse navbar-fixed-top menu">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="izquierda">
					<span>KITE</span><br/>
					<span>SHOPING</span>
				</div>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
        <?php 
		if(!$usuario) Templ::login();
		else Templ::logout($usuario);
		Templ::menu($usuario);
		?>
        </div>
      </div>
    </nav>
    
