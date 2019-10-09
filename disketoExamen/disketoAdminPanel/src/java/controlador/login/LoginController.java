package controlador.login;

import java.io.IOException;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import static javax.faces.context.FacesContext.getCurrentInstance;
import modelo.pojos.Usuario;


/**
 * @author asathor
 */
@Named(value = "loginController")
@SessionScoped
public class LoginController implements Serializable {

    @EJB
    UsuarioFacLocal miUsuarioFacade;

    // Atributos.
    private Usuario miUsuario;

    @PostConstruct
    public void init() {
        this.miUsuario = new Usuario();
    }


    // Constructor.
    public LoginController() {
    }


    // Accesadores.
    public Usuario getUsuario() {
        return this.miUsuario;
    }


    public String getNombreUsuario() {
        Usuario miUsuarioSesion = (Usuario) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        return miUsuarioSesion.toString();
    }


    public boolean isLogeado() {
        Usuario miUsuarioSesion = (Usuario) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        return (miUsuarioSesion != null ? true : false);
    }


    // Seteador.
    public void setUsuario(Usuario usuario) {
        this.miUsuario = usuario;
    }


    // Validar el login.
    public String login() {
        Usuario miUsuarioEncontrado;
        String miUrl = "index.xhtml";
        try {
            miUsuarioEncontrado = this.miUsuarioFacade.login(this.miUsuario);
            if (miUsuarioEncontrado != null) {
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("usuario", miUsuarioEncontrado);
                miUrl = "/disketo/inicio/inicio.xhtml?faces-redirect=true";
            } else {
                this.enviarMensajes("Nombre de usuario o contraseña incorrecta.");
            }
        } catch (Exception e) {
            this.enviarMensajes("Atención!, Eror inesperado en Disketo.");
        }
        return miUrl;
    }


    private void enviarMensajes(String miMensaje) {
        FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Atención!", miMensaje));
    }


    public void logout() {
        ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();
        externalContext.invalidateSession();
        try {
            externalContext.redirect("http://localhost:8080/disketoFront/");
        } catch (IOException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    public void redireccionar() {
        try {
            ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();
            externalContext.redirect("http://localhost:8080/disketoFront/");
        } catch (IOException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
