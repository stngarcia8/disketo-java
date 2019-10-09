package modelo.pojos;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.pojos.Artista;
import modelo.pojos.Discografia;
import modelo.pojos.Formato;

@Generated(value="EclipseLink-2.6.1.v20150605-rNA", date="2019-06-23T19:44:08")
@StaticMetamodel(Album.class)
public class Album_ { 

    public static volatile SingularAttribute<Album, Integer> lanzamientoAlbum;
    public static volatile ListAttribute<Album, Discografia> discografiaList;
    public static volatile SingularAttribute<Album, Artista> idArtista;
    public static volatile ListAttribute<Album, Formato> formatoList;
    public static volatile SingularAttribute<Album, Integer> idAlbum;
    public static volatile SingularAttribute<Album, String> nombreAlbum;

}