<?php
// Include config file
require_once "../db/config.php";

// Initialize the session
session_start();

// Check if the user is logged in
if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
    header("location: ./index.php");
    exit;
}

// Get the user ID from the session
$id = $_SESSION["id"];

// Update the check-out time
$checkout_sql = "UPDATE tbl_attendance SET check_out_time = NOW() WHERE user_id = :user_id AND check_out_time IS NULL ORDER BY check_in_time DESC LIMIT 2";
if ($checkout_stmt = $pdo->prepare($checkout_sql)) {
    $checkout_stmt->bindParam(":user_id", $id, PDO::PARAM_INT);
    if ($checkout_stmt->execute()) {
        echo "Checked out successfully.";
    } else {
        echo "./index.php";
    }
}

// Close connection
unset($pdo);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <button > <a href="../logout.php" class="btn btn-danger ml-3">Sign Out of Your Account</a></button>
</body>
</html>