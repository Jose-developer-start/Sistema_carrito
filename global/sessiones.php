<?php
session_start();
if(!isset($_SESSION['administrador'])){
	header('location:index.php');

}else{
	#Datos de admistrador/Solo estan disponible durante la session(Mostramos en Cabecera.php, Profile.php)
	//print_r($_SESSION['administrador']);
	$idSession = $_SESSION['administrador']['ID'];
	$nombreAdmin = $_SESSION['administrador']['Nombres'];
	$apellidoAdmin = $_SESSION['administrador']['Apellidos'];
	$emailAdmin = $_SESSION['administrador']['Correo'];
	$passwordAdmin = $_SESSION['administrador']['Password'];
	$fotoAdmin = $_SESSION['administrador']['Foto'];

}
?>