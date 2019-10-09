package entidades;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.6.1.v20150605-rNA", date="2019-06-21T21:55:17")
@StaticMetamodel(Contacto.class)
public class Contacto_ { 

    public static volatile SingularAttribute<Contacto, String> texto;
    public static volatile SingularAttribute<Contacto, Date> fecha;
    public static volatile SingularAttribute<Contacto, String> motivo;
    public static volatile SingularAttribute<Contacto, Integer> idContacto;
    public static volatile SingularAttribute<Contacto, String> telefono;
    public static volatile SingularAttribute<Contacto, String> nombre;
    public static volatile SingularAttribute<Contacto, String> email;

}