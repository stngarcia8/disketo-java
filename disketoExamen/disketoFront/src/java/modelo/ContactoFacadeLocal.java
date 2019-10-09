package modelo;

import entidades.Contacto;
import java.util.List;
import javax.ejb.Local;


/**
 * @author asathor
 */
@Local
public interface ContactoFacadeLocal {

    void create(Contacto contacto);


    void edit(Contacto contacto);


    void remove(Contacto contacto);


    Contacto find(Object id);


    List<Contacto> findAll();


    List<Contacto> findRange(int[] range);


    int count();


}
