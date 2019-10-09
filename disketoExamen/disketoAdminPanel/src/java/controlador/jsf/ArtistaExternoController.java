package controlador.jsf;

import java.io.IOException;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import modelo.dto.ArtistaDTO;
import servicios.consumidorRest.ArtistaConsumer;


/**
 * @author asathor
 */
@Named(value = "artistaExternoController")
@SessionScoped
public class ArtistaExternoController implements Serializable {

    private List<ArtistaDTO> items = null;
    private ArtistaDTO selected;
    private String resultado = "Cargando artistas externos...";

    public ArtistaExternoController() {
    }


    public ArtistaDTO getSelected() {
        return selected;
    }


    public void setSelected(ArtistaDTO selected) {
        this.selected = selected;
    }


    public String getResultado() {
        return resultado;
    }


    public List<ArtistaDTO> getItems() {
        if (items == null) {
            ArtistaConsumer artistaConsumer = ArtistaConsumer.crear();
            try {
                items = artistaConsumer.getArtistas();
                resultado = artistaConsumer.toString();
            } catch (IOException ex) {
                items = new ArrayList<>();
                resultado = "Error: " + ex.getMessage();
            }
        }
        return items;
    }


}
