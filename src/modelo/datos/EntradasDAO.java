package modelo.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import modelo.beans.Entradas;
import modelo.beans.Producto;
import modelo.beans.Ventas;

public class EntradasDAO {
	PreparedStatement ps;
	ResultSet rs;
	
	public void insertarEntradas(String nom_usuario,String HoraEntrada, String FechaEntrada )
	{
		String sql = "insert into entradas (Nom_Usuario,Hora_entrada,Fecha_entrada) values('"+nom_usuario+"','"+HoraEntrada+"','"+FechaEntrada+"')";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error: "+e.getMessage());
		}
	}
	
	public List consultarEntradas() {
		List<Entradas> listaEntradas = new ArrayList<>();
		String sql = "select * from entradas";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Entradas e = new Entradas();
				e.setIdEntrada(rs.getInt(1));
				e.setNom_usuario(rs.getString(2));
				e.setHora_Entrada(rs.getTime(3));
				e.setFecha_Entrada(rs.getDate(4));
				listaEntradas.add(e);
			}

		} catch (Exception e) {
			System.out.println("Error: "+e.getMessage());
		}

		return listaEntradas;

	}
	
	public void eliminar(String id){
		String sql2 ="SET FOREIGN_KEY_CHECKS=0";
		String sql = "delete from entradas where idEntrada ="+id;
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql2);
			ps.executeUpdate();
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
	}
	
	public Entradas listarId(String id){
		String sql = "select * from entradas where idEntrada="+id;
		Entradas e = new Entradas();
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				e.setIdEntrada(rs.getInt(1));
				e.setNom_usuario(rs.getString(2));
				e.setHora_Entrada(rs.getTime(3));
				e.setFecha_Entrada(rs.getDate(4));
			}
		} catch (Exception ex) {
			// TODO: handle exception
			System.out.println("Error en  entradasdao listar");
		}
		return e;
	}

	public int actualizar(Entradas e){
		int r=0;
		String sql="update entradas set Nom_usuario=?, Hora_entrada=?, Fecha_entrada=? where idEntrada=?";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1, e.getNom_usuario());
			ps.setTime(2, e.getHora_Entrada());
			ps.setDate(3, e.getFecha_Entrada());
			ps.setInt(4, e.getIdEntrada());
			r=ps.executeUpdate();
			if(r==1){
				r=1;
			}else{
				r=0;
			}
		} catch (Exception ex) {
			// TODO: handle exception
			System.out.println("Error en entradasdao actualizar");
		}
		return r;
	}
}
