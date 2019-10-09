/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.pojos;

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
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;


/**
 *
 * @author asathor
 */
@Entity
@Table(name = "album", catalog = "disketo_data2", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Album.findAll", query = "SELECT a FROM Album a")
    , @NamedQuery(name = "Album.findByIdAlbum", query = "SELECT a FROM Album a WHERE a.idAlbum = :idAlbum")
    , @NamedQuery(name = "Album.findByNombreAlbum", query = "SELECT a FROM Album a WHERE a.nombreAlbum = :nombreAlbum")
    , @NamedQuery(name = "Album.findByLanzamientoAlbum", query = "SELECT a FROM Album a WHERE a.lanzamientoAlbum = :lanzamientoAlbum")})
public class Album implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idAlbum", nullable = false)
    private Integer idAlbum;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "nombreAlbum", nullable = false, length = 255)
    private String nombreAlbum;
    @Column(name = "lanzamientoAlbum")
    private Integer lanzamientoAlbum;
    @JoinTable(name = "discografia_album", joinColumns = {
        @JoinColumn(name = "idAlbum", referencedColumnName = "idAlbum", nullable = false)}, inverseJoinColumns = {
        @JoinColumn(name = "idDiscografia", referencedColumnName = "idDiscografia", nullable = false)})
    @ManyToMany
    private List<Discografia> discografiaList;
    @JoinTable(name = "album_formato", joinColumns = {
        @JoinColumn(name = "idAlbum", referencedColumnName = "idAlbum", nullable = false)}, inverseJoinColumns = {
        @JoinColumn(name = "idFormato", referencedColumnName = "idFormato", nullable = false)})
    @ManyToMany
    private List<Formato> formatoList;
    @JoinColumn(name = "idArtista", referencedColumnName = "idArtista", nullable = false)
    @ManyToOne(optional = false)
    private Artista idArtista;

    public Album() {
    }


    public Album(Integer idAlbum) {
        this.idAlbum = idAlbum;
    }


    public Album(Integer idAlbum, String nombreAlbum) {
        this.idAlbum = idAlbum;
        this.nombreAlbum = nombreAlbum;
    }


    public Integer getIdAlbum() {
        return idAlbum;
    }


    public void setIdAlbum(Integer idAlbum) {
        this.idAlbum = idAlbum;
    }


    public String getNombreAlbum() {
        return nombreAlbum;
    }


    public void setNombreAlbum(String nombreAlbum) {
        this.nombreAlbum = nombreAlbum;
    }


    public Integer getLanzamientoAlbum() {
        return lanzamientoAlbum;
    }


    public void setLanzamientoAlbum(Integer lanzamientoAlbum) {
        this.lanzamientoAlbum = lanzamientoAlbum;
    }


    @XmlTransient
    public List<Discografia> getDiscografiaList() {
        return discografiaList;
    }


    public void setDiscografiaList(List<Discografia> discografiaList) {
        this.discografiaList = discografiaList;
    }


    @XmlTransient
    public List<Formato> getFormatoList() {
        return formatoList;
    }


    public void setFormatoList(List<Formato> formatoList) {
        this.formatoList = formatoList;
    }


    public Artista getIdArtista() {
        return idArtista;
    }


    public void setIdArtista(Artista idArtista) {
        this.idArtista = idArtista;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idAlbum != null ? idAlbum.hashCode() : 0);
        return hash;
    }


    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Album)) {
            return false;
        }
        Album other = (Album) object;
        if ((this.idAlbum == null && other.idAlbum != null) || (this.idAlbum != null && !this.idAlbum.equals(other.idAlbum))) {
            return false;
        }
        return true;
    }


    @Override
    public String toString() {
        return this.nombreAlbum;
    }


}
