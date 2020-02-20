package modelo.beans;

import java.sql.Date;
import java.sql.Time;

public class Entradas {
	int idEntrada;
	String nom_usuario;
	Time hora_Entrada;
	Date fecha_Entrada;

	public int getIdEntrada() {
		return idEntrada;
	}

	public void setIdEntrada(int idEntrada) {
		this.idEntrada = idEntrada;
	}

	public String getNom_usuario() {
		return nom_usuario;
	}

	public void setNom_usuario(String nom_usuario) {
		this.nom_usuario = nom_usuario;
	}

	public Time getHora_Entrada() {
		return hora_Entrada;
	}

	public void setHora_Entrada(Time hora_Entrada) {
		this.hora_Entrada = hora_Entrada;
	}

	public Date getFecha_Entrada() {
		return fecha_Entrada;
	}

	public void setFecha_Entrada(Date fecha_Entrada) {
		this.fecha_Entrada = fecha_Entrada;
	}

}
