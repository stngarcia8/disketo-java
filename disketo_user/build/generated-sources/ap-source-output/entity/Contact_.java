package entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-04-14T19:51:03")
@StaticMetamodel(Contact.class)
public class Contact_ { 

    public static volatile SingularAttribute<Contact, String> motivo;
    public static volatile SingularAttribute<Contact, String> textoReq;
    public static volatile SingularAttribute<Contact, Date> fechaHora;
    public static volatile SingularAttribute<Contact, Integer> idContacto;
    public static volatile SingularAttribute<Contact, String> telefono;
    public static volatile SingularAttribute<Contact, String> nombre;
    public static volatile SingularAttribute<Contact, String> email;

}