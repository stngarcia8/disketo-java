package services.restful;

import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.List;
import javax.ejb.Stateless;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import Helper.GeneroHelperClass;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.pojo.Genero;


/**
 * @author asathor
 */
@Stateless
@Path("/genero")
public class GeneroResource {

    @GET
    public String getGeneros() throws JsonProcessingException {
        try {
            List<Genero> miLista = GeneroHelperClass.create().getGeneros();
            ObjectMapper mapper = new ObjectMapper();
            mapper.enable(SerializationFeature.INDENT_OUTPUT);
            return mapper.writeValueAsString(miLista);
        } catch (Exception ex) {
            Logger.getLogger(GeneroResource.class.getName()).log(Level.SEVERE, null, ex);
            return "";
        }
    }


}
