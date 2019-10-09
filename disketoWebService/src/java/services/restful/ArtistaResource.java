package services.restful;

import java.util.List;
import javax.ejb.Stateless;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import Helper.ArtistaHelperClass;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.pojo.Artista;


/**
 * @author asathor
 *
 */
@Stateless
@Path("/artista")
public class ArtistaResource {

    @GET
    public String artistas() throws JsonProcessingException {
        try {
            List<Artista> miLista = ArtistaHelperClass.create().getArtistas();
            ObjectMapper mapper = new ObjectMapper();
            mapper.enable(SerializationFeature.INDENT_OUTPUT);
            return mapper.writeValueAsString(miLista);
        } catch (Exception ex) {
            Logger.getLogger(ArtistaResource.class.getName()).log(Level.SEVERE, null, ex);
            return "";
        }
    }


}
