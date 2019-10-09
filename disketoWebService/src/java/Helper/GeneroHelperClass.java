package Helper;

import java.util.List;
import model.pojo.Genero;


/**
 * @author asathor
 */
public class GeneroHelperClass extends SelectQuery implements GeneroHelper {

    private GeneroHelperClass() {
        super();
        queryFrom = "FROM Genero g ";
        queryOrderBy = "ORDER BY g.nombreGenero ";
    }


    public static GeneroHelper create() {
        return new GeneroHelperClass();
    }


    @Override
    public List getGeneros() throws Exception {
        querySet();
        List<Genero> myList = myQuery.list();
        queryClose();
        return myList;
    }


}
