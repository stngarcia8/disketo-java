package dto;

/**
 * @author asathor
 */
public class ArtistaDTO {

    private Integer idArtista;
    private String nombreArtista;
    private String origenArtista;
    private Integer formadoArtista;
    private String tematicaArtista;

    public ArtistaDTO() {
        idArtista = 0;
        nombreArtista = "";
        origenArtista = "";
        formadoArtista = 0;
        tematicaArtista = "";
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


    @Override
    public String toString() {
        return this.nombreArtista;
    }


}
