package service;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Form;


/** Jersey REST client generated for REST resource:we [artistapornombre]<br>
 * USAGE:
 * <pre>
 *        ArtistaPorNombreClient client = new ArtistaPorNombreClient();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 * @author asathor
 */
public class ArtistByNameService {

    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://localhost:8080/disketoWebService/webresources/";

    public ArtistByNameService() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("artistapornombre");
    }


    /**
     * @param responseType Class representing the response
     * @param nombre       query parameter
     * @return response object (instance of responseType class)
     */
    public <T> T artistaByName(Class<T> responseType, String nombre) throws ClientErrorException {
        String[] queryParamNames = new String[]{"nombre"};
        String[] queryParamValues = new String[]{nombre};
        ;
        javax.ws.rs.core.Form form = getQueryOrFormParams(queryParamNames, queryParamValues);
        javax.ws.rs.core.MultivaluedMap<String, String> map = form.asMap();
        for (java.util.Map.Entry<String, java.util.List<String>> entry : map.entrySet()) {
            java.util.List<String> list = entry.getValue();
            String[] values = list.toArray(new String[list.size()]);
            webTarget = webTarget.queryParam(entry.getKey(), (Object[]) values);
        }
        return webTarget.request().get(responseType);
    }


    private Form getQueryOrFormParams(String[] paramNames, String[] paramValues) {
        Form form = new javax.ws.rs.core.Form();
        for (int i = 0; i < paramNames.length; i++) {
            if (paramValues[i] != null) {
                form = form.param(paramNames[i], paramValues[i]);
            }
        }
        return form;
    }


    public void close() {
        client.close();
    }


}
