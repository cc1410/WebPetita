/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package objetos;

/**
 *
 * @author Juan Elberto
 */
public class Usuario {
    
    private int idusuario;
    private String name;
    private String lastname;
    private String mail;
    private String password;
    private int type;

    public Usuario(int idusuario, String name, String lastname, String mail, String password, int type) {
        this.idusuario = idusuario;
        this.name = name;
        this.lastname = lastname;
        this.mail = mail;
        this.password = password;
        this.type = type;
    }

    public Usuario() {
    }
    
    
    

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setType(int type) {
        this.type = type;
    }

    
    
    public int getIdusuario() {
        return idusuario;
    }

    public String getName() {
        return name;
    }

    public String getLastname() {
        return lastname;
    }

    public String getMail() {
        return mail;
    }

    public String getPassword() {
        return password;
    }

    public int getType() {
        return type;
    }
    
    
}
