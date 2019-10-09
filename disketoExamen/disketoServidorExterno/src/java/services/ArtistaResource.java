package services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import helpers.ArtistaHelperClass;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.core.MediaType;
import pojos.Artista;


/**
 * REST Web Service
 *
 * @author asathor
 */
@Stateless
@Path("/artista")
public class ArtistaResource {

    @Context
    private UriInfo context;

    /** Creates a new instance of ArtistaResource */
    public ArtistaResource() {
    }


    /**
     * Retrieves representation of an instance of services.ArtistaResource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getArtistas() {
        try {
            List<Artista> miLista = ArtistaHelperClass.create().getArtistas();
            ObjectMapper mapper = new ObjectMapper();
            mapper.enable(SerializationFeature.INDENT_OUTPUT);
            return mapper.writeValueAsString(miLista);
        } catch (Exception ex) {
            Logger.getLogger(ArtistaResource.class.getName()).log(Level.SEVERE, null, ex);
            return "Error: " + ex.getMessage();
        }
    }


    /**
     * PUT method for updating or creating an instance of ArtistaResource
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content) {
    }


}
