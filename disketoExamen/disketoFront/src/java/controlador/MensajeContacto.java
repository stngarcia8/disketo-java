package controlador;

import entidades.Contacto;
import java.io.IOException;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.ContactoFacadeLocal;


/**
 * @author asathor
 */
@WebServlet(name = "mensajeContacto", urlPatterns = {"/mensajeContacto"})
public class MensajeContacto extends HttpServlet {

    @EJB
    ContactoFacadeLocal contactoSB;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Contacto contacto = new Contacto();
        contacto.setNombre(request.getParameter("nombre"));
        contacto.setEmail(request.getParameter("email"));
        contacto.setTelefono(request.getParameter("pais") + request.getParameter("fono"));
        contacto.setMotivo(request.getParameter("motivo"));
        contacto.setTexto(request.getParameter("mensaje"));
        contacto.setFecha(new Date());
        contactoSB.create(contacto);
        getServletContext().getRequestDispatcher("/contacto-mensaje-agregado.jsp").forward(request, response);
    }


}
