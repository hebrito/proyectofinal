<?php
require('conexion.php');
function buscarCarrera() {
    $cn = getConexion();
    
    $stm = $cn->query("SELECT * FROM carrera");
    $rows = $stm->fetchAll(PDO::FETCH_ASSOC);
    $data = json_encode($rows );
  
    echo $data;
}
function guardarCarrera() {
    $postdata = file_get_contents("php://input");
   
    $data = json_decode($postdata, true);

    $errors = [];
    if (!$data["nombre"]) {
        $errors[] = "campo nombre es requerido";
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
    $stm = $cn->prepare("INSERT INTO carrera (nombre) VALUES (:nombre)");
    $stm->bindParam(":nombre", $data["nombre"]);
    
    
    try {
        $data = $stm->execute();
        $response = [ "error" => false ];
        echo json_encode($response);
    } catch(Exception $e){
        $response = [ 
            "error" => true,
            "message" => "Error desconocido"
        
        ];
        
        echo json_encode($response);
    }
}
function borrarCarrera($id) {
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
    $stm = $cn->prepare("DELETE FROM carrera WHERE id = :id");
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
                    "message" => "Esta Carrera esta siendo usada"
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
function actualizarCarrera($id){
    
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
        $errors[] = "campo nombre es requerido";
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
    $stm = $cn->prepare("UPDATE carrera SET nombre = :nombre WHERE id = :id");
    $stm->bindParam(":nombre", $data["nombre"]);
    $stm->bindParam(":id", $id);
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
$method = $_SERVER["REQUEST_METHOD"];

header("Content-Type: application/json", true);
switch ($method){
    case 'POST': 
        guardarCarrera();
        break;
    case 'GET':
        $id = $_GET["id"];
        buscarCarrera($id);
        break;
    case 'DELETE':
        $id = $_GET["id"];
        borrarCarrera($id);
        break;
    case 'PUT':
        $id = $_GET["id"];
        actualizarCarrera($id);
        break;
    default: 
        echo '{
            "error": true,
            "message": "Metodo no implementado" 
        }
        ';
}