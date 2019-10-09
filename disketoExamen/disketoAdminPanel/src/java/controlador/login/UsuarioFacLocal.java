/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.login;


import java.util.List;
import javax.ejb.Local;
import modelo.pojos.Usuario;


/**
 *
 * @author asathor
 */
@Local
public interface UsuarioFacLocal {

    void create(Usuario usuario);


    void edit(Usuario usuario);


    void remove(Usuario usuario);


    Usuario find(Object id);


    List<Usuario> findAll();


    List<Usuario> findRange(int[] range);


    int count();


    Usuario login(Usuario usuario) throws Exception;


}
