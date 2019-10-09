package modelo.pojos;

import modelo.pojos.Artista;
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
@Table(name = "estado", catalog = "disketo_data2", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"nombreEstado"})})
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Estado.findAll", query = "SELECT e FROM Estado e")
    , @NamedQuery(name = "Estado.findByIdEstado", query = "SELECT e FROM Estado e WHERE e.idEstado = :idEstado")
    , @NamedQuery(name = "Estado.findByNombreEstado", query = "SELECT e FROM Estado e WHERE e.nombreEstado = :nombreEstado")})
public class Estado implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idEstado", nullable = true)
    private Integer idEstado;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "nombreEstado", nullable = false, length = 25)
    private String nombreEstado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idEstado")
    private List<Artista> artistaList;

    public Estado() {
    }


    public Estado(Integer idEstado) {
        this.idEstado = idEstado;
    }


    public Estado(Integer idEstado, String nombreEstado) {
        this.idEstado = idEstado;
        this.nombreEstado = nombreEstado;
    }


    public Integer getIdEstado() {
        return idEstado;
    }


    public void setIdEstado(Integer idEstado) {
        this.idEstado = idEstado;
    }


    public String getNombreEstado() {
        return nombreEstado;
    }


    public void setNombreEstado(String nombreEstado) {
        this.nombreEstado = nombreEstado;
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
        hash += (idEstado != null ? idEstado.hashCode() : 0);
        return hash;
    }


    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Estado)) {
            return false;
        }
        Estado other = (Estado) object;
        if ((this.idEstado == null && other.idEstado != null) || (this.idEstado != null && !this.idEstado.equals(other.idEstado))) {
            return false;
        }
        return true;
    }


    @Override
    public String toString() {
        return this.nombreEstado;
    }


}
