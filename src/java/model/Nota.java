package model;

import java.util.Date;

public class Nota {
	private AsignaturaMatricula asignaturaMarticula;
	private String comentario;
	private Date fecha;
	private String estado;
	
	
	public AsignaturaMatricula getAsignaturaMarticula() {
		return asignaturaMarticula;
	}
	public void setAsignaturaMarticula(AsignaturaMatricula asignaturaMarticula) {
		this.asignaturaMarticula = asignaturaMarticula;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
}
