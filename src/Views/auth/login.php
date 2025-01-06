<?php
require_once("C:/xampp/htdocs/CareerLink/vendor/autoload.php");
use App\Controllers\Auth\AuthController;




if(isset($_POST["submit"]))
{
    if(empty($_POST["email"]) && empty($_POST["password"]))
    {
        echo "email or password is empty";
    }
    else{
        $email = $_POST["email"];
        $password = $_POST["password"];

        $authController = new AuthController();
        $authController->login($email, $password);

    }
}


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

  <header class="bg-white shadow-md sticky top-0 z-50 px-6 py-4 flex justify-between items-center">
    <a href="../../index.php" class="text-gray-700 text-2xl font-semibold flex items-center">
      <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-700" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
      </svg>
    </a>
    <h1 class="text-2xl font-semibold text-gray-800">CareerLink</h1>
    <div></div> 
  </header>

  <div class="min-h-screen bg-gray-200 flex items-center justify-center py-6 px-4 sm:px-6 lg:px-8">

    <div class="w-full max-w-md bg-white rounded-lg shadow-xl p-8 space-y-6">
      <h2 class="tite text-3xl font-semibold text-center text-gray-800">Welcome Back!</h2>
      <p class="signuptext text-center text-gray-600">Please sign in to continue.</p>

      <form id="login-form" action="" method="POST" class="space-y-6">
        <div>
          <label for="email" class="block text-sm font-medium text-gray-700">Email Address</label>
          <input type="email" id="email" name="email" required
            class="mt-2 block w-full px-4 py-3 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 placeholder-gray-500 text-gray-900 focus:outline-none">
        </div>

        <div>
          <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
          <input type="password" id="password" name="password" required
            class="mt-2 block w-full px-4 py-3 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 placeholder-gray-500 text-gray-900 focus:outline-none">
        </div>


        <div class="flex justify-end">
          <a href="#" class="text-sm text-blue-600 hover:text-blue-500">Forgot Password?</a>
        </div>

        <div>
          <button type="submit" name="submit"
            class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 px-4 rounded-md shadow-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50">
            Sign In
          </button>
        </div>
      </form>


      <div class="text-center">
        <p class="text-sm text-gray-600">
          <a href="#" id="toggle-link" class="text-blue-600 hover:text-blue-500 font-semibold">Don't have an account? Sign Up</a>
        </p>
      </div>
    </div>
  </div>

  <script src="../../scripts/login.js"></script>

</body>
</html>