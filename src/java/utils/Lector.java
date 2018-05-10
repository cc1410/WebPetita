package utils;

import java.io.BufferedReader;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import model.Alumno;
import model.Profesor;
import model.Usuario;

public class Lector {

    private String path;

    public Lector(String path) {
        this.path = path;
    }
    //tipo, nameAlumno, lastnameAlumno, usernameAlumno, passwordAlumno, dniAlumno, emailAlumno,    tipo(0=admin, 1=profesor, 2=alumno)

    public List<Usuario> insertMasiveUsuario(Integer tipo) throws IOException {
        List<Usuario> p = new ArrayList<>();
        FileReader entra = new FileReader(path);
        BufferedReader fentra = new BufferedReader(entra);
        String line;
        if (tipo.equals(1)) {
            while ((line = fentra.readLine()) != null) {
                Profesor a = new Profesor();
                String[] aux = line.split(";");
                a.setNombre(aux[0]);
                a.setApellido(aux[1]);
                a.setPassword(aux[2]);
                a.setDni(aux[3]);
                a.setEmail(aux[4]);
                if (aux[3].length() != 9) {
                    System.out.println("ERROR: DNI invalido");
                } else {
                    p.add(a);
                }
            }
        } else if (tipo.equals(2)) {
            while ((line = fentra.readLine()) != null) {
                Alumno a = new Alumno();
                String[] aux = line.split(";");
                a.setNombre(aux[0]);
                a.setApellido(aux[1]);
                a.setPassword(aux[2]);
                a.setDni(aux[3]);
                a.setEmail(aux[4]);
                if (aux[3].length() != 9) {
                    System.out.println("ERROR: DNI invalido");
                } else {
                    p.add(a);
                }
            }
        }
        fentra.close();
        return p;
    }
}
