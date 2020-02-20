function mostrarEstatus(estatus,id)
{
	switch(estatus)
	{
	case 'A':
		//esta Activa
		document.getElementById(id).innerHTML="<h5>"+"Activa"+"</h5>";
		break;
	case 'I':
		//esta Inactiva
		document.getElementById(id).innerHTML="<h5>"+"Inactiva"+"</h5>";
		break;
	}
}

function mostrarFechaPago(FechaProximoPago,iddiv)
{
	//la devuelvo en formato de texto
	document.getElementById(iddiv).innerHTML="<h5>"+FechaProximoPago+"</h5>";
}

function mostrarBarraAlerta(estatus,idbarra_estatus,idbarra_mensaje)
{
	switch(estatus)
	{
	case 'A':
		document.getElementById(idbarra_estatus).innerHTML="<h7>"+"Activo"+"</h7>";
		document.getElementById(idbarra_mensaje).innerHTML="<h8>"+"Listo!, Pagos al corriente"+"</h8>";
		break;
	case 'I':
		document.getElementById(idbarra_estatus).innerHTML="<h7>"+"Inactivo"+"</h7>";
		document.getElementById(idbarra_mensaje).innerHTML="<h8>"+"Tu pago no ha sido realizado"+"</h8>";
		break;
	}
}