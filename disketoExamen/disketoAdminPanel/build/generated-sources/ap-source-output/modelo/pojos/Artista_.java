package modelo.pojos;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.pojos.Album;
import modelo.pojos.Estado;
import modelo.pojos.Genero;

@Generated(value="EclipseLink-2.6.1.v20150605-rNA", date="2019-06-23T19:44:08")
@StaticMetamodel(Artista.class)
public class Artista_ { 

    public static volatile SingularAttribute<Artista, Estado> idEstado;
    public static volatile SingularAttribute<Artista, String> nombreArtista;
    public static volatile SingularAttribute<Artista, String> tematicaArtista;
    public static volatile SingularAttribute<Artista, Integer> idArtista;
    public static volatile SingularAttribute<Artista, String> origenArtista;
    public static volatile ListAttribute<Artista, Album> albumList;
    public static volatile SingularAttribute<Artista, Genero> idGenero;
    public static volatile SingularAttribute<Artista, Integer> formadoArtista;

}