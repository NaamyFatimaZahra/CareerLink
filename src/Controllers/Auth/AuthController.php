<?php
namespace App\Controllers\Auth;

use App\Classes\User;
use App\Config\Database;
use App\Models\UserModel;
use PDO;

class AuthController{

   
    public function login($email, $password){
        $userModel = new UserModel();
        $user =  $userModel->findUserByEmailAndPassword($email, $password);
        if($user == null)
        {
            echo "user not found please check ...";
        }
        else{
            if($user->getRole()->getTitle() == "admin")
            {
                header("Location:../admin/dashboard.php");
            }
            else if($user->getRole()->getTitle() == "candidate")
            {
              header("Location:../candidate/home.php");
            }
            else if($user->getRole()->getTitle() == "recruiter")
            {
              header("Location:../recruiter/home.php");
            }
        }
    }
}