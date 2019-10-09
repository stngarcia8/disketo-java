package controller.contactMessage;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import java.util.ArrayList;
import javax.ejb.EJB;
import entity.Contact;
import model.sesionbeans.ContactFacadeLocal;


/**
 *
 * @author asathor
 */
@WebServlet(name = "ListContactServlet", urlPatterns = {"/ListContacts"})
public class ListContactMessageServlet extends HttpServlet {

    @EJB
    ContactFacadeLocal myContactListSB;

    List<Contact> myContactList;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        this.myContactList = new ArrayList<Contact>();
        if (this.myContactListSB.count() != 0) {
            this.myContactList = this.myContactListSB.findAll();
        }
        request.setAttribute("contacts", this.myContactListSB.findAll());
        getServletContext().getRequestDispatcher("/contacto-listado-mensajes.jsp").forward(request, response);
    }


}
