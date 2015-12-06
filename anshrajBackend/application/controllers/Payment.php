<?php 
 defined('BASEPATH') OR exit('No direct script access allowed'); 
 
 header('Access-Control-Allow-Origin: *'); 
 
 class Payment extends PIXOLO_Controller { 
 
 	 function __construct(){ 
 	 	 parent::__construct(); 
 
 	 	 $this->load->model('Payment_Model', 'model'); 
 	 } 

 	 public function index() 
 	 { 
 	 	 $message['json']=$this->model->get_all(); 
 	 	 $this->load->view('json', $message); 
 	 } 
     public function payment()
     { 	 
 	 	$data = $this->input->get('data');
 	 	$data = json_decode($data); 	  
 	 	$id = $data->id;
 	 	$amount = $data->amount;
 	 	$message['json'] = $this->model->payment($id, $amount);
 	 	$this->load->view('json', $message);
 	 
     }
 }