/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.jsf;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import modelo.pojos.Discografia;


/**
 *
 * @author asathor
 */
@Stateless
public class DiscografiaFacade extends AbstractFacade<Discografia> {

    @PersistenceContext(unitName = "disketoAdminPanelPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DiscografiaFacade() {
        super(Discografia.class);
    }

}
