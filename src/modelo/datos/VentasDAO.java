package modelo.datos;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import modelo.beans.Producto;
import modelo.beans.Ventas;

public class VentasDAO {
	PreparedStatement ps;
	ResultSet rs;
	
	public void insertarVentas(int idProducto, String FechaVenta,String Monto,int Cantidad)
	{
		String sql = "insert into Ventas (idProducto, FechaVenta, Monto, Cantidad) values("+idProducto+",'"+FechaVenta+"','"+Monto+"',"+Cantidad+")";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error: "+e.getMessage());
		}
	}

	public List consultarVentas() {
		List<Ventas> listaVentas = new ArrayList<>();
		String sql = "select * from ventas";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Ventas v = new Ventas();
				v.setIdVenta(rs.getInt(1));
				v.setIdProducto(rs.getInt(2));
				v.setFechaVenta(rs.getDate(3));
				v.setMonto(rs.getFloat(4));
				v.setCantidad(rs.getInt(5));
				listaVentas.add(v);
			}

		} catch (Exception e) {
			System.out.println("Error: "+e.getMessage());
		}

		return listaVentas;

	}
	
	public void eliminar(String id){
		String sql2 ="SET FOREIGN_KEY_CHECKS=0";
		String sql = "delete from ventas where idVenta ="+id;
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql2);
			ps.executeUpdate();
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
	}
	
	public Ventas listarId(String id){
		String sql = "select * from ventas where idVenta="+id;
		Ventas v = new Ventas();
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				v.setIdVenta(rs.getInt(1));
				v.setIdProducto(rs.getInt(2));
				v.setFechaVenta(rs.getDate(3));
				v.setMonto(rs.getFloat(4));
				v.setCantidad(rs.getInt(5));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return v;
	}

	public int actualizar(Ventas v){
		int r=0;
		String sql="update ventas set idProducto=?, FechaVenta=?, Monto=?, Cantidad=? where idVenta=?";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1, v.getIdProducto());
			ps.setDate(2, v.getFechaVenta());
			ps.setFloat(3, v.getMonto());
			ps.setInt(4, v.getCantidad());
			ps.setInt(5, v.getIdVenta());
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
