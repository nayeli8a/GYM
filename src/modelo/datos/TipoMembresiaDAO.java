package modelo.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import modelo.beans.TipoMembresia;

public class TipoMembresiaDAO {
	PreparedStatement ps;
	ResultSet rs;

	public void insertarMembresia(String Nombre, float Precio, int Vigencia, int TiempoLimite)
	{
		String sql = "insert into tipomembresia (Nombre,Precio,Vigencia,TiempoLimite) values('"+Nombre+"','"+Precio+"','"+Vigencia+"','"+TiempoLimite+"')";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error: "+e.getMessage());
		}
	}
	
	public List consultarMembresia() {
		List<TipoMembresia> listaM = new ArrayList<>();
		String sql = "select * from tipomembresia";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				TipoMembresia m = new TipoMembresia();
				m.setIdTipo(rs.getInt(1));
				m.setNombre(rs.getString(2));
				m.setPrecio(rs.getFloat(3));
				m.setVigencia(rs.getInt(4));
				m.setTiempoLimite(rs.getInt(5));
				listaM.add(m);
			}
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
		return listaM;
	}

	public void eliminar(String id){
		String sql2 ="SET FOREIGN_KEY_CHECKS=0";
		String sql = "delete from tipomembresia where idTipo ="+id;
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql2);
			ps.executeUpdate();
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
	}
	
	public TipoMembresia listarId(String id){
		String sql = "select * from tipomembresia where idTipo="+id;
		TipoMembresia m = new TipoMembresia();
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				m.setIdTipo(rs.getInt(1));
				m.setNombre(rs.getString(2));
				m.setPrecio(rs.getFloat(3));
				m.setVigencia(rs.getInt(4));
				m.setTiempoLimite(rs.getInt(5));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return m;
	}

	public int actualizar(TipoMembresia m){
		int r=0;
		String sql="update tipomembresia set Nombre=?, Precio=?, Vigencia=?, TiempoLimite=? where idTipo=?";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1, m.getNombre());
			ps.setFloat(2, m.getPrecio());
			ps.setInt(3, m.getVigencia());
			ps.setInt(4, m.getTiempoLimite());
			ps.setInt(5, m.getIdTipo());
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
