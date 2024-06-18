<?php

class Campus
{
    //attribut
    private $connexion;
    private $cnx;
    private $notif;

    //constructeur
    public function __construct()
    {
        $this->connexion = new Db();
        $this->cnx = $this->connexion->getCnx();
    }

    //methodes
    public function create($intitule)
    {
        try {
            $create = $this->cnx->prepare('INSERT INTO campus(intitule) VALUE (?)');
            $create->execute(array($intitule));
        } catch (\Throwable $th) {
            $_SESSION['error'] = 'Erreur de creation';
        }
        
    }

}