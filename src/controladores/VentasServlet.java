package controladores;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.beans.*;
import modelo.datos.*;

/**
 * Servlet implementation class VentasServlet
 */
@WebServlet(name = "VentasServlett", urlPatterns = { "/Ventas" })
public class VentasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VentasServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		VentasDAO vdao = new VentasDAO();
		Ventas ventas = new Ventas();
		ProductoDAO pdao = new ProductoDAO();
		String op = request.getParameter("op");
		String url = "/comunes/inicio-administrador.jsp";
		HttpSession sesion;
		Usuario user;
		
		switch (op) {
		case "Listar": // consulta de todas las ventas
			List<Ventas> datos = vdao.consultarVentas();
			request.setAttribute("datos", datos);
			url = "/comunes/Administrar/administrar_ventas.jsp";
			break;
		case "ListarParaRegistro":
			List<Producto> datosp = pdao.consultarProducto();
			request.setAttribute("datos", datosp);
			url = "/comunes/Registrar/registrar_venta.jsp";
			break;
		case "agregarProducto":
			sesion = request.getSession(true);
			user = (Usuario) sesion.getAttribute("usuario");
			String tipo = user.getTipo();
			break;
		case "R":// Recepcionista
			url = "/comunes/Registrar/registrar_venta.jsp";
			break;
		case "A":// Administrador
			url = "/comunes/Registrar/registrar_venta.jsp";
			break;
			
		case "Regresar":
			sesion = request.getSession(true);
			user = (Usuario) sesion.getAttribute("usuario");
			tipo = user.getTipo();
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
		case "AdminVentas":
			url = "Ventas?op=Listar";
			break;
		case "Editar":
			String idV1 = request.getParameter("id");
			Ventas ve = vdao.listarId(idV1);
			request.setAttribute("ventas", ve);
			url= "/comunes/Modificar/modificar_venta.jsp";
			break;
		case "Modificar":
			Ventas v = new Ventas();
			v.setIdVenta(Integer.parseInt(request.getParameter("id")));
			v.setIdProducto(Integer.parseInt(request.getParameter("idProducto")));
			v.setFechaVenta(Date.valueOf(request.getParameter("Fecha de Venta")));
			v.setMonto(Float.parseFloat(request.getParameter("monto")));
			v.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
			vdao.actualizar(v);
			url="Ventas?op=Listar";
			break;
		case "Eliminar":
			String idP = request.getParameter("id");
			vdao.eliminar(idP);
			url = "Ventas?op=Listar";
			break;

		default:
			break;
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
