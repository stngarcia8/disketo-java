<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>

<div class="container">
    <section class="jumbotron text-center">
        <br><br><br><br>
        <h1>Usuario creado</h1>
        <table class="table table-responsive">
            <tr>
                <td>Nombre:</td>
                <td><%=request.getParameter("nombre") + ' ' + request.getParameter("apellido")%></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><%=request.getParameter("email")%></td>
            </tr>
        </table>

    </section>
</div>

<%@ include file="footer.jsp"%>


</body>
</html>
