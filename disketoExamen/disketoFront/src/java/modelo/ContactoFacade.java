package modelo;

import entidades.Contacto;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


/**
 * @author asathor
 */
@Stateless
public class ContactoFacade extends AbstractFacade<Contacto> implements ContactoFacadeLocal {

    @PersistenceContext(unitName = "disketoFrontPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }


    public ContactoFacade() {
        super(Contacto.class);
    }


}
