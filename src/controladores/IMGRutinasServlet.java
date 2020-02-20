package controladores;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.datos.RutinasDAO;

/**
 * Servlet implementation class IMGRutinasServlet
 */
@WebServlet("/IMGRutinas")
public class IMGRutinasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	RutinasDAO rdao = new RutinasDAO();
    
    public IMGRutinasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//este metodo servira para mandar la imagen de las rutinas
		int id=Integer.parseInt(request.getParameter("id"));
		rdao.ListarImagen(id, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
