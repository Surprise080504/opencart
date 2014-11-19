<?php
class ControllerModuleEbaydisplay extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/ebaydisplay');

		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->addScript('view/javascript/openbay/js/faq.js');

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->cache->delete('ebaydisplay');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_start_newest'] = $this->language->get('text_start_newest');
		$data['text_start_random'] = $this->language->get('text_start_random');
		$data['text_about'] = $this->language->get('text_about');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_enabled'] = $this->language->get('text_enabled');

		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_username'] = $this->language->get('entry_username');
		$data['entry_keywords'] = $this->language->get('entry_keywords');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_site'] = $this->language->get('entry_site');
		$data['entry_sort'] = $this->language->get('entry_sort');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
		}
		
		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/ebaydisplay', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL'),
		);

		$data['action'] = $this->url->link('module/ebaydisplay', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
				
		$data['token'] = $this->session->data['token'];
		
		if (isset($this->request->post['username'])) {
			$data['username'] = $this->request->post['username'];
		} elseif (!empty($module_info)) {
			$data['username'] = $module_info['username'];
		} else {
			$data['username'] = '';
		}
		
		if (isset($this->request->post['keywords'])) {
			$data['keywords'] = $this->request->post['keywords'];
		} elseif (!empty($module_info)) {
			$data['keywords'] = $module_info['keywords'];
		} else {
			$data['keywords'] = '';
		}
		
		if (isset($this->request->post['description'])) {
			$data['description'] = $this->request->post['description'];
		} elseif (!empty($module_info)) {
			$data['description'] = $module_info['description'];
		} else {
			$data['description'] = '';
		}
		
		if (isset($this->request->post['limit'])) {
			$data['limit'] = $this->request->post['limit'];
		} elseif (!empty($module_info)) {
			$data['limit'] = $module_info['limit'];
		} else {
			$data['limit'] = 10;
		}
			
		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = '';
		}	
			
		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$data['height'] = $module_info['height'];
		} else {
			$data['height'] = '';
		}	
		
		if (isset($this->request->post['sort'])) {
			$data['sort'] = $this->request->post['sort'];
		} elseif (!empty($module_info)) {
			$data['sort'] = $module_info['sort'];
		} else {
			$data['sort'] = 'StartTimeNewest';
		}	

		if (isset($this->request->post['site'])) {
			$data['site'] = $this->request->post['site'];
		} elseif (!empty($module_info)) {
			$data['site'] = $module_info['site'];
		} else {
			$data['site'] = '';
		}
		
		$data['ebay_sites'] = array(
			0   => 'USA',
			3   => 'UK',
			15  => 'Australia',
			2   => 'Canada (English)',
			71  => 'France',
			77  => 'Germany',
			101 => 'Italy',
			186 => 'Spain',
			205 => 'Ireland',
			16  => 'Austria',
			146 => 'Netherlands',
			23  => 'Belgium (French)',
			123 => 'Belgium (Dutch)',
		);

		if (isset($this->request->post['ebaydisplay_status'])) {
			$data['ebaydisplay_status'] = $this->request->post['ebaydisplay_status'];
		} else {
			$data['ebaydisplay_status'] = $this->config->get('ebaydisplay_status');
		}
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
			
			$data['error_warning'] = $this->language->get('error_openbay');
		}		

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/ebaydisplay.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/ebaydisplay')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['width']) {
			$this->error['width'] = $this->language->get('error_width');
		}
		
		if (!$this->request->post['height']) {
			$this->error['height'] = $this->language->get('error_height');
		}		

		return !$this->error;
	}
}