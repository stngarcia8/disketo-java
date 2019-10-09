<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>

<main role="main">
    <section class="jumbotron text-justify">
        <div class="container">
            <h1 class="jumbotron-heading text-center">Inicio de sesión.</h1>
            <p class="text-center text-muted">
                Ingresa tus credenciales y
                comienza a registrar tus discografías.
            </p>
            <form id="formularioLogin" name="formularioLogin" method="post" class="form-horizontal"
                  action="signup">
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="email">Email</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="email" name="email"
                               placeholder="Ingrese su email" />
                    </div>
                </div>                    

                <div class="form-group">
                    <label class="col-sm-4 control-label" for="pwd">Contraseña</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control" id="pwd" name="pwd"
                               placeholder="Ingrese su contraseña" />
                    </div>
                </div>


                <div class="row">
                    <div class="col-sm-12 col-md-3">
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Ingresar</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
</main>

<%@ include file="footer.jsp"%>


<script type="application/javascript" src="js/jqueryValidation/jquery.validate.min.js"></script>
<script type="application/javascript" src="js/funciones.js"></script>
<script type="application/javascript" src="js/validaFormularioLogin.js"></script>

</body>
</html>


