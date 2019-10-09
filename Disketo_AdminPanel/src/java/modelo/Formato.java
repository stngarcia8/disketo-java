package modelo;


import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;



/**
  * @author asathor
 */
@Entity
@Table(name = "formato", catalog = "disketo_data2", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"nombreFormato"})})
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Formato.findAll", query = "SELECT f FROM Formato f")
    , @NamedQuery(name = "Formato.findByIdFormato", query = "SELECT f FROM Formato f WHERE f.idFormato = :idFormato")
    , @NamedQuery(name = "Formato.findByNombreFormato", query = "SELECT f FROM Formato f WHERE f.nombreFormato = :nombreFormato")})
public class Formato implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idFormato", nullable = false)
    private Integer idFormato;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "nombreFormato", nullable = false, length = 25)
    private String nombreFormato;
    @ManyToMany(mappedBy = "formatoList")
    private List<Album> albumList;

    public Formato() {
    }


    public Formato(Integer idFormato) {
        this.idFormato = idFormato;
    }


    public Formato(Integer idFormato, String nombreFormato) {
        this.idFormato = idFormato;
        this.nombreFormato = nombreFormato;
    }


    public Integer getIdFormato() {
        return idFormato;
    }


    public void setIdFormato(Integer idFormato) {
        this.idFormato = idFormato;
    }


    public String getNombreFormato() {
        return nombreFormato;
    }


    public void setNombreFormato(String nombreFormato) {
        this.nombreFormato = nombreFormato;
    }


    @XmlTransient
    public List<Album> getAlbumList() {
        return albumList;
    }


    public void setAlbumList(List<Album> albumList) {
        this.albumList = albumList;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idFormato != null ? idFormato.hashCode() : 0);
        return hash;
    }


    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Formato)) {
            return false;
        }
        Formato other = (Formato) object;
        if ((this.idFormato == null && other.idFormato != null) || (this.idFormato != null && !this.idFormato.equals(other.idFormato))) {
            return false;
        }
        return true;
    }


    @Override
    public String toString() {
        return this.nombreFormato;
    }
    
}
