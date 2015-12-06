<?php 
 defined('BASEPATH') OR exit('No direct script access allowed'); 
 
 class Custinfo_Model extends PIXOLO_Model 
 { 
	 public $_table = 'custinfo';  
 
 	 //Write functions here 
     
     public function addcust($vcnumber, $remainingbalance, $contact, $address, $name)
     {
         $sql = $this->db->query("SELECT `vcnumber` FROM `stbinfo` WHERE `vcnumber` = '$vcnumber'")->row();
         
         if($sql==0)
         {
             $query = $this->db->query("INSERT INTO `custinfo` (`name`, `address`, `contact`, `remainingbalance`) VALUES ('$name', '$address', '$contact', '$remainingbalance')");
             $id = $this->db->insert_id();
             
             if($query==true)
             {
                $query1 = $this->db->query("INSERT INTO `stbinfo` (`cid`, `vcnumber`) VALUES ('$id', '$vcnumber')");
             }
             return $query;
         }
         else
         {
             $sql1 = $this->db->query("SELECT `custinfo`.`name`, `custinfo`.`address`, `custinfo`.`contact`, `custinfo`.`cid`, `stbinfo`.`vcnumber` FROM `custinfo` INNER JOIN `stbinfo` ON `custinfo`.`id` = `stbinfo`.`cid` WHERE `stbinfo`.`vcnumber`='$vcnumber' ")->row();
             return $sql1;
         }
         
     }
     
     public function viewcust($id, $contact, $name, $vcnumber)
     {
         $sql = $this->db->query("SELECT `custinfo`.`*`, `stbinfo`.`*` FROM `custinfo` INNER JOIN `stbinfo` ON `custinfo`.`id` = `stbinfo`.`cid` WHERE `stbinfo`.`vcnumber`='$vcnumber' OR `custinfo`.`name`='$name' OR `custinfo`.`contact`='$contact' OR `custinfo`.`cid`='$id'")->row();
         
         return $sql;
     }
 } 
 
 ?>