package modelo.pojos;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.pojos.Album;
import modelo.pojos.Usuario;

@Generated(value="EclipseLink-2.6.1.v20150605-rNA", date="2019-06-23T19:44:08")
@StaticMetamodel(Discografia.class)
public class Discografia_ { 

    public static volatile SingularAttribute<Discografia, String> nombreDiscografia;
    public static volatile ListAttribute<Discografia, Usuario> usuarioList;
    public static volatile SingularAttribute<Discografia, String> descripcionDiscografia;
    public static volatile ListAttribute<Discografia, Album> albumList;
    public static volatile SingularAttribute<Discografia, Integer> idDiscografia;

}