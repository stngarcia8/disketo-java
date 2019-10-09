package controlador.jfs;


import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import modelo.Formato;


/**
 * @author asathor
 */
@Stateless
public class FormatoFacade extends AbstractFacade<Formato> {

    @PersistenceContext(unitName = "Disketo_AdminPanelPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }


    public FormatoFacade() {
        super(Formato.class);
    }


}
