<?php

  	$id = $_GET['id'];
  	$link = mysql_connect("localhost", "root", "1234");
  	mysql_select_db("zeusBd");
  	
	$qry = "SELECT Imagen FROM Rutinas WHERE idRutina=$id";
	$res = mysql_query($qry);
	$row = mysql_fetch_row($res);
	echo 123
   
?>