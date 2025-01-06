<?php

namespace App\Classes;


class User {
    public $id;
    public $email;
    public $password;
    public $role;
    public $created_at;
    public $updated_at;
    
    public function __construct($id, $email, $role,$password='', $created_at='', $updated_at='') {
            $this->id = $id;
            $this->email = $email;
            $this->role = $role;
            $this->password = $password;
            $this->created_at = $created_at;
            $this->updated_at = $updated_at;
    }


    public function getId() { return $this->id; }
    public function getRole() { return $this->role; }
    public function getEmail() { return $this->email; }
    public function getPassword() { return $this->password; }
    public function getCreatedAt() { return $this->created_at; }
    public function getUpdatedAt() { return $this->updated_at; }
    
}