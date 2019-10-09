package consumer;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import dto.ArtistaDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import service.ArtistService;


/**
 * @author asathor
 */
public class ArtistConsumer {

    private List<ArtistaDTO> listaArtista;
    private StringBuilder cadenaJson;
    ObjectMapper mapper;

    private ArtistConsumer() {
        listaArtista = new ArrayList<>();
        mapper = new ObjectMapper();
    }


    public static ArtistConsumer create() {
        return new ArtistConsumer();
    }


    private void obtenerResultados() {
        ArtistService artistService = new ArtistService();
        cadenaJson = new StringBuilder();
        cadenaJson.append(artistService.artistas(String.class));
        artistService.close();
    }


    private void getArtists() throws IOException {
        obtenerResultados();
        JavaType miTipo = mapper.getTypeFactory().constructCollectionType(List.class, ArtistaDTO.class);
        listaArtista = mapper.readValue(cadenaJson.toString(), miTipo);
    }


    public List<ArtistaDTO> getArtistas() throws IOException {
        getArtists();
        return listaArtista;
    }


    public String getJson() throws JsonProcessingException {
        obtenerResultados();
        mapper.enable(SerializationFeature.INDENT_OUTPUT);
        return mapper.writerWithDefaultPrettyPrinter().writeValueAsString(cadenaJson);
    }


    @Override
    public String toString() {
        Integer cantidad = listaArtista.size();
        return "Artistas encontrados: " + cantidad.toString();
    }


}
