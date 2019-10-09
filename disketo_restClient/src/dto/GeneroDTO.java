package dto;

/**
 * @author asathor
 */
public class GeneroDTO {

    private Integer idGenero;
    private String nombreGenero;

    public GeneroDTO() {
        this.idGenero = 0;
        this.nombreGenero = "";
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


    @Override
    public String toString() {
        return this.nombreGenero;
    }


}
