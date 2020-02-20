package controladores;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import modelo.beans.Producto;
import modelo.beans.Usuario;
import modelo.datos.Conexion;
import modelo.datos.ProductoDAO;

/**
 * Servlet implementation class ProductoServlet
 */
@WebServlet("/Producto")
@MultipartConfig(maxFileSize = 16177216)//15mb
public class ProductoServlet extends HttpServlet implements Servlet {
	Producto producto = new Producto();
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductoDAO pdao = new ProductoDAO();

		String op = request.getParameter("op");
		String url="comunes/Inicio/inicio-administrador.jsp";
		HttpSession sesion;
		Usuario user;
		
		switch (op) {
		case "Listar"://consultar todos los productos
			List<Producto> datos = pdao.consultarProducto();
			request.setAttribute("datos", datos);
			url = "/comunes/Administrar/administrar_productos.jsp";
			break;
		case "ListarSinUsuario":
			datos = pdao.consultarProducto();
			request.setAttribute("datos", datos);
			url = "/comunes/productos.jsp";
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
		case "AdminProducto":
			url = "Producto?op=Listar";
			break;
		case "Editar":
			String idP1 = request.getParameter("id");
			Producto pe = pdao.listarId(idP1);
			request.setAttribute("producto", pe);
			url= "/comunes/Modificar/modificar_producto.jsp";
			break;
		case "Modificar":
			int IdProducto = Integer.parseInt(request.getParameter("txtid"));
			String Nombre = request.getParameter("txtnombre");
			String precio = request.getParameter("txtprecio");
			int Stock = Integer.parseInt(request.getParameter("txtstock"));
			String Descripcion = request.getParameter("txtdescripcion");
			response.setContentType("text/html;charset=UFT-8");
			Part part = request.getPart("img");
			InputStream is = part.getInputStream();
			pdao.actualizar(IdProducto,Nombre,precio,Stock,Descripcion,is);
			url="Producto?op=Listar";
			break;
		case "Eliminar":
			String idP = request.getParameter("id");
			pdao.eliminar(idP);
			url="Producto?op=Listar";
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
