package modelo;


import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
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
@Table(name = "genero", catalog = "disketo_data2", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"nombreGenero"})})
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Genero.findAll", query = "SELECT g FROM Genero g")
    , @NamedQuery(name = "Genero.findByIdGenero", query = "SELECT g FROM Genero g WHERE g.idGenero = :idGenero")
    , @NamedQuery(name = "Genero.findByNombreGenero", query = "SELECT g FROM Genero g WHERE g.nombreGenero = :nombreGenero")})
public class Genero implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idGenero", nullable = false)
    private Integer idGenero;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "nombreGenero", nullable = false, length = 50)
    private String nombreGenero;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idGenero")
    private List<Artista> artistaList;

    public Genero() {
    }


    public Genero(Integer idGenero) {
        this.idGenero = idGenero;
    }


    public Genero(Integer idGenero, String nombreGenero) {
        this.idGenero = idGenero;
        this.nombreGenero = nombreGenero;
    }


    public Integer getIdGenero() {
        return idGenero;
    }


    public void setIdGenero(Integer idGenero) {
        this.idGenero = idGenero;
    }


    public String getNombreGenero() {
        return nombreGenero;
    }


    public void setNombreGenero(String nombreGenero) {
        this.nombreGenero = nombreGenero;
    }


    @XmlTransient
    public List<Artista> getArtistaList() {
        return artistaList;
    }


    public void setArtistaList(List<Artista> artistaList) {
        this.artistaList = artistaList;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idGenero != null ? idGenero.hashCode() : 0);
        return hash;
    }


    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Genero)) {
            return false;
        }
        Genero other = (Genero) object;
        if ((this.idGenero == null && other.idGenero != null) || (this.idGenero != null && !this.idGenero.equals(other.idGenero))) {
            return false;
        }
        return true;
    }


    @Override
    public String toString() {
        return this.nombreGenero;
    }
    
}
