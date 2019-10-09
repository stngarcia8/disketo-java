package modelo.pojos;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.pojos.Artista;

@Generated(value="EclipseLink-2.6.1.v20150605-rNA", date="2019-06-23T19:44:08")
@StaticMetamodel(Genero.class)
public class Genero_ { 

    public static volatile SingularAttribute<Genero, String> nombreGenero;
    public static volatile SingularAttribute<Genero, Integer> idGenero;
    public static volatile ListAttribute<Genero, Artista> artistaList;

}