
<?php
$host = "localhost";
$user = "root";
$password = "";
$db = "robot_arm";

$conn = new mysqli($host, $user, $password, $db);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "UPDATE run_status SET status = 0 WHERE id = 1";

if ($conn->query($sql) === TRUE) {
  echo "Status updated.";
} else {
  echo "Error: " . $conn->error;
}

$conn->close();
?>
