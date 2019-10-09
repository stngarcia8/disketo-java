/****
 *  Funcion para inicializar el formulario de usuario.
 ****/
$(document).ready(function () {
    $("#datosCorrectos").hide();
    limpiarCampos();
});


/****
 * Manejador del evento setDefault del validador.
 */
$.validator.setDefaults({
    submitHandler: function () {
        return true;
    }
});


/****
 * Manejador del evento de validacion del formulario.
 ****/
$("#formularioUsuario").validate({
    // Definicion de las reglas de validacion.
    rules: {
        nombre: {
            required: true,
            minlength: 2,
            maxlength: 20
        },
        apellido: {
            required: true,
            minlength: 2,
            maxlength: 20
        },
        email: {
            required: true,
            email: true
        },
        pwd: {
            required: true,
            minlength: 5,
            maxlength: 20
        }
    },
    // Definicion de los mensajes para las validaciones.
    messages: {
        nombre: {
            required: "Debe ingrresar su nombre.",
            minlength: "El nombre debe contener al menos 2 caracteres.",
            maxlength: "El nombre puede contener hasta 20 caracteres."
        },
        apellido: {
            required: "Debe ingrresar su apellido.",
            minlength: "El apellido debe contener al menos 2 caracteres.",
            maxlength: "El apellido puede contener hasta 20 caracteres."
        },
        email: "Ingrese un email válido.",
        pwd: {
            required: "Debe ingrresar su contraseña.",
            minlength: "La contraseña debe contener al menos 5 caracteres.",
            maxlength: "La contraseña puede contener hasta 20 caracteres."
        }
    },
    errorElement: "em",
    errorPlacement: function (error, element) {
        error.addClass("help-block");
        error.insertAfter(element);
    },
    success: function (label, element) {
        if (!$(element).next("span")[0]) {
            $("<span class='glyphicon glyphicon-ok form-control-feedback'></span>").insertAfter($(element));
        }
    },
    highlight: function (element, errorClass, validClass) {
        $(element).parents(".col-sm-5").addClass("has-error").removeClass("has-success");
    },
    unhighlight: function (element, errorClass, validClass) {
        $(element).parents(".col-sm-5").addClass("has-success").removeClass("has-error");
    }
});