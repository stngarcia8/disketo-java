package controller.user;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.ejb.EJB;
import entity.User;
import java.util.Date;
import model.sesionbeans.UserFacadeLocal;


/**
 *
 * @author asathor
 */
@WebServlet(name = "AddUserServlet", urlPatterns = {"/AddUser"})
public class AddUserServlet extends HttpServlet {

    @EJB
    UserFacadeLocal myUserSB;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        User myUser = new User();
        myUser.setNombre(request.getParameter("nombre"));
        myUser.setApellido(request.getParameter("apellido"));
        myUser.setEmail(request.getParameter("email"));
        myUser.setPassword(request.getParameter("pwd"));
        myUser.setFechaCreacion(new Date());
        this.myUserSB.create((myUser));;
        getServletContext().getRequestDispatcher("/usuario-agregado.jsp").forward(request, response);
    }


}
