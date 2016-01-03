<?php 
 defined('BASEPATH') OR exit('No direct script access allowed'); 
 
 class Payment_Model extends PIXOLO_Model 
 { 
	 public $_table = 'payment';  
 
 	 //Write functions here 
     
     public function payment($id, $amount)
     {
         $query = $this->db->query("INSERT INTO `payment`(`amount`,`cid`, `date`) VALUES ('$amount', '$id', now())");
         
         if($query== true)
         {
             $sql = $this->db->query("UPDATE `custinfo` SET `remainingbalance` = `remainingbalance`- '$amount' WHERE `id`='$id'");
             if($sql == true)
             {
                 $sql1 = $this->db->query("UPDATE `custinfo` SET `remainingbalance` = 0 WHERE `remainingbalance`<=0");
             }
         }
         return $query;
     }
     
      public function paymentreport()
      {
          $query = $this->db->query("SELECT SUM(`amount`) AS `total collection` FROM `payment`")->row();
          return $query;
      }
     
     public function paymentreportbyid($id)
      {
          $query = $this->db->query("SELECT `amount`, `date` FROM `payment` WHERE `cid` = '$id'")->result();
          return $query;
      }
 } 
 
 ?>