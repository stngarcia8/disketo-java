package services.restful;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import java.util.List;
import javax.ejb.Stateless;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import Helper.EstadoHelperClass;
import model.pojo.Estado;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 * @author asathor
 */
@Stateless
@Path("/estado")
public class EstadoResource {

    @GET
    public String getEstados() throws JsonProcessingException {
        try {
            List<Estado> miLista = EstadoHelperClass.create().getEstados();
            ObjectMapper mapper = new ObjectMapper();
            mapper.enable(SerializationFeature.INDENT_OUTPUT);
            return mapper.writeValueAsString(miLista);
        } catch (Exception ex) {
            Logger.getLogger(EstadoResource.class.getName()).log(Level.SEVERE, null, ex);
            return "";
        }
    }


}
