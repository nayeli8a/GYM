package controladores;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//modelos
import modelo.datos.*;
import modelo.beans.*;


@WebServlet("/Usuario")
public class UsuariosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsuariosServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// aqui va todo el codigo
		System.out.println("Dentro de UsuarioServlet");
		UsuarioDAO udao = new UsuarioDAO();
		MembresiaDAO memdao = new MembresiaDAO();
		TipoMembresiaDAO tmemdao = new TipoMembresiaDAO();
		String op = request.getParameter("op");
		String url = "index.jsp";
		Usuario u = new Usuario();
		HttpSession sesion;
		//Usuario user;

		switch (op) {
		case "L":// caso de login
			// verificamos que los datos son de algun usuario en la bd
			String NombreUsuario = request.getParameter("Nom_Usuario");
			String Codigo = request.getParameter("Codigo");
			u = udao.ValidarUsuarios(NombreUsuario, Codigo);
			
			if (u.getNom_Usuario() != null) {
				// si existe el usuario en la base de datos
				// creamos un usuario con sus datos para saber de que tipo es
				sesion = request.getSession(true);
				sesion.setAttribute("usuario", u);
				u = (Usuario) sesion.getAttribute("usuario");
				String tipo = u.getTipo();

				// segun el tipo entra a una pagina o a otra
				switch (tipo) {
				case "R":// Recepcionista
					url = "/comunes/Inicio/inicio-recepcionista.jsp";
					break;
				case "C":// Cliente
					url = "/comunes/Inicio/inicio-cliente.jsp";
					//debo llamar al proc alm y guardar su valor en algun lugar para pasarlo
					//a la pagina jsp
					Membresia mem = new Membresia();
					mem.setFechaProximoPago( (Date) memdao.obtenerFechaPago(u.getIdUsuario()) );
					sesion.setAttribute("membresia",mem);
					mem = (Membresia) sesion.getAttribute("membresia");
					break;
				case "A":// Administrador
					url = "/comunes/Inicio/inicio-administrador.jsp";
					break;
				case "F":// Finanzas
					url = "/comunes/Inicio/inicio-finanzas.jsp";
					break;

				}

			}
			break;

		case "CS":
			sesion = request.getSession();
			sesion.invalidate();
			url="index.jsp";
			break;
		case "Listar":
			List<Usuario> datos = udao.consultar();
			request.setAttribute("datos", datos);
			url = "Usuario?op=Regresar";
			//url = "/comunes/Administrar/administrar_clientes.jsp";
			break;
		case "ListarIndividual":
			Usuario user = udao.consultaIndividual(u.getIdUsuario());
			request.setAttribute("usuario",user);
			url = "Usuario?op=Regresar";
			break;
		case "ListarParaRegistro":
			List<TipoMembresia> tmdatos = tmemdao.consultarMembresia();
			request.setAttribute("tmembresia",tmdatos);
			url = "/comunes/Registrar/registrar_cliente.jsp";
			break;
		case "Regresar":
			sesion = request.getSession(true);
			u = (Usuario) sesion.getAttribute("usuario");
			String tipo = u.getTipo();
			
			switch (tipo) 
			{
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
		case "AdminCliente":
				datos = udao.consultar();
				request.setAttribute("datos", datos);
			url = "/comunes/Administrar/administrar_clientes.jsp";
			break;
		case "Editar":
			String idU1 = request.getParameter("id");
			Usuario ue = udao.listarId(idU1);
			request.setAttribute("user",ue);
			//request.setAttribute("usuario", ue);
			url= "/comunes/Modificar/modificar_cliente.jsp";
			break;
		case "Modificar":
			Usuario um = new Usuario();
			um.setIdUsuario(Integer.parseInt(request.getParameter("id")));
			um.setNombre(request.getParameter("Nombre"));
			um.setAPaterno(request.getParameter("Apellido Paterno"));
			um.setAMaterno(request.getParameter("Apellido Materno"));
			um.setCorreo(request.getParameter("Correo"));
			um.setTelefono(request.getParameter("Telefono"));
			um.setCodigo(request.getParameter("Codigo"));
			um.setNom_Usuario(request.getParameter("Nombre de usuario"));
			um.setEstatus(request.getParameter("Estatus"));
			um.setTipo(request.getParameter("Tipo"));
			udao.actualizar(um);
			url="Usuario?op=Listar";
			//url = "Usuario?op=Regresar";
			break;
		case "Eliminar":
			String idP = request.getParameter("id");
			udao.eliminar(idP);
			//url = "Usuario?op=Listar";
			url = "Usuario?op=Regresar";
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
		doGet(request, response);
	}

}
