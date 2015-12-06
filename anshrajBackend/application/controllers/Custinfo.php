<?php 
 defined('BASEPATH') OR exit('No direct script access allowed'); 
 
 header('Access-Control-Allow-Origin: *'); 
 
 class Custinfo extends PIXOLO_Controller { 
 
 	 function __construct(){ 
 	 	 parent::__construct(); 
 
 	 	 $this->load->model('Custinfo_Model', 'model'); 
 	 } 

 	 public function index() 
 	 { 
 	 	 $message['json']=$this->model->get_all(); 
 	 	 $this->load->view('json', $message); 
 	 } 
     public function addcust()
 	 {
 	 	$data = $this->input->get('data');
 	 	$data = json_decode($data); 	  
 	 	$name = $data->name;
 	 	$address = $data->address;	 	
 	 	$contact = $data->contact;
 	 	$remainingbalance = $data->remainingbalance;
 	 	$vcnumber = $data->vcnumber;
 	 	$message['json'] = $this->model->addcust($vcnumber, $remainingbalance, $contact, $address, $name);
 	 	$this->load->view('json', $message);
 	 }
     
      public function viewcust()
 	 {
 	 	$data = $this->input->get('data');
 	 	$data = json_decode($data); 	  
 	 	$name = $data->name; 	
 	 	$contact = $data->contact; 	 	
 	 	$vcnumber = $data->vcnumber;
 	 	$id = $data->id;
 	 	$message['json'] = $this->model->viewcust($id, $contact, $name, $vcnumber);
 	 	$this->load->view('json', $message);
 	 }
 }