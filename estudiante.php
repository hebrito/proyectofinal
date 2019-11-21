<?php
require('conexion.php');
function buscarEstudiante(){
    
    $cn = getConexion();
    $stm = $cn->query("SELECT * FROM estudiante");
    $rows = $stm->fetchAll(PDO::FETCH_ASSOC);
    $data = [];
    foreach($rows as $row){
        $data[] = [
            "id" => $row["id"],
            "nombre" => $row["nombre"],
            "matricula" => $row["matricula"],
            "edad" => $row["edad"],
                    ];
    }
  
    header("Content-Type: application/json", true);
    $data = json_encode($data);
    echo $data;

}
function guardarEstudiante(){
    $postdata= file_get_contents("php://input");
    $data = json_decode($postdata, true);
    
    $cn = getConexion();
    $stm = $cn->prepare('INSERT INTO estudiante (nombre, matricula, edad) VALUES(:nombre, :matricula, :edad)');
    $stm->bindParam(":nombre", $data["nombre"]);
    $stm->bindParam(":matricula", $data["matricula"]);
    $stm->bindParam(":edad", $data["edad"]);
    $data = $stm->execute();
    echo $data;
  
    header("Content-Type: application/json", true);
    $data = json_encode($data);
    echo $data;
   
    echo 'guardar estudiante';
}

function eliminarEstudiante($id) {
    if ($id == null) {
        header("HTTP/1.1 400 Bad Request");
        $response = [ 
            "error" => true,
            "message" => "Campos id es requerido"
        ];
        
        echo json_encode($response);
       
        return;
    } 
    $cn = getConexion();
    $stm = $cn->prepare("DELETE FROM estudiante WHERE id = :id");
    $stm->bindParam(":id", $id);
    try {
        $data = $stm->execute();
        $response = [ "error" => false ];
        echo json_encode($response);
    } catch(Exception $e){
        switch($e->getCode()){
            case 23000:
                $response = [ 
                    "error" => true,
                    "message" => "Esta materia esta siendo usada"
                ];
            
                echo json_encode($response);
    
                break;
            default:
                $response = [ 
                    "error" => true,
                    "message" => $e->getMessage()
                ];
                
                echo json_encode($response);
        }   
    } 
}

function actualizarEstudiante(){
    if ($id == null) {
        header("HTTP/1.1 400 Bad Request");
        $response = [ 
            "error" => true,
            "message" => "Campos id es requerido"
        ];
        
        echo json_encode($response);
       
        return;
      
    } 
    $postdata = file_get_contents("php://input");
    $data = json_decode($postdata, true);
        $errors = [];
      if (!$data["nombre"]) {
        $errors[] = "campo requerido";
    }
      if (!$data["matricula"]) {
        $errors[] = "campo requerido";
    }
      if (!$data["edad"]) {
        $errors[] = "campo requerido";
    }

    if (count($errors)>0){
      
        header("HTTP/1.1 400 Bad Request");
        $response = [ 
            "error" => true,
            "message" => "Campos requeridos",
            "errors" =>  $errors
        ];
        
        echo json_encode($response);
        return;
    }

    $cn = getConexion();
	$stm = $cn->prepare("UPDATE estudiante SET nombre='nombre', matricula='matricula', edad='edad' Where id=:id"); 
    $stm->bindParam(':nombre',  $data["nombre"]); 
    $stm->bindParam(':matricula',  $data["matricula"]); 
    $stm->bindParam(':edad',  $data["edad"]); 
    $stm->bindParam(":id", $id);
    $data = $stm->execute();
    try {
        $data = $stm->execute();
       
        $response = [ 
            "error" => false,
        ];
        
        echo json_encode($response);
    } catch(Exception $e){
        $response = [ 
            "error" => true,
            "message" => $e->getMessage()
        ];
        
        echo json_encode($response);
    }
}

$method = $_SERVER['REQUEST_METHOD'];
switch($method){
    case 'POST':
        guardarEstudiante();
    break;
    case 'GET':
        buscarEstudiante();
    break;
    case 'DELETE':
        $id = $_GET["id"];
        eliminarEstudiante($id);
    break;
    case 'PUT':
        $id = $_GET["id"];
        actualizarEstudiante($id);
    default:
    echo 'to be Implemented';
}