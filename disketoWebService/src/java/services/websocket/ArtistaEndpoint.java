package services.websocket;

import Helper.ArtistaHelperClass;
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
import model.pojo.Artista;
import javax.websocket.Session;


/**
 * @author asathor
 */
@ServerEndpoint("/dep/artistas")
public class ArtistaEndpoint {

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
    public void onMessage(String message
    ) throws Exception {
        if (sesionActual != null) {
            try {
                sesionActual.getBasicRemote().sendText(this.getArtistas());
            } catch (IOException ex) {
                Logger.getLogger(ArtistaEndpoint.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }


    @OnError
    public void onError(Throwable t) {
    }


    private String getArtistas() throws Exception {
        List<Artista> miLista;
        try {
            miLista = ArtistaHelperClass.create().getArtistas();
            ObjectMapper mapper = new ObjectMapper();
            mapper.enable(SerializationFeature.INDENT_OUTPUT);
            return mapper.writeValueAsString(miLista);
        } catch (JsonProcessingException ex) {
            return "";
        }
    }


}
