var estudianteTemplate = `
    <tr id="row-estudiante-{{ID}}">
    <td>{{NOMBRE}}</td>
    <td>{{MATRICULA}}</td>
    <td>{{EDAD}}</td>
   
    <td>
        <button id="editar-{{ID}}" onclick='editar({{ID}})' data-estudiante='{{DATA}}' class="btn btn-warning">Editar</button> | 
        <button onclick="eliminar({{ID}})" class="btn btn-danger">Eliminar</button>
    </td>
    </tr>
`

function buscarEstudiante() {
    fetch("/estudiante.php")
        .then( res => res.json())
        .then( res => {
            var listaE = document.getElementById('list_estudiante');
            var temp = '';
            res.forEach(e => {
                temp = temp + estudianteTemplate.replace(/{{NOMBRE}}/, e.nombre)
                    .replace(/{{MATRICULA}}/, e.matricula) 
                    .replace(/{{EDAD}}/, e.edad)
                    .replace(/{{ID}}/g, e.id)
                //    .replace(/{{CARRERA_ID}}/, e.carrera_id)
                    .replace(/{{DATA}}/, JSON.stringify(e));
            });
            listaE.innerHTML = temp;
        })
        .catch( err => {
            console.log(err);
        });
}

var estudiante = null;

function guardarEstudiante(){

    nombre = document.getElementById("nombre").value;
    matricula = document.getElementById("matricula").value;
    edad = document.getElementById("edad").value;
   // carrera_id = document.getElementById("carrera_id").value;

    var nueva = true;
    if (estudiante != null && estudiante.id ){
        nueva = false;
        var btnEditar = document.getElementById("editar-"+estudiante.id);
    } else {
        estudiante = {};
    }

    estudiante.nombre = nombre;
    estudiante.matricula = matricula;
    estudiante.edad = edad;
  //  estudiante.carrera_id = carrera_id;
    console.log(estudiante);
   
    if (nueva == false) {
        btnEditar.dataset.estudiante = JSON.stringify(estudiante);
    }

   fetch('/estudiante.php'+(nueva ? '' : `?id=${estudiante.id}`), {
        method: (nueva ? 'POST' : 'PUT'),
        body: JSON.stringify(estudiante),
        headers: {
            'Content-Type': 'application/json'
          }
    })
    .then( res => res.json())
    .then( res => {
        console.log(res);
    })
    .catch( err => {
        console.log(err);
    });

    estudiante = null;
    document.getElementById("nombre").value="";
    document.getElementById("matricula").value="";
    document.getElementById("edad").value="";
    //document.getElementById("carrera_id").value="";
    buscarEstudiante();
}


function editar(id){

    var btnEditar = document.getElementById("editar-"+id);

    var data = btnEditar.dataset.estudiante;
    estudiante = JSON.parse(data);

    document.getElementById("nombre").value = estudiante.nombre;
    document.getElementById("matricula").value = estudiante.matricula;
    document.getElementById("edad").value = estudiante.edad;
    //document.getElementById("carrera_id").value = estudiante.carrera_id;
    this.buscarEstudiante();
    buscarEstudiante();
}

function eliminar(id){
    fetch(`/estudiante.php?id=${id}`, {
        method: 'DELETE'
    })
    .then( res => res.json())
    .then( res => {
        var row = document.getElementById("row-estudiante-"+id).rowIndex;

        document.getElementById('list_estudiante').deleteRow(row);
        console.log(res);
    })
    .catch( err => {
        console.log(err);
    });
    
}

window.onload = function(){
    buscarEstudiante();

    document.getElementById("guardarEstudiante")
    .addEventListener("click", guardarEstudiante);
}