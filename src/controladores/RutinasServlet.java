package controladores;

import java.io.IOException;
import java.io.InputStream;
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

import modelo.beans.*;
import modelo.datos.*;

/**
 * Servlet implementation class RutinasServlet
 */
@WebServlet("/Rutinas")
@MultipartConfig(maxFileSize = 16177216)//15mb
public class RutinasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RutinasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RutinasDAO rdao = new RutinasDAO();
		Rutinas rutinas = new modelo.beans.Rutinas();
		String op = request.getParameter("op");
		String url = "";
		HttpSession sesion;
		Usuario user;
		
		switch (op) {
		case "Listar": // consulta de todas las ventas
			List<Rutinas> datos = rdao.consultarRutinas();
			request.setAttribute("datos", datos);
			url = "/comunes/Administrar/administrar_rutinas.jsp";
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
		case "AdminRutinas":
			url = "Rutinas?op=Listar";
			break;
		case "Editar":
			String idR1 = request.getParameter("id");
			Rutinas re = rdao.listarId(idR1);
			request.setAttribute("rutinas", re);
			url= "/comunes/Modificar/modificar_rutinas.jsp";
			break;
		case "Modificar":
			int idRutina = Integer.parseInt(request.getParameter("txtid"));
			String nombrer=request.getParameter("txtNombre");
			String areacuerpo=request.getParameter("txtArea");
			int series=Integer.parseInt(request.getParameter("txtSeries"));
			int repeticiones=Integer.parseInt(request.getParameter("txtRepeticiones"));
			String descripcionr=request.getParameter("txtDescripcion");
			response.setContentType("text/html;charset=UFT-8");
			Part part = request.getPart("img");
			InputStream is = part.getInputStream();
			rdao.actualizar(idRutina,nombrer, areacuerpo, series, repeticiones, descripcionr,is);
			url="Rutinas?op=Listar";
			break;
		case "Eliminar":
			String idP = request.getParameter("id");
			rdao.eliminar(idP);
			url = "Rutinas?op=Listar";
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
