package exporterbbdd;

import excepciones.Excepciones;

public class ExporterToSQL {
	public boolean execute() throws Excepciones {
		if(!Ping.ping())
			throw new Excepciones("ERROR no tienes internet");
		return true;
	}
}
