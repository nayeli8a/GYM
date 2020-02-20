package modelo.beans;

public class Usuario {
	private int idUsuario;
	private String Nombre;
	private String APaterno;
	private String AMaterno;
	private String Correo;
	private String Telefono;
	private String Codigo;
	private String Nom_Usuario;
	private String Estatus;
	private String Tipo;
	
	public String getTipo() {
		return Tipo;
	}
	public void setTipo(String tipo) {
		Tipo = tipo;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	public String getAPaterno() {
		return APaterno;
	}
	public void setAPaterno(String aPaterno) {
		APaterno = aPaterno;
	}
	public String getAMaterno() {
		return AMaterno;
	}
	public void setAMaterno(String aMaterno) {
		AMaterno = aMaterno;
	}
	public String getCorreo() {
		return Correo;
	}
	public void setCorreo(String correo) {
		Correo = correo;
	}
	public String getTelefono() {
		return Telefono;
	}
	public void setTelefono(String telefono) {
		Telefono = telefono;
	}
	public String getCodigo() {
		return Codigo;
	}
	public void setCodigo(String codigo) {
		Codigo = codigo;
	}
	public String getNom_Usuario() {
		return Nom_Usuario;
	}
	public void setNom_Usuario(String nom_Usuario) {
		Nom_Usuario = nom_Usuario;
	}
	public String getEstatus() {
		return Estatus;
	}
	public void setEstatus(String estatus) {
		Estatus = estatus;
	}
	
	
	
}
