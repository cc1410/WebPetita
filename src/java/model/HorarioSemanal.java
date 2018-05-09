package model;

import java.util.List;

public class HorarioSemanal {
	private List<ClaseEvento> clases;
	private Clase clase;
	public List<ClaseEvento> getClases() {
		return clases;
	}
	public void setClases(List<ClaseEvento> clases) {
		this.clases = clases;
	}
	public Clase getClase() {
		return clase;
	}
	public void setClase(Clase clase) {
		this.clase = clase;
	}
	
}
