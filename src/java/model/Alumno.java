package model;

public class Alumno extends Usuario{
	private Clase clase;
	private Expediente expediente;
	public Alumno () {
		super();
	}
	public Clase getClase() {
		return clase;
	}
	public void setClase(Clase clase) {
		this.clase = clase;
	}
	public Expediente getExpediente() {
		return expediente;
	}
	public void setExpediente(Expediente expediente) {
		this.expediente = expediente;
	}
	
}
