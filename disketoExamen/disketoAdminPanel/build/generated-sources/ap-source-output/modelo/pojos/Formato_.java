package modelo.pojos;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.pojos.Album;

@Generated(value="EclipseLink-2.6.1.v20150605-rNA", date="2019-06-23T19:44:08")
@StaticMetamodel(Formato.class)
public class Formato_ { 

    public static volatile SingularAttribute<Formato, Integer> idFormato;
    public static volatile SingularAttribute<Formato, String> nombreFormato;
    public static volatile ListAttribute<Formato, Album> albumList;

}