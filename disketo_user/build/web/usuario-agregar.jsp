<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>

<div class="container">
    <br><br><br>
    <h1 class="text-center">
        Creación de usuarios
    </h1>
    <p class="text-center text-muted">
        Ingresa los datos solicitados para crear un nuevo usuario.
    </p>
    <div class="panel panel-default">
        <div class="panel-body">
            <form id="formularioUsuario" method="post" class="form-horizontal"
                  action="AddUser">
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="nombre">Nombre</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="nombre"
                               name="nombre" placeholder="Ingrese su nombre" autofocus />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-4 control-label" for="apellido">Apellido</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="apellido"
                               name="apellido" placeholder="Ingrese su apellido" />
                    </div>
                </div>

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
                        <input type="text" class="form-control" id="pwd"
                               name="pwd" placeholder="Ingrese su contraseña" />
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-4">
                        <button type="submit" class="btn btn-primary" name="grabar"
                                value="grabar">Grabar</button>
                    </div>
                </div>
            </form>            
        </div>
    </div>
</div>

<%@ include file="footer.jsp"%>

<script src="js/jqueryValidation/jquery.validate.min.js"></script>
<script src="js/funciones.js"></script>
<script src="js/validaFormularioUsuario.js"></script>
</body>
</html>
