package controlador.jfs;


import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import modelo.Artista;


/**
 * @author asathor
 */
@Stateless
public class ArtistaFacade extends AbstractFacade<Artista> {

    @PersistenceContext(unitName = "Disketo_AdminPanelPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }


    public ArtistaFacade() {
        super(Artista.class);
    }


}
