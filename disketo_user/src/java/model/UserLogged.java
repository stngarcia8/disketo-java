package model;

// Importaciones.

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 *
 * @author asathor
 */
public class UserLogged {

    private String userName;
    private String dateLogin;
    private boolean logged;

// Contructores
    private UserLogged() {
        this.signOut();
    }

// Constructores implicitos

    public static UserLogged createUserLog() {
        return new UserLogged();
    }


    /*
* getCurrentDate()
* Devuelve la fecha y hora actual.
     */
    private String getCurrentDate() {
        Date myDate = new Date();
        DateFormat myFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        return myFormat.format(myDate);
    }


    // Accesadores y mutadores.
    public String getUserName() {
        return userName;
    }


    public String getDateLogin() {
        return dateLogin;
    }


    public boolean isLogged() {
        return logged;
    }


    public void signUp(String userName) {
        this.userName = userName;
        this.dateLogin = this.getCurrentDate();
        this.logged = true;
    }


    public void signOut() {
        this.userName = "Anonimo";
        this.dateLogin = this.getCurrentDate();
        this.logged = false;
    }


}
