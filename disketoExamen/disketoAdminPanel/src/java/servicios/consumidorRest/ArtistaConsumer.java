package servicios.consumidorRest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import modelo.dto.ArtistaDTO;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;


/**
 * @author asathor
 */
public class ArtistaConsumer {

    private List<ArtistaDTO> listaArtista;
    private StringBuilder cadenaJson;
    ObjectMapper mapper;

    private ArtistaConsumer() {
        listaArtista = new ArrayList<>();
        mapper = new ObjectMapper();
    }


    public static ArtistaConsumer crear() {
        return new ArtistaConsumer();
    }


    private void obtenerResultados() {
        ArtistaService artistaService = new ArtistaService();
        cadenaJson = new StringBuilder();
        cadenaJson.append(artistaService.getArtistas());
        artistaService.close();
    }


    private void getArtista() throws IOException {
        obtenerResultados();
        JavaType miTipo = mapper.getTypeFactory().constructCollectionType(List.class, ArtistaDTO.class);
        listaArtista = mapper.readValue(cadenaJson.toString(), miTipo);
    }


    public List<ArtistaDTO> getArtistas() throws IOException {
        getArtista();
        return listaArtista;
    }


    @Override
    public String toString() {
        Integer cantidad = listaArtista.size();
        return "Artistas encontrados: " + cantidad.toString();
    }


}
