package modelo.datos;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.sql.rowset.serial.SerialBlob;
import java.sql.Blob;

import modelo.beans.Rutinas;

public class RutinasDAO {
	PreparedStatement ps;
	ResultSet rs;

	
	public void insertarRutinas(String nombre,String areacuerpo, int series,int repeticiones,String descripcion,InputStream imagen)
	{
		String sql = "insert into rutinas (Nombre,AreaCuerpo,series,repeticiones,Descripcion,Imagen) values(?,?,?,?,?,?)";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1,nombre);
			ps.setString(2,areacuerpo);
			ps.setInt(3,series);
			ps.setInt(4,repeticiones);
			ps.setString(5,descripcion);
			ps.setBlob(6,imagen);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error: "+e.getMessage());
			System.out.println(e.toString());
		}
	}
	
	public void ListarImagen(int idRutina,HttpServletResponse response)
    {
        String sql = "select * from Rutinas where idRutina = "+idRutina;
        InputStream is = null;
        OutputStream os = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        
        try {
			os = response.getOutputStream();
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
	        rs = ps.executeQuery();
	        if(rs.next())
	        {
	        	is = rs.getBinaryStream("Imagen");
	        }
	        bufferedInputStream = new BufferedInputStream(is);
	        bufferedOutputStream = new BufferedOutputStream(os);
	        int i=0;
	        while((i=bufferedInputStream.read()) != -1)
	        {
	        	bufferedOutputStream.write(i);
	        }
		} catch (Exception e) {
			System.out.println("error dentro de RutinasDAO: "+e.getMessage());
		}
    }
	
	public List consultarRutinas() {
		List<Rutinas> listaRutinas = new ArrayList<>();
		String sql = "SELECT * FROM rutinas;";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Rutinas r = new Rutinas();
				r.setIdRutina(rs.getInt(1));
				r.setNombre(rs.getString(2));
				r.setAreaCuerpo(rs.getString(3));
				r.setSeries(rs.getInt(4));
				r.setRepeticiones(rs.getInt(5));
				r.setDescripcion(rs.getString(6));
				r.setImagen(rs.getBinaryStream(7));
				listaRutinas.add(r);
			}

		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}

		return listaRutinas;

	}

	public void eliminar(String id) {
		String sql2 = "SET FOREIGN_KEY_CHECKS=0";
		String sql = "delete from rutinas where idRutina = " + id;
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql2);
			ps.executeUpdate();
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
	}

	public Rutinas listarId(String id) {
		String sql = "select * from rutinas where idRutina=" + id;
		Rutinas r = new Rutinas();
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				r.setIdRutina(rs.getInt(1));
				r.setNombre(rs.getString(2));
				r.setAreaCuerpo(rs.getString(3));
				r.setSeries(rs.getInt(4));
				r.setRepeticiones(rs.getInt(5));
				r.setDescripcion(rs.getString(6));
				r.setImagen(rs.getBinaryStream(7));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return r;
	}

	public int actualizar(int idRutina,String nombre,String areacuerpo, int series,int repeticiones,String descripcion,InputStream imagen) {
		int res = 0;
		String sql = "update rutinas set nombre=?, areacuerpo=?, series=?, repeticiones=?, descripcion=?, Imagen=? where idRutina="+idRutina+"";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1,nombre);
			ps.setString(2,areacuerpo);
			ps.setInt(3,series);
			ps.setInt(4,repeticiones);
			ps.setString(5,descripcion);
			ps.setBlob(6,imagen);
			res = ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("error al actualizar rutinas: "+e.getMessage());
		}
		return res;
	}
}
