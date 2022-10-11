<?php
class DB_CONNECT {
 
    // Constructor
    function __construct() {
        // Trying to connect to the database
        $this->connect();
        
    }
 
    // Destructor
    function __destruct() {
        // Closing the connection to database
        $this->close();
    }
 
   // Function to connect to the database
    function connect() {
        //importing dbconfig.php file which contains database credentials 
        $filepath = realpath (dirname(__FILE__));
        require_once($filepath."/dbconfig.php");
        //require_once 'dbconfig.php';
        
        // Connecting to mysql (phpmyadmin) database
       // $con = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD) or die(mysql_error());

         $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
       // $conn = mysqli_connect($servername, $username, $password, $database);
 
        // Selecing database
       //$db = mysqli_select_db(DB_DATABASE); or die(mysql_error()); or die(mysql_error());
 
        // returing connection cursor
        return $conn;
    }
 
    // Function to close the database
    function close() {
        // Closing data base connection
        mysql_close();
    }
 
}
 
?>