<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>

<div class="container">
    <section class="jumbotron text-center">
        <br><br>
        <h1>Gracias por su mensaje!</h1>
        <table class="table table-responsive">
            <tr>
                <td>Nombre:</td>
                <td><%=request.getParameter("nombre")%></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><%=request.getParameter("email")%></td>
            </tr>
            <tr>
                <td>Teléfono:</td>
                <td><%=request.getParameter("pais")%> <%=request.getParameter("fono")%>
                </td>
            </tr>
            <tr>
                <td>Motivo:</td>
                <td><%=request.getParameter("motivo")%></td>
            </tr>
            <tr>
                <td>Mensaje:</td>
                <td><%=request.getParameter("mensaje")%></td>
            </tr>
        </table>

    </section>
</div>

<%@ include file="footer.jsp"%>

</body>
</html>
