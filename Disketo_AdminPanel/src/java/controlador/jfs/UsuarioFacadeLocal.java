package controlador.jfs;


import java.util.List;
import javax.ejb.Local;
import modelo.Usuario;


/**
 * @author asathor
 */
@Local
public interface UsuarioFacadeLocal {

    void create(Usuario usuario);


    void edit(Usuario usuario);


    void remove(Usuario usuario);


    Usuario find(Object id);


    List<Usuario> findAll();


    List<Usuario> findRange(int[] range);


    int count();


    Usuario login(Usuario usuario) throws Exception;


}
