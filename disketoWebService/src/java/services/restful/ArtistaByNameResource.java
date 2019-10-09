package services.restful;

import java.util.List;
import javax.ejb.Stateless;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import Helper.ArtistaHelperClass;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.pojo.Artista;


/**
 * @author asathor
 */
@Stateless
@Path("/artistapornombre")
public class ArtistaByNameResource {

    @GET
    public String artistaByName(@QueryParam("nombre") String nombre) throws JsonProcessingException {
        try {
            List<Artista> miLista = ArtistaHelperClass.create().getArtistaByName(nombre);
            ObjectMapper mapper = new ObjectMapper();
            mapper.enable(SerializationFeature.INDENT_OUTPUT);
            return mapper.writeValueAsString(miLista);
        } catch (Exception ex) {
            Logger.getLogger(ArtistaByNameResource.class.getName()).log(Level.SEVERE, null, ex);
            return "Error: " + ex.getMessage();
        }
    }


}
