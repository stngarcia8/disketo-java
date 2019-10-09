package controlador.jfs;


import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import modelo.Discografia;



/**
  * @author asathor
 */
@Stateless
public class DiscografiaFacade extends AbstractFacade<Discografia> {

    @PersistenceContext(unitName = "Disketo_AdminPanelPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DiscografiaFacade() {
        super(Discografia.class);
    }
    
}
