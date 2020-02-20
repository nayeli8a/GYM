package controladores;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.beans.Entradas;
import modelo.beans.Producto;
import modelo.beans.Usuario;
import modelo.datos.EntradasDAO;

/**
 * Servlet implementation class EntradasServlet
 */
@WebServlet("/Entradas")
public class EntradasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EntradasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EntradasDAO edao = new EntradasDAO();
		Entradas entradas = new Entradas();
		String op = request.getParameter("op");
		String url = "";
		HttpSession sesion;
		Usuario user;
		
		switch (op) {
		case "Listar": // consulta de todas las ventas
			List<Entradas> datos = edao.consultarEntradas();
			request.setAttribute("datos", datos);
			url = "/comunes/Administrar/administrar_entradas.jsp";
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
		case "AdminEntradas":
			url = "Entradas?op=Listar";
			break;
		case "Editar":
			String idE1 = request.getParameter("id");
			Entradas en = edao.listarId(idE1);
			request.setAttribute("entradas", en);
			url= "/comunes/Modificar/modificar_entradas.jsp";
			break;
		case "Modificar":
			Entradas e = new Entradas();
			e.setIdEntrada(Integer.parseInt(request.getParameter("id")));
			e.setNom_usuario(request.getParameter("nom_usuario"));
			e.setHora_Entrada(Time.valueOf(request.getParameter("hora")));
			e.setFecha_Entrada(Date.valueOf(request.getParameter("fecha")));
			edao.actualizar(e);
			url="Entradas?op=Listar";
			break;
		case "Eliminar":
			String idP = request.getParameter("id");
			edao.eliminar(idP);
			url = "Entradas?op=Listar";
			break;
		default:
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
