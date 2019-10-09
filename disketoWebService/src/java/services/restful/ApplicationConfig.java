package services.restful;

import java.util.Set;
import javax.ws.rs.core.Application;


/**
 * @author asathor
 */
@javax.ws.rs.ApplicationPath("webresources")
public class ApplicationConfig extends Application {

    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> resources = new java.util.HashSet<>();
        addRestResourceClasses(resources);
        return resources;
    }


    /**
     * Do not modify addRestResourceClasses() method. It is automatically populated with all resources defined in the project. If required, comment out calling this method in getClasses().
     */
    private void addRestResourceClasses(Set<Class<?>> resources) {
        resources.add(services.restful.ArtistaByNameResource.class);
        resources.add(services.restful.ArtistaResource.class);
        resources.add(services.restful.EstadoResource.class);
        resources.add(services.restful.GeneroResource.class);
    }


}
