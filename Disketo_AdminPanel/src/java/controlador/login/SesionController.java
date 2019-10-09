package controlador.login;


import java.io.Serializable;
import javax.enterprise.context.SessionScoped;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import modelo.Usuario;


/**
 * @author asathor
 */
@Named(value = "sesionController")
@SessionScoped
public class SesionController implements Serializable {

    public void verificarSesion() {
        try {
            FacesContext context = FacesContext.getCurrentInstance();
            Usuario miUsuario = (Usuario) context.getExternalContext().getSessionMap().get("usuario");

            if (miUsuario == null) {
                context.getExternalContext().redirect("../../denegar.xhtml");
            }
        } catch (Exception e) {
        }

    }


}
