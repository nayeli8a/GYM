package controladores;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Time;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.apache.commons.fileupload.*;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import modelo.datos.*;
import modelo.beans.*;

/**
 * Servlet implementation class RegistrarServlet
 */
@WebServlet(name = "RegistrarServelet", urlPatterns = { "/Registrar" })
@MultipartConfig(maxFileSize = 16177216)//15mb
public class RegistrarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*--------------------------*/
		System.out.println("Dentro de RegistrarServlet");
		String op = request.getParameter("op");
		
		EntradasDAO endao = new EntradasDAO();
		UsuarioDAO udao = new UsuarioDAO();
		RutinasDAO rdao = new RutinasDAO();
		VentasDAO vdao = new VentasDAO();
		ProductoDAO pdao = new ProductoDAO();
		TipoMembresiaDAO tmdao = new TipoMembresiaDAO();
		
		String url = "";
		Usuario user;
		HttpSession sesion;
		
		switch(op)
		{
		case "Listar": // consulta de todas las ventas
			List<Rutinas> datos = rdao.consultarRutinas();
			request.setAttribute("datos", datos);
			url = "/comunes/Administrar/administrar_entradas.jsp";
			break;
		case "RegistrarEntradas":
			String nom_usuario = request.getParameter("nom_usuario");
			String hora_Entrada = request.getParameter("hora_entrada");
			String fecha_Entrada = request.getParameter("fecha_entrada");
			endao.insertarEntradas(nom_usuario,hora_Entrada,fecha_Entrada);
			url = "Registrar?op=Regresar";
			break;
		case "Producto":
			String nombre = request.getParameter("nombre");
			String precio = request.getParameter("precio");
			int stock = Integer.parseInt(request.getParameter("stock"));
			String descripcion = request.getParameter("descripcion");
			response.setContentType("text/html;charset=UFT-8");
			Part part = request.getPart("img");
			InputStream is = part.getInputStream();
			pdao.insertarProducto(nombre, precio, stock, descripcion,is);
			url="Registrar?op=Regresar";
			break;
		case "Regresar":
			sesion = request.getSession(true);
			user = (Usuario) sesion.getAttribute("usuario");
			String tipo = user.getTipo();
			switch (tipo) {
			case "R":// Recepcionista
				url = "/comunes/Inicio/inicio-recepcionista.jsp";
				break;
			case "C":// Cliente
				url = "/comunes/Inicio/inicio-cliente.jsp";
				break;
			case "A":// Administrador
				url = "/comunes/Inicio/inicio-administrador.jsp";
				break;
			case "F":// Finanzas
				url = "/comunes/Inicio/inicio-finanzas.jsp";
				break;

			}
			break;
		case "Rutinas":
			
			String nombrer=request.getParameter("nombre");
			String areacuerpo=request.getParameter("areacuerpo");
			int series=Integer.parseInt(request.getParameter("series"));
			int repeticiones=Integer.parseInt(request.getParameter("repeticiones"));
			String descripcionr=request.getParameter("descripcion");
			response.setContentType("text/html;charset=UFT-8");
			part = request.getPart("img");
			is = part.getInputStream();
			rdao.insertarRutinas(nombrer, areacuerpo, series, repeticiones, descripcionr,is);
			url="Registrar?op=Regresar";
			break;
		case "Venta":
			int idProducto = Integer.parseInt(request.getParameter("idproducto"));
			String FechaVenta = request.getParameter("fechaventa");
			String Monto = request.getParameter("monto");
			int cantidad=Integer.parseInt(request.getParameter("cantidad"));
			System.out.println("dentro de registrar servlet: "+idProducto+","+FechaVenta+","+Monto+","+cantidad);
			vdao.insertarVentas(idProducto, FechaVenta, Monto,cantidad);
			url="Registrar?op=Regresar";
			break;
		case "TipoMembresia":
			nombre = request.getParameter("nombre");
			Float Fprecio = Float.parseFloat(request.getParameter("precio"));
			int vigencia = Integer.parseInt( request.getParameter("vigencia"));
			int tiempolimite = Integer.parseInt(request.getParameter("tiempolimite"));
			tmdao.insertarMembresia(nombre,Fprecio, vigencia, tiempolimite);
			url = "Registrar?op=Regresar";
		break;
		case "RegistrarCliente":
			nombre = request.getParameter("nombre");
			String apaterno = request.getParameter("apaterno");
			String amaterno = request.getParameter("amaterno");
			String telefono = request.getParameter("telefono");
			String correo = request.getParameter("correo");
			nom_usuario = request.getParameter("nom_usuario");
			String estatus = request.getParameter("estatus");
			String codigo = request.getParameter("codigo");
			tipo = request.getParameter("tipo");
			//System.out.println(tipo);
			if("C".equals(tipo)){
				//System.out.println("Entro aqui 1 ........");
				String tipomembresia = request.getParameter("tipomembresia");
				String fechaapertura = request.getParameter("fecha_apertura");
				String fechapago = request.getParameter("fecha_pago");
				udao.insertarClientes(nombre, apaterno, amaterno, correo, telefono, codigo, nom_usuario, estatus, tipo, tipomembresia, fechaapertura, fechapago);
				//System.out.println("Entro aqui........");
			}
			else {
				udao.insertarUsuarios(nombre, apaterno, amaterno, correo, telefono,codigo, nom_usuario,estatus,tipo);
			}	
			url = "Registrar?op=Regresar";
			break;
		case "AdminRutinas":
			url = "Registrar?op=Listar";
		break;
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	

}
