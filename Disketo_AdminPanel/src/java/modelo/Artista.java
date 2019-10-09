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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;



/**
  * @author asathor
 */
@Entity
@Table(name = "artista", catalog = "disketo_data2", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Artista.findAll", query = "SELECT a FROM Artista a")
    , @NamedQuery(name = "Artista.findByIdArtista", query = "SELECT a FROM Artista a WHERE a.idArtista = :idArtista")
    , @NamedQuery(name = "Artista.findByNombreArtista", query = "SELECT a FROM Artista a WHERE a.nombreArtista = :nombreArtista")
    , @NamedQuery(name = "Artista.findByOrigenArtista", query = "SELECT a FROM Artista a WHERE a.origenArtista = :origenArtista")
    , @NamedQuery(name = "Artista.findByFormadoArtista", query = "SELECT a FROM Artista a WHERE a.formadoArtista = :formadoArtista")
    , @NamedQuery(name = "Artista.findByTematicaArtista", query = "SELECT a FROM Artista a WHERE a.tematicaArtista = :tematicaArtista")})
public class Artista implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idArtista", nullable = false)
    private Integer idArtista;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "nombreArtista", nullable = false, length = 50)
    private String nombreArtista;
    @Size(max = 50)
    @Column(name = "origenArtista", length = 50)
    private String origenArtista;
    @Column(name = "formadoArtista")
    private Integer formadoArtista;
    @Size(max = 100)
    @Column(name = "tematicaArtista", length = 100)
    private String tematicaArtista;
    @JoinColumn(name = "idEstado", referencedColumnName = "idEstado", nullable = false)
    @ManyToOne(optional = false)
    private Estado idEstado;
    @JoinColumn(name = "idGenero", referencedColumnName = "idGenero", nullable = false)
    @ManyToOne(optional = false)
    private Genero idGenero;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idArtista")
    private List<Album> albumList;

    public Artista() {
    }


    public Artista(Integer idArtista) {
        this.idArtista = idArtista;
    }


    public Artista(Integer idArtista, String nombreArtista) {
        this.idArtista = idArtista;
        this.nombreArtista = nombreArtista;
    }


    public Integer getIdArtista() {
        return idArtista;
    }


    public void setIdArtista(Integer idArtista) {
        this.idArtista = idArtista;
    }


    public String getNombreArtista() {
        return nombreArtista;
    }


    public void setNombreArtista(String nombreArtista) {
        this.nombreArtista = nombreArtista;
    }


    public String getOrigenArtista() {
        return origenArtista;
    }


    public void setOrigenArtista(String origenArtista) {
        this.origenArtista = origenArtista;
    }


    public Integer getFormadoArtista() {
        return formadoArtista;
    }


    public void setFormadoArtista(Integer formadoArtista) {
        this.formadoArtista = formadoArtista;
    }


    public String getTematicaArtista() {
        return tematicaArtista;
    }


    public void setTematicaArtista(String tematicaArtista) {
        this.tematicaArtista = tematicaArtista;
    }


    public Estado getIdEstado() {
        return idEstado;
    }


    public void setIdEstado(Estado idEstado) {
        this.idEstado = idEstado;
    }


    public Genero getIdGenero() {
        return idGenero;
    }


    public void setIdGenero(Genero idGenero) {
        this.idGenero = idGenero;
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
        hash += (idArtista != null ? idArtista.hashCode() : 0);
        return hash;
    }


    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Artista)) {
            return false;
        }
        Artista other = (Artista) object;
        if ((this.idArtista == null && other.idArtista != null) || (this.idArtista != null && !this.idArtista.equals(other.idArtista))) {
            return false;
        }
        return true;
    }


    @Override
    public String toString() {
        return this.nombreArtista;
    }
    
}
