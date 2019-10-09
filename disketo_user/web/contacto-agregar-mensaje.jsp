<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>

<div class="container">
    <br><br><br>
    <h1 class="text-center">
        Formulario de contacto.
    </h1>
    <p class="text-center text-muted">Envianos tus comentarios,
        dudas o sugerencias, llenando el siguiente formulario de
        contacto.
    </p>
    <div class="panel panel-default">
        <div class="panel-body">
            <form id="formularioContacto" method="post" class="form-horizontal"
                  action="AddContactMessage">
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="nombre">Nombre</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="nombre"
                               name="nombre" placeholder="Ingrese su nombre" autofocus />
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
                    <label class="col-sm-4 control-label" for="pais">País</label>
                    <div class="col-sm-5">
                        <select class="form-control" id="pais" name="pais">
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-4 control-label" for="fono">Número
                        de teléfono</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="fono" name="fono"
                               placeholder="Ingrese su telÃ©fono" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-4 control-label" for="motivo">Motivo</label>
                    <div class="col-sm-5">
                        <select class="form-control" id="motivo" name="motivo">
                            <option selected value="">Seleccione un motivo</option>
                            <option value="ventas">Mensaje a ventas</option>
                            <option value="soporte">Mensaje a soporte</option>
                            <option value="queja">Queja</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-4 control-label" for="mensaje">Mensaje</label>
                    <div class="col-sm-5">
                        <textarea class="form-control" id="mensaje" name="mensaje"
                                  placeholder="Ingrese su mensaje aquÃ­." rows="4"></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-4">
                        <button type="submit" class="btn btn-primary" name="enviar"
                                value="Enviar comentario">Enviar comentario</button>
                    </div>
                </div>                
            </form>            
        </div>
    </div>
</div>

<%@ include file="footer.jsp"%>

<script type="application/javascript" src="js/jqueryValidation/jquery.validate.min.js"></script>
<script type="application/javascript" src="js/funciones.js"></script>
<script type="application/javascript" src="js/validaFormularioContacto.js"></script>

</body>
</html>
