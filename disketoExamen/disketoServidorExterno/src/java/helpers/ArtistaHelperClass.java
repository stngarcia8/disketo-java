package helpers;

import java.util.List;
import pojos.Artista;


/**
 * @author asathor
 */
public class ArtistaHelperClass extends SelectQuery implements ArtistaHelper {

    private ArtistaHelperClass() {
        super();
        queryFrom = "FROM Artista a ";
        queryFrom = "FROM Artista a INNER JOIN FETCH a.estado INNER JOIN FETCH a.genero ";
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


}
