package controladores;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.beans.TipoMembresia;
import modelo.beans.Usuario;
import modelo.datos.MembresiaDAO;
import modelo.datos.TipoMembresiaDAO;

/**
 * Servlet implementation class TipoMembresiaServlet
 */
@WebServlet("/TipoMembresia")
public class TipoMembresiaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TipoMembresiaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TipoMembresiaDAO mdao = new TipoMembresiaDAO();
		TipoMembresia Membresia = new TipoMembresia();
		String op = request.getParameter("op");
		String url = "";
		HttpSession sesion;
		Usuario user;
		
		switch (op) {
		case "Listar": // consulta de todas las ventas
			List<TipoMembresia> datos = mdao.consultarMembresia();
			request.setAttribute("datos", datos);
			url = "/comunes/Administrar/administrar_membresias.jsp";
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
		case "AdminMembresias":
			url = "TipoMembresia?op=Listar";
			break;
		case "Editar":
			String idE1 = request.getParameter("id");
			TipoMembresia membresia = mdao.listarId(idE1);
			request.setAttribute("Membresia", membresia);
			url= "/comunes/Modificar/modificar_membresias.jsp";
			break;
		case "Modificar":
			TipoMembresia m = new TipoMembresia();
			m.setIdTipo(Integer.parseInt(request.getParameter("id")));
			m.setNombre(request.getParameter("nombre"));
			m.setPrecio(Float.parseFloat(request.getParameter("precio")));
			m.setVigencia(Integer.parseInt(request.getParameter("vigencia")));
			m.setTiempoLimite(Integer.parseInt(request.getParameter("tiempolimite")));
			mdao.actualizar(m);
			url="TipoMembresia?op=Listar";
			break;
		case "Eliminar":
			String idP = request.getParameter("id");
			mdao.eliminar(idP);
			url = "TipoMembresia?op=Listar";
			break;
		case "ObtenerFechaPago":
			String iduser = request.getParameter("idUsuario");
			MembresiaDAO memDAO = new MembresiaDAO();
			memDAO.obtenerFechaPago(Integer.parseInt(iduser));
			
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
