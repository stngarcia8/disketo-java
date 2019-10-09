package controlador.login;


import controlador.jfs.UsuarioFacadeLocal;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import modelo.Usuario;


/**
 * @author asathor
 */
@Named(value = "loginController")
@SessionScoped
public class LoginController implements Serializable {

    @EJB
    UsuarioFacadeLocal miUsuarioFacade;

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
        FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Atención!", "Contact admin."));
    }


    public String logout() {
        FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
        return "/index.xhtml";
    }


}
