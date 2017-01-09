<?php
defined('BASEPATH') OR exit('No direct script access allowed');

    class Ml_dealer extends CI_Model{
        //PROPIEDADES
        public $nombre, $id;            
        //METODOS
        //guarda el proveedor en la BDD
        public function add($nom){

            $data= array('nombre' => $nom);
            $this->db->insert('proveedores',$data);

            return $this->db->insert_id();
        } 
        //Modifica el proveedor 
        public function modify($id,$nombre){
            $data= array('nombre' => $nombre);
            $this->db->where('id',$id);
             return $this->db->update('proveedores',$data);
        }
         //Elimina el proveedor
        public function delete($id){

            $data= array('id' => $id);

           return $this->db->delete('proveedores',$data);
        }
         //Devuelve todos los Proveedores
         public function viewAll(){

            return $query=$this->db->get('proveedores')->result();
        }
        //Devuelve el proveedor del parametro pasado
         public function getDealer($id){

            return $this->db->get_where('proveedores',array('id'=>$id))->result();
        }

    }