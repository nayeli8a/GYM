package modelo.beans;

public class TipoMembresia {
	
	private int idTipo;
	private String Nombre;
	private float Precio;
	private int Vigencia;
	private int TiempoLimite;
	
	public int getIdTipo() {
		return idTipo;
	}
	public void setIdTipo(int idTipo) {
		this.idTipo = idTipo;
	}
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	public float getPrecio() {
		return Precio;
	}
	public void setPrecio(float precio) {
		Precio = precio;
	}
	public int getVigencia() {
		return Vigencia;
	}
	public void setVigencia(int vigencia) {
		Vigencia = vigencia;
	}
	public int getTiempoLimite() {
		return TiempoLimite;
	}
	public void setTiempoLimite(int tiempoLimite) {
		TiempoLimite = tiempoLimite;
	}
	




}
