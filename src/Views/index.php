<?php

require_once("../../vendor/autoload.php");
use App\Config\Database;


$db = new Database();
$db->connection();

?>


<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.tailwindcss.com"></script>
  <title>Login - CareerLink</title>
</head>
<body class="bg-gray-100 font-sans antialiased">

  <header class="bg-white shadow-md sticky top-0 z-50 px-6 py-4 flex justify-around items-center">
        <a href="../Views/auth/register.php">Register</a>
        <a href="../Views/auth/login.php">Login</a>
  </header>

</body>
</html>