<?php
class vehicule extends CI_Model {
	public function checkLogin($numero,$idType)
	{
		$sql = "SELECT numero,id_type from vehicule where numero = %d and type = %d ";
		sprintf($sql,$this->db->escape($numero),$this->db->);
	}
	public function checkIfExist ($numero)
	{
		$sql = "SELECT numero,id_type from vehicule where numero = %d ";
		$this->db->query($sql);
	}
}
