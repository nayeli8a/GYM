package modelo.datos;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import modelo.beans.Producto;

public class ProductoDAO {
	PreparedStatement ps;
	ResultSet rs;

	
	public void insertarProducto(String Nombre, String Precio, int Stock, String Descripcion,InputStream imagen)
	{
		String sql = "insert into Producto (Nombre,Precio,Stock,Descripcion,Imagen) values(?,?,?,?,?)";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1,Nombre);
			ps.setString(2,Precio);
			ps.setInt(3,Stock);
			ps.setString(4,Descripcion);
			ps.setBlob(5,imagen);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error: "+e.getMessage());
		}
	}
	
	public void ListarImagen(int idProducto,HttpServletResponse response)
    {
        String sql = "select * from Producto where idProducto = "+idProducto;
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
			System.out.println("error dentro de ProductoDAO: "+e.getMessage());
		}
    }
	
	public List consultarProducto() {
		List<Producto> listaP = new ArrayList<>();
		String sql = "select * from producto";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Producto p = new Producto();
				p.setIdProducto(rs.getInt(1));
				p.setNombre(rs.getString(2));
				p.setPrecio(rs.getFloat(3));
				p.setStock(rs.getInt(4));
				p.setDescripcion(rs.getString(5));
				p.setImagen(rs.getBinaryStream(6));
				listaP.add(p);
			}
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
		return listaP;
	}

	public void eliminar(String id){
		String sql2 ="SET FOREIGN_KEY_CHECKS=0";
		String sql = "delete from producto where idProducto ="+id;
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql2);
			ps.executeUpdate();
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
	}
	
	public Producto listarId(String id){
		String sql = "select * from producto where idProducto="+id;
		Producto p = new Producto();
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				p.setIdProducto(rs.getInt(1));
				p.setNombre(rs.getString(2));
				p.setPrecio(rs.getFloat(3));
				p.setStock(rs.getInt(4));
				p.setDescripcion(rs.getString(5));
				p.setImagen(rs.getBinaryStream(6));
			}
		} catch (Exception e) {
			System.out.println("error dentro de productoDAO "+e.getMessage());
		}
		return p;
	}

	public int actualizar(int idProducto,String Nombre, String Precio, int Stock, String Descripcion,InputStream imagen){
		int r=0;
		String sql="update producto set Nombre=?, Precio=?, Stock=?, Descripcion=?, Imagen=? where idProducto = "+idProducto+"";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1,Nombre);
			ps.setString(2,Precio);
			ps.setInt(3,Stock);
			ps.setString(4,Descripcion);
			ps.setBlob(5,imagen);
			r=ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("Error al actualizar el ProductoDAO"+e.getMessage());
		}
		return r;
	}

	
}
