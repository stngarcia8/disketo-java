package services.websocket;

import Helper.EstadoHelperClass;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.Session;
import model.pojo.Estado;


/**
 * @author asathor
 */
@ServerEndpoint("/dep/estados")
public class EstadoEndpoint {

    private Session sesionActual;

    @OnOpen
    public void onOpen(final Session session, EndpointConfig ec) {
        sesionActual = session;
    }


    @OnClose
    public void onClose() {
        if (sesionActual != null) {
            try {
                sesionActual.close();
            } catch (IOException ex) {
                Logger.getLogger(ArtistaEndpoint.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }


    @OnMessage
    public void onMessage(String message) throws Exception {
        if (sesionActual != null) {
            try {
                sesionActual.getBasicRemote().sendText(this.getEstados());
            } catch (IOException ex) {
                Logger.getLogger(ArtistaEndpoint.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }


    @OnError
    public void onError(Throwable t) {
    }


    private String getEstados() throws Exception {
        List<Estado> miLista;
        try {
            miLista = EstadoHelperClass.create().getEstados();
            ObjectMapper mapper = new ObjectMapper();
            mapper.enable(SerializationFeature.INDENT_OUTPUT);
            return mapper.writeValueAsString(miLista);
        } catch (JsonProcessingException ex) {
            return "";
        }
    }


}
