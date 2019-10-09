package service;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;


/** Jersey REST client generated for REST resource:we [genero]<br>
 * USAGE:
 * <pre>
 *        GeneroClient client = new GeneroClient();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 * @author asathor
 */
public class GeneroService {

    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://localhost:8080/disketoWebService/webresources/";

    public GeneroService() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("genero");
    }


    /**
     * @param responseType Class representing the response
     * @return response object (instance of responseType class)
     */
    public <T> T getGeneros(Class<T> responseType) throws ClientErrorException {
        return webTarget.request().get(responseType);
    }


    public void close() {
        client.close();
    }


}
