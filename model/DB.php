<?php
class Db{

    protected $cnx;
    protected string $user_name = 'root';
    protected string $db_name = 'prospere';
    protected string $password = '';

    public function __construct()
    {
        try {
            $this->cnx = new PDO('mysql:host=localhost;dbname='.$this->db_name.';charset=utf8', ''.$this->user_name.'', ''.$this->password.'');
            $this->cnx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);###signé M04F0 G4U5
            $this->cnx->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        } catch(Exception $e) {
            die('Erreur : '.$e->getMessage());
        }
    }

    public function getCnx()
    {
        return $this->cnx;
    }

}
