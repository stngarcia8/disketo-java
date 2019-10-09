package Helper;

import java.util.List;
import model.pojo.Artista;
import org.hibernate.Query;


/**
 * @author asathor
 */
public class ArtistaHelperClass extends SelectQuery implements ArtistaHelper {

    private ArtistaHelperClass() {
        super();
        queryFrom = "FROM Artista a ";
        queryOrderBy = "ORDER BY a.nombreArtista ";
        queryWhere = "";
    }


    public static ArtistaHelper create() {
        return new ArtistaHelperClass();
    }


    @Override
    public List getArtistas() throws Exception {
        querySet();
        List<Artista> myArtistList = myQuery.list();
        queryClose();
        return myArtistList;
    }


    @Override
    public List getArtistaByName(String nombreArtista) throws Exception {
        queryWhere = "WHERE a.nombreArtista= :nombreArtista ";
        querySet();
        parameterSet("nombreArtista", nombreArtista);
        List<Artista> myArtistList = myQuery.list();
        queryClose();
        return myArtistList;
    }


}
