<%@page import="entity.Contact"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>

<div class="container">
    <section class="jumbotron text-center">
        <br><br>
        <h1>Acceso denegado</h1>
        <p class="lead text-muted text-justify">
            No tiene acceso a Disketo.  Esto puede producirse por los siguientes motivos:
        <ul>
            <li>Los datos de ingreso (email/contraseña) no corresponde.</li>
            <li>El usuario no esta registrado.</li>
        </ul>
        Si desea ingresar a Disketo, 
        <a href="usuario-agregar.jsp">registrese aqui</a>
        </p>

    </section>
</div>


<%@ include file="footer.jsp"%>

</body>
</html>
