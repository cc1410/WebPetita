package model;

import java.util.List;

public class Calendario {
	private Clase clase;
	private List<EventoCalendario> eventos;
	private Integer anyo;
	public Clase getClase() {
		return clase;
	}
	public void setClase(Clase clase) {
		this.clase = clase;
	}
	public List<EventoCalendario> getEventos() {
		return eventos;
	}
	public void setEventos(List<EventoCalendario> eventos) {
		this.eventos = eventos;
	}
	public Integer getAnyo() {
		return anyo;
	}
	public void setAnyo(Integer anyo) {
		this.anyo = anyo;
	}
	
}
