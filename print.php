<?php
include("global/db.php");
//includes para mostrar los datos en print.php
//Capturando datos para factura

if(isset($_POST['enviar'])){
  $correo = $_POST['correo'];
  $sentencia_query_prod = $pdo->prepare("SELECT * FROM productos");
  $sentencia_query_prod->execute();
  $cond = $sentencia_query_prod->fetchall();

  $id_usuario = $correo;
  $sentencia_query = $pdo->prepare("SELECT * FROM ventas INNER JOIN detalleventa ON ventas.ID=detalleventa.IDVENTA WHERE Correo='$correo'");
  $sentencia_query->execute();
  $ventas = $sentencia_query->fetchall();
}

?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Invoice</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="admin/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="admin/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="admin/dist/css/AdminLTE.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body onload="window.print();">
<div class="wrapper">
  <!-- Main content -->
  <section class="invoice">
    <!-- title row -->
    <div class="row">
      <div class="col-xs-12">
        <h2 class="page-header">
          <i><img src="admin/dist/img/logo.png" style="height: 50px; width: 70px; background: #34495e;"></i> TECHNOLOGY, SV.
          <small class="pull-right">Date:<?php echo date("D/M/Y");?></small>
        </h2>
      </div>
      <!-- /.col -->
    </div>
    <!-- info row -->
    <div class="row invoice-info">
      <div class="col-sm-4 invoice-col">
        de
        <address>
          <strong>Technology, Inc.</strong><br>
          El salvador, San Salvador<br>
          San Jacinto, CA 9910<br>
          Phone: (503) 78123445<br>
          Nombre de comprador:<?php foreach($ventas as $fila){ echo $fila['Nombre'];break; }?>
        </address>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- Table row -->
    <div class="row">
      <div class="col-xs-12 table-responsive">
        <table class="table table-striped">
          <thead>
          <tr>
            <th>Nombre del producto</th>
            <th>Correo del cliente</th>
            <th>Cantidad</th>
            <th>Subtotal</th>
          </tr>
          </thead>
          <tbody>
          <?php foreach($ventas as $fila){?>
            <tr>

              <td><?php
                foreach($cond as $fila1){
                  $id = $fila1['CodigoProd'];
                  $nombre_prod = $fila1['NombreProd'];
                  if($id==$fila['IDPRODUCTO']){
                  echo $nombre_prod;
                }
              } ?>
                
              </td>

              <td><?php echo $fila['Correo']; ?></td>
              <td><?php echo $fila['Cantidad']; ?></td>
              <td><?php echo $fila['PRECIOUNITARIO']; ?></td>
            </tr>
          <?php }?>
        </table>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->

    <div class="row">
      <!-- accepted payments column -->
      <div class="col-xs-6">
        <p class="lead">Método utilizado de pago:</p>
        <!--<img src="dist/img/credit/visa.png" alt="Visa">
        <img src="dist/img/credit/mastercard.png" alt="Mastercard">
        <img src="dist/img/credit/american-express.png" alt="American Express">-->
        <img src="admin/dist/img/credit/paypal2.png" alt="Paypal">

        <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
          Este comprabante demuestra que su compra ha sido exitosa,
          vuelva pronto.
        </p>
      </div>
      <!-- /.col -->
      <div class="col-xs-6">
        <p class="lead">Fecha: <?php echo date("D/M/Y");?></p>

        <div class="table-responsive">
          <table class="table">
            <tr>
              <th style="width:50%">Total pago:</th>
              <td>$<?php foreach($ventas as $fila){ echo $fila['Total'];break; }?></td>
            </tr>
          </table>
        </div>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </section>
  <!-- /.content -->
</div>
<!-- ./wrapper -->
</body>
</html>
