package modelo.beans;

import java.io.InputStream;

public class Rutinas {
	int idRutina;
	String Nombre;
	String AreaCuerpo;
	int Series;
	int Repeticiones;
	String Descripcion;
	InputStream Imagen;
	

	public InputStream getImagen() {
		return Imagen;
	}

	public void setImagen(InputStream imagen) {
		Imagen = imagen;
	}

	public int getIdRutina() {
		return idRutina;
	}

	public void setIdRutina(int idRutina) {
		this.idRutina = idRutina;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	public String getAreaCuerpo() {
		return AreaCuerpo;
	}

	public void setAreaCuerpo(String areaCuerpo) {
		AreaCuerpo = areaCuerpo;
	}

	public int getSeries() {
		return Series;
	}

	public void setSeries(int series) {
		Series = series;
	}

	public int getRepeticiones() {
		return Repeticiones;
	}

	public void setRepeticiones(int repeticiones) {
		Repeticiones = repeticiones;
	}

	public String getDescripcion() {
		return Descripcion;
	}

	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}

}
