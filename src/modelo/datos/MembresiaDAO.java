package modelo.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import modelo.beans.*;

public class MembresiaDAO {
	PreparedStatement ps;
	ResultSet rs;
	
	public Date obtenerFechaPago(int idUsuario) {
		String sql = "call sp_obtener_FechaProximoPago("+idUsuario+",@val);";
		Date fechapago=null;
		
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				fechapago = rs.getDate(1);
			}

		} catch (Exception e) {
			System.out.println("Error: "+e.getMessage());
		}
		return fechapago;

	}
}
