<?php 
class ModelPaymentSecPay extends Model {
  	public function getMethod() {
		$this->load->language('payment/secpay');
		
		if ($this->config->get('secpay_status')) {
			$address = $this->customer->getAddress($this->session->data['payment_address_id']);
			
      		$query = $this->db->query("SELECT * FROM zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('secpay_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
			
			if (!$this->config->get('secpay_geo_zone_id')) {
        		$status = TRUE;
      		} elseif ($query->num_rows) {
      		  	$status = TRUE; 
      		} else {
     	  		$status = FALSE;
			}	
      	} else {
			$status = FALSE;
		}
		
		$method_data = array();
	
		if ($status) {  
      		$method_data = array( 
        		'id'         => 'secpay',
        		'title'      => $this->language->get('text_title'),
				'sort_order' => $this->config->get('secpay_sort_order')
      		);
    	}
   
    	return $method_data;
  	}
}
?>