package modelo.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.Out;

import modelo.beans.Producto;
import modelo.beans.Usuario;

public class UsuarioDAO {
	PreparedStatement ps;
	ResultSet rs;

	public void insertarUsuarios(String nombre,String apaterno,String amaterno, String correo,String telefono,String codigo,String nom_usuario,String estatus,String tipo)
	{
		String sql = "call sp_agregar_usuario('"+nombre+"','"+apaterno+"','"+amaterno+"','"+correo+"',"+telefono+",'"+codigo+"','"+nom_usuario+"','"+estatus+"','"+tipo+"')";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error: "+e.getMessage());
		}
	}


	
	public void insertarClientes(String nombre,String apaterno,String amaterno, String correo,String telefono,String codigo,String nom_usuario,String estatus,String tipo,String tipomembresia,String fechaapertura,String fechapago)
	{
		String sql = "call sp_agregar_Clientes('"+nombre+"','"+apaterno+"','"+amaterno+"','"+correo+"',"+telefono+",'"+codigo+"','"+nom_usuario+"','"+estatus+"','"+tipo+"','"+tipomembresia+"','"+fechaapertura+"','"+fechapago+"')";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error: "+e.getMessage());
		}
	}
	
	public Usuario ValidarUsuarios(String nom_usuario, String codigo) {
		Usuario u = new Usuario();
		String sql = "select idUsuario,Nombre,APaterno,AMaterno,Correo,Telefono,Codigo,Nom_Usuario,Estatus,Tipo from usuarios where Nom_Usuario=? and Codigo=?";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1, nom_usuario);
			ps.setString(2, codigo);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				u.setIdUsuario(rs.getInt("idUsuario"));
				u.setNombre(rs.getString("Nombre"));
				u.setAPaterno(rs.getString("APaterno"));
				u.setAMaterno(rs.getString("AMaterno"));
				u.setCorreo(rs.getString("Correo"));
				u.setTelefono(rs.getString("Telefono"));
				u.setCodigo(rs.getString("Codigo"));
				u.setNom_Usuario(rs.getString("Nom_Usuario"));
				u.setEstatus(rs.getString("Estatus"));
				u.setTipo(rs.getString("Tipo"));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			System.out.println("Error al conectar con la BD " + e.getMessage());
		}
		return u;
	}

	public List<Usuario> consultar() {
		ArrayList<Usuario> lista = new ArrayList<>();
		String sql = "select * from usuarios";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Usuario u = new Usuario();
				u.setIdUsuario(rs.getInt(1));
				u.setNombre(rs.getString(2));
				u.setAPaterno(rs.getString(3));
				u.setAMaterno(rs.getString(4));
				u.setCorreo(rs.getString(5));
				u.setTelefono(rs.getString(6));
				u.setCodigo(rs.getString(7));
				u.setNom_Usuario(rs.getString(8));
				u.setEstatus(rs.getString(9));
				u.setTipo(rs.getString(10));
				lista.add(u);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}
	
	public Usuario consultaIndividual(int idUsuario){
		String sql="select * from usuarios where idUsuario=?";
		Usuario u=new Usuario();
		try{
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1, idUsuario);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				u.setIdUsuario(rs.getInt("idUsuario"));
				u.setNombre(rs.getString("Nombre"));
				u.setAPaterno(rs.getString("APaterno"));
				u.setAMaterno(rs.getString("AMaterno"));
				u.setCorreo(rs.getString("Correo"));
				u.setTelefono(rs.getString("Telefono"));
				u.setCodigo(rs.getString("Codigo"));
				u.setNom_Usuario(rs.getString("Nom_Usuario"));
				u.setEstatus(rs.getString("Estatus"));
				u.setTipo(rs.getString("Tipo"));
			}
			ps.close();
			rs.close();
			Conexion.getInstance().cerrar();
			
		}
		catch(SQLException e){
			System.out.println("Error:"+e.getMessage());
		}
		return u;
	}
	
	public void eliminar(String id){
		String sql2 ="SET FOREIGN_KEY_CHECKS=0";
		String sql = "delete from usuarios where idUsuario ="+id;
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql2);
			ps.executeUpdate();
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
	}
	
	public Usuario listarId(String id){
		//System.out.println("Este es el id del usuario: "+id);
		String sql = "select * from usuarios where idUsuario="+id;
		Usuario u = new Usuario();
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				u.setIdUsuario(rs.getInt(1));
				u.setNombre(rs.getString(2));
				u.setAPaterno(rs.getString(3));
				u.setAMaterno(rs.getString(4));
				u.setCorreo(rs.getString(5));
				u.setTelefono(rs.getString(6));
				u.setCodigo(rs.getString(7));
				u.setNom_Usuario(rs.getString(8));
				u.setEstatus(rs.getString(9));
				u.setTipo(rs.getString(10));
			}
		} catch (Exception e) {
			System.out.println("Error en UsuarioDAO listarId");
		}
		return u;
	}

	public int actualizar(Usuario us){
		int r=0;
		String sql="update usuarios set nombre=?, apaterno=?, amaterno=?, correo=?, telefono=?,"
				+ "codigo=?, nom_usuario=?, estatus=?, tipo=? where idUsuario=?";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1, us.getNombre());
			ps.setString(2, us.getAPaterno());
			ps.setString(3, us.getAMaterno());
			ps.setString(4, us.getCorreo());
			ps.setString(5, us.getTelefono());
			ps.setString(6, us.getCodigo());
			ps.setString(7, us.getNom_Usuario());
			ps.setString(8, us.getEstatus());
			ps.setString(9, us.getTipo());
			ps.setInt(10, us.getIdUsuario());
			r=ps.executeUpdate();
			if(r==1){
				r=1;
			}else{
				r=0;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return r;
	}

}
