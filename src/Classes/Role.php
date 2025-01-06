<?php

namespace App\Classes;

class Role {
    public $id;
    private $title;
    public $created_at;
    public $updated_at;
    
    
    public function __construct($id, $title, $created_at='', $updated_at='') {
            $this->id = $id;
            $this->title = $title;
            $this->created_at = $created_at;
            $this->updated_at = $updated_at;
    }

    public function getTitle(){
        return $this->title;
    }
    
}