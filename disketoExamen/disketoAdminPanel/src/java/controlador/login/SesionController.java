package controlador.login;

import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import javax.faces.context.FacesContext;
import modelo.pojos.Usuario;


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
