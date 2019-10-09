var webSocket;
var tipo;


function inicializar() {
    document.getElementById("sinConexion").hidden = false;
    document.getElementById("resultados").hidden = true;
    document.getElementById('estado').innerHTML = '';
    tipo = '';
}


function consultaArtistas() {
    var miUri = 'ws://localhost:8080/disketoWebService/dep/artistas';
    webSocket = new WebSocket(miUri);
    definirEventos();
    tipo = 'artistas';
}


function consultaEstados() {
    var miUri = 'ws://localhost:8080/disketoWebService/dep/estados';
    webSocket = new WebSocket(miUri);
    definirEventos();
    tipo = 'estados';
}


function consultaGeneros() {
    var miUri = 'ws://localhost:8080/disketoWebService/dep/generos';
    webSocket = new WebSocket(miUri);
    definirEventos();
    tipo = 'generos';
}


function definirEventos() {
    webSocket.onopen = function (event) {
        onOpen(event);
    };
    webSocket.onerror = function (event) {
        onError(event);
    };
    webSocket.onmessage = function (event) {
        onMessage(event);
    };
}


function onOpen(event) {
    document.getElementById('estado').innerHTML = 'Estado conexión: Conectado...';
    document.getElementById("sinConexion").hidden = true;
    document.getElementById("resultados").hidden = false;
    send();
}

function onClose(texto) {
    document.getElementById('estado').innerHTML = 'Listo, ' + texto;
}


function onError(event) {
    document.getElementById('estado').innerHTML = 'Estado conexión: Error';
    alert('Ocurrio un error al conectar al web socket:' + event.data);
}


function send() {
    document.getElementById('estado').innerHTML = 'Consultando información al servidor...';
    webSocket.send("");
    return false;
}


function onMessage(event) {
    document.getElementById('estado').innerHTML = 'Recibiendo información del servidor...';
    var misResultados = JSON.parse(event.data);
    document.getElementById('tablaResultados').innerHTML = '';
    document.getElementById('titulo').innerHTML = 'Lista de ' + tipo + '.';
    onClose(' se listaron ' + misResultados.length + tipo);
    $('#tablaResultados').createTable(misResultados);
}





