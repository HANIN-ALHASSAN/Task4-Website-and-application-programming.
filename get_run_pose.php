
<?php
$host = "localhost";
$user = "root";
$password = "";
$db = "robot_arm";

$conn = new mysqli($host, $user, $password, $db);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$result = $conn->query("SELECT * FROM pose_data ORDER BY id DESC LIMIT 1");

$data = $result->fetch_assoc();

echo json_encode($data);

$conn->close();
?>
