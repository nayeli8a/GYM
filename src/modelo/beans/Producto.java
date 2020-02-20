package modelo.beans;

import java.io.InputStream;

public class Producto {
	private int idProducto;
	private String Nombre;
	private float Precio;
	private int Stock;
	private String Descripcion;
	private InputStream Imagen;
	
	
	public InputStream getImagen() {
		return Imagen;
	}
	public void setImagen(InputStream imagen) {
		Imagen = imagen;
	}
	public int getIdProducto() {
		return idProducto;
	}
	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
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
	public int getStock() {
		return Stock;
	}
	public void setStock(int stock) {
		Stock = stock;
	}
	public String getDescripcion() {
		return Descripcion;
	}
	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}
	


}
