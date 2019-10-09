package controller.contactMessage;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.ejb.EJB;
import entity.Contact;
import java.util.Date;
import model.sesionbeans.ContactFacadeLocal;


/**
 *
 * @author asathor
 */
@WebServlet(name = "AddContactMessageServlet", urlPatterns = {"/AddContactMessage"})
public class AddContactMessageServlet extends HttpServlet {

    @EJB
    ContactFacadeLocal myContactSB;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Contact myContact = new Contact();
        myContact.setIdContacto(myContactSB.count() + 1);
        myContact.setNombre(request.getParameter("nombre"));
        myContact.setEmail(request.getParameter("email"));
        myContact.setTelefono(request.getParameter("pais") + request.getParameter("fono"));
        myContact.setMotivo(request.getParameter("motivo"));
        myContact.setTextoReq(request.getParameter("mensaje"));
        myContact.setFechaHora(new Date());
        myContactSB.create(myContact);
        getServletContext().getRequestDispatcher("/contacto-mensaje-agregado.jsp").forward(request, response);
    }


}
