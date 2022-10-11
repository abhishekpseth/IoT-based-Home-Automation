<?php
 
 $servername = "localhost";
$username = "root";
$password = "";
$dbname = "monker";

header('content-type: application/json; charset=utf-8');
header("access-control-allow-origin: *");

//Creating Array for JSON response
$response = array();
 
// Check if we got the field from the user
if (isset($_GET['id'])) {
    $id = $_GET['id'];
 
 

try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $sql = "DELETE FROM weather WHERE id =$id ";
  // use exec() because no results are returned
  $conn->exec($sql);
  echo "Data Successfully deleted";
} catch(PDOException $e) {
  echo $sql . "<br>" . $e->getMessage();
}

$conn = null; 

}
?>