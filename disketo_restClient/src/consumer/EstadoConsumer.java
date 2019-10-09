package consumer;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import dto.EstadoDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import service.EstadoService;


/**
 * @author asathor
 */
public class EstadoConsumer {

    private List<EstadoDTO> listaEstado;
    private StringBuilder cadenaJson;
    ObjectMapper mapper;

    private EstadoConsumer() {
        listaEstado = new ArrayList<>();
        mapper = new ObjectMapper();
    }


    public static EstadoConsumer create() {
        return new EstadoConsumer();
    }


    private void obtenerResultados() {
        EstadoService estadoService = new EstadoService();
        cadenaJson = new StringBuilder();
        cadenaJson.append(estadoService.getEstados(String.class));
        estadoService.close();
    }


    private void getEstado() throws IOException {
        obtenerResultados();
        JavaType miTipo = mapper.getTypeFactory().constructCollectionType(List.class, EstadoDTO.class);
        listaEstado = mapper.readValue(cadenaJson.toString(), miTipo);
    }


    public List<EstadoDTO> getEstados() throws IOException {
        getEstado();
        return listaEstado;
    }


    public String getJson() throws JsonProcessingException {
        obtenerResultados();
        mapper.enable(SerializationFeature.INDENT_OUTPUT);
        return mapper.writerWithDefaultPrettyPrinter().writeValueAsString(cadenaJson);
    }


    @Override
    public String toString() {
        Integer cantidad = listaEstado.size();
        return "Estados encontrados: " + cantidad.toString();
    }


}
