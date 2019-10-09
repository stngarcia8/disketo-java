package modelo;


import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;



/**
  * @author asathor
 */
@Entity
@Table(name = "discografia", catalog = "disketo_data2", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Discografia.findAll", query = "SELECT d FROM Discografia d")
    , @NamedQuery(name = "Discografia.findByIdDiscografia", query = "SELECT d FROM Discografia d WHERE d.idDiscografia = :idDiscografia")
    , @NamedQuery(name = "Discografia.findByNombreDiscografia", query = "SELECT d FROM Discografia d WHERE d.nombreDiscografia = :nombreDiscografia")
    , @NamedQuery(name = "Discografia.findByDescripcionDiscografia", query = "SELECT d FROM Discografia d WHERE d.descripcionDiscografia = :descripcionDiscografia")})
public class Discografia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idDiscografia", nullable = false)
    private Integer idDiscografia;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "nombreDiscografia", nullable = false, length = 50)
    private String nombreDiscografia;
    @Size(max = 100)
    @Column(name = "descripcionDiscografia", length = 100)
    private String descripcionDiscografia;
    @ManyToMany(mappedBy = "discografiaList")
    private List<Album> albumList;
    @JoinTable(name = "usuario_discografia", joinColumns = {
        @JoinColumn(name = "idDiscografia", referencedColumnName = "idDiscografia", nullable = false)}, inverseJoinColumns = {
        @JoinColumn(name = "id_usuario", referencedColumnName = "id_usuario", nullable = false)})
    @ManyToMany
    private List<Usuario> usuarioList;

    public Discografia() {
    }


    public Discografia(Integer idDiscografia) {
        this.idDiscografia = idDiscografia;
    }


    public Discografia(Integer idDiscografia, String nombreDiscografia) {
        this.idDiscografia = idDiscografia;
        this.nombreDiscografia = nombreDiscografia;
    }


    public Integer getIdDiscografia() {
        return idDiscografia;
    }


    public void setIdDiscografia(Integer idDiscografia) {
        this.idDiscografia = idDiscografia;
    }


    public String getNombreDiscografia() {
        return nombreDiscografia;
    }


    public void setNombreDiscografia(String nombreDiscografia) {
        this.nombreDiscografia = nombreDiscografia;
    }


    public String getDescripcionDiscografia() {
        return descripcionDiscografia;
    }


    public void setDescripcionDiscografia(String descripcionDiscografia) {
        this.descripcionDiscografia = descripcionDiscografia;
    }


    @XmlTransient
    public List<Album> getAlbumList() {
        return albumList;
    }


    public void setAlbumList(List<Album> albumList) {
        this.albumList = albumList;
    }


    @XmlTransient
    public List<Usuario> getUsuarioList() {
        return usuarioList;
    }


    public void setUsuarioList(List<Usuario> usuarioList) {
        this.usuarioList = usuarioList;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDiscografia != null ? idDiscografia.hashCode() : 0);
        return hash;
    }


    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Discografia)) {
            return false;
        }
        Discografia other = (Discografia) object;
        if ((this.idDiscografia == null && other.idDiscografia != null) || (this.idDiscografia != null && !this.idDiscografia.equals(other.idDiscografia))) {
            return false;
        }
        return true;
    }


    @Override
    public String toString() {
        return this.nombreDiscografia;
    }
    
}
