package model;

public class ClaseEvento {
	private Asignatura asignatura;
	private Profesor profesor;
	private String diaSemana;
	private Integer horaInicial;
	public Asignatura getAsignatura() {
		return asignatura;
	}
	public void setAsignatura(Asignatura asignatura) {
		this.asignatura = asignatura;
	}
	public Profesor getProfesor() {
		return profesor;
	}
	public void setProfesor(Profesor profesor) {
		this.profesor = profesor;
	}
	public String getDiaSemana() {
		return diaSemana;
	}
	public void setDiaSemana(String diaSemana) {
		this.diaSemana = diaSemana;
	}
	public Integer getHoraInicial() {
		return horaInicial;
	}
	public void setHoraInicial(Integer horaInicial) {
		this.horaInicial = horaInicial;
	}
	
}
