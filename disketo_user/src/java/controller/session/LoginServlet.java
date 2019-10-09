package controller.session;

import java.util.HashMap;
import java.util.Map;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.List;
import javax.ejb.EJB;
import entity.User;
import model.sesionbeans.UserFacadeLocal;


@WebServlet(name = "LoginServlet", urlPatterns = {"/signup"})
public class LoginServlet extends HttpServlet {

    @EJB
    UserFacadeLocal myUserSB;
    List<User> myUser;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Map<String, String> myParameters = new HashMap<String, String>();
        myParameters.put("email", request.getParameter("email"));
        myParameters.put("password", request.getParameter("pwd"));
        this.myUser = this.myUserSB.findNamedQuery("User.findLogin", myParameters);
        if (this.myUser.size()==0){
            getServletContext().getRequestDispatcher("/usuario-acceso-denegado.jsp").forward(request, response);
            return;
        }
        User myUserfound = this.myUser.get(0);
        HttpSession mySession=request.getSession();
        mySession.setAttribute("name",cap(myUserfound.getNombre())+' '+cap(myUserfound.getApellido()));
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
    
    private String cap(String textoSinFormato){
        String []palabras = textoSinFormato.split("\\s+");
        StringBuilder textoFormateado = new StringBuilder();
        for(String palabra : palabras){
            textoFormateado.append(palabra.substring(0,1).toUpperCase()
        	    	.concat( palabra.substring(1,palabra.length())
        		.toLowerCase()).concat(" "));
        }
        return textoFormateado.toString();        
    }
}
