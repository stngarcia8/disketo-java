/****
 *  Funcion para inicializar el formulario de contacto.
 ****/
$(document).ready(function () {
    $("#datosCorrectos").hide();
    limpiarCampos();
    var miUrl = "codigoArea.json";
    cargarDatos(miUrl);
});


/****
 * Funcion: cargarDatos(miUrl)
 *          Carga los paises desde un archivo json.
 * Parametros: 
 * - miUrl: Url donde se ubica el archivo de datos json a cargar.
  ****/
function cargarDatos(miUrl) {
    $.ajax({
        url: miUrl,
        type: "GET",
        dataType: "json",
        crossDomain: true,
        success: function (resultados) {
            listarPaises(resultados)
        }
    });
}


/****
 *  Funcion: listarPaises(datos)
 *          Carga la lista de paises obtenidad desde el archivo json.
 * Parametros:
 * - datos: corresponde a los datos contenidos en el archivo json.
 ****/
function listarPaises(datos) {
    agregarPais('', 'Seleccione un pais');
    if (datos.length == 0) {
        return;
    }
    $.each(datos.paises, function (i, items) {
        agregarPais(items.codigo, items.nombre);
    })
}



/****
 * Funcion: agregarPais(valor, texto)
 *          Permite agregar el elemento al select de paises.
 * Parametros:
 * - valor: corresponde al valor de la propiedad value que se asignara el option del select.
 * - texto: Corresponde al texto que será mostrado en el option del select.
 ****/
function agregarPais(valor, texto) {
    var miCombo = document.getElementById("pais");
    var miOption = document.createElement("option");
    miOption.text = texto;
    miOption.value = valor;
    miCombo.add(miOption);
}




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
$("#formularioContacto").validate({
    // Definicion de las reglas de validacion.
    rules: {
        nombre: {
            required: true,
            minlength: 2,
            maxlength: 20
        },
        email: {
            required: true,
            email: true
        },
        pais: {
            required: true
        },
        fono: {
            required: true,
            minlength: 5,
            maxlength: 9
        },
        motivo: {
            required: true
        },
        mensaje: {
            required: true,
            minlength: 2,
            maxlength: 100
        }
    },
    // Definicion de los mensajes para las validaciones.
    messages: {
        nombre: {
            required: "Debe ingrresar su nombre.",
            minlength: "El nombre debe contener al menos 2 caracteres.",
            maxlength: "El nombre puede contener hasta 20 caracteres."
        },
        email: "Ingrese un email válido.",
        pais: "Debe seleccionar un país.",
        fono: "Ingrese un número de teléfono válido.",
        motivo: "Debe seleccionar un motivo.",
        mensaje: "Debe ingresar un mensaje."
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