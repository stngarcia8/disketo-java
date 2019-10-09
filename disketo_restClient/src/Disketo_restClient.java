
import consumer.ArtistConsumer;
import consumer.EstadoConsumer;
import consumer.GeneroConsumer;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 * @author asathor
 */
public class Disketo_restClient {

    /**
     * @param args the command line arguments
     */
    @SuppressWarnings("empty-statement")
    public static void main(String[] args) {
        mostrarArtistas();
        mostrarEstados();
        mostrarGeneros();
    }


    private static void mostrarArtistas() {
        resultado("Mostrando artistas...");
        ArtistConsumer artistConsumer = ArtistConsumer.create();
        try {
            artistConsumer.getArtistas().forEach(o -> {
                System.out.println(o.getIdArtista() + "\t" + o.getNombreArtista() + "\t" + o.getOrigenArtista() + "\t" + o.getFormadoArtista().toString() + "\t" + o.getTematicaArtista());
            });
        } catch (IOException ex) {
            Logger.getLogger(Disketo_restClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        resultado(artistConsumer.toString());
    }


    private static void mostrarEstados() {
        resultado("Mostrando estados...");
        EstadoConsumer estadoConsumer = EstadoConsumer.create();
        try {
            estadoConsumer.getEstados().forEach(o -> {
                System.out.println(o.getIdEstado().toString() + "\t" + o.getNombreEstado());
            });
        } catch (IOException ex) {
            Logger.getLogger(Disketo_restClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        resultado(estadoConsumer.toString());
    }


    private static void mostrarGeneros() {
        resultado("Mostrando generos...");
        GeneroConsumer generoConsumer = GeneroConsumer.create();
        try {
            generoConsumer.getGeneros().forEach(o -> {
                System.out.println(o.getIdGenero().toString() + "\t" + o.getNombreGenero());
            });
        } catch (IOException ex) {
            Logger.getLogger(Disketo_restClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        resultado(generoConsumer.toString());
    }


    private static void resultado(String texto) {
        System.out.println(texto);
        for (int i = 0; i < texto.length() - 1; i++) {
            System.out.print('-');
        }
        System.out.println();
        System.out.println();
        System.out.println();
    }


}
