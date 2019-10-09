package consumer;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import dto.GeneroDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import service.GeneroService;


/**
 * @author asathor
 */
public class GeneroConsumer {

    private List<GeneroDTO> listaGenero;
    private StringBuilder cadenaJson;
    ObjectMapper mapper;

    private GeneroConsumer() {
        listaGenero = new ArrayList<>();
        mapper = new ObjectMapper();
    }


    public static GeneroConsumer create() {
        return new GeneroConsumer();
    }


    private void obtenerResultados() {
        GeneroService generoService = new GeneroService();
        cadenaJson = new StringBuilder();
        cadenaJson.append(generoService.getGeneros(String.class));
        generoService.close();
    }


    private void getGenero() throws IOException {
        obtenerResultados();
        JavaType miTipo = mapper.getTypeFactory().constructCollectionType(List.class, GeneroDTO.class);
        listaGenero = mapper.readValue(cadenaJson.toString(), miTipo);
    }


    public List<GeneroDTO> getGeneros() throws IOException {
        getGenero();
        return listaGenero;
    }


    public String getJson() throws JsonProcessingException {
        obtenerResultados();
        mapper.enable(SerializationFeature.INDENT_OUTPUT);
        return mapper.writerWithDefaultPrettyPrinter().writeValueAsString(cadenaJson);
    }


    @Override
    public String toString() {
        Integer cantidad = listaGenero.size();
        return "Generos encontrados: " + cantidad.toString();
    }


}
