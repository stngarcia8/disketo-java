package model.sesionbeans;


import java.util.Map;
import entity.User;
import java.util.List;
import javax.ejb.Local;


/**
 *
 * @author asathor
 */
@Local
public interface UserFacadeLocal {

    void create(User user);


    void edit(User user);


    void remove(User user);


    User find(Object id);


    List<User> findAll();


    List<User> findRange(int[] range);


    int count();


    List<User> findNamedQuery(String namedQueryName);


    List<User> findNamedQuery(String namedQueryName, Map<String, String> parameters);


    List<User> findNamedQuery(String namedQueryName, String parameterName, String parameterValue);


}
