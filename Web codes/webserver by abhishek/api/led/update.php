<?php

 $servername = "localhost";
$username = "root";
$password = "";
$dbname = "monker";

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

//Creating Array for JSON response
$response = array();
 
// Check if we got the field from the user
if (isset($_GET['id']) && isset($_GET['status'])) {
 
    $id = $_GET['id'];
    $status= $_GET['status'];


try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $sql = "UPDATE led SET status= '$status' WHERE id = '$id' ";
  // use exec() because no results are returned
  $conn->exec($sql);
 // echo "Data Successfully deleted";

  if ($conn) {
        // successfully updation of LED status (status)
        $response["success"] = 1;
        $response["message"] = "LED Status successfully updated.";
 
        // Show JSON response
        echo json_encode($response);
} else {
    // If required parameter is missing
    $response["success"] = 0;
    $response["message"] = "Parameter(s) are missing. Please check the request";
 
    // Show JSON response
    echo json_encode($response);
}


} catch(PDOException $e) {
  echo $sql . "<br>" . $e->getMessage();
}

$conn = null; 

}





// Check if we got the field from the user
if (isset($_GET['id']) && isset($_GET['value'])) {
 
    $id = $_GET['id'];
    $value= $_GET['value'];


try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $sql = "UPDATE led SET value= '$value' WHERE id = '$id' ";
  // use exec() because no results are returned
  $conn->exec($sql);
 // echo "Data Successfully deleted";

  if ($conn) {
        // successfully updation of LED status (status)
        $response["success"] = 1;
        $response["message"] = "LED value successfully updated.";
 
        // Show JSON response
        echo json_encode($response);
} else {
    // If required parameter is missing
    $response["success"] = 0;
    $response["message"] = "Parameter(s) are missing. Please check the request";
 
    // Show JSON response
    echo json_encode($response);
}


} catch(PDOException $e) {
  echo $sql . "<br>" . $e->getMessage();
}

$conn = null; 

}



?>