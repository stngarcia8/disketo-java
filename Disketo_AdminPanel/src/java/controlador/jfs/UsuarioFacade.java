package controlador.jfs;


import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import modelo.Usuario;


/**
 * @author asathor
 */
@Stateless
public class UsuarioFacade extends AbstractFacade<Usuario> implements UsuarioFacadeLocal {

    @PersistenceContext(unitName = "Disketo_AdminPanelPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }


    public UsuarioFacade() {
        super(Usuario.class);
    }


    @Override
    public Usuario login(Usuario usuario) throws Exception {
        Usuario miUsuario = null;
        String consulta;
        try {
            consulta = "FROM Usuario u WHERE u.email = ?1 and u.password = ?2";
            Query query = em.createQuery(consulta);
            query.setParameter(1, usuario.getEmail());
            query.setParameter(2, usuario.getPassword());
            List<Usuario> lista = query.getResultList();
            if (!lista.isEmpty()) {
                miUsuario = lista.get(0);
            }
        } catch (Exception e) {
            throw e;
        }
        return miUsuario;
    }


}
