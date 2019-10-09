package Helper;

import java.util.List;
import model.pojo.Estado;


/**
 * @author asathor
 */
public class EstadoHelperClass extends SelectQuery implements EstadoHelper {

    private EstadoHelperClass() {
        super();
        queryFrom = "FROM Estado e ";
        queryOrderBy = "ORDER BY e.nombreEstado ";
    }


    public static EstadoHelper create() {
        return new EstadoHelperClass();
    }


    @Override
    public List getEstados() throws Exception {
        List<Estado> myList;
        querySet();
        myList = myQuery.list();
        queryClose();
        return myList;
    }


}
