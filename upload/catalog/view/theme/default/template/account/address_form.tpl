{{ header }}
<div class="container">
  <ul class="breadcrumb">
    {% for breadcrumb in breadcrumbs %}
    <li><a href="{{ breadcrumb.href }}">{{ breadcrumb.text }}</a></li>
    {% endfor %}
  </ul>
  <div class="row">{{ column_left }}
    {% if column_left and column_right %}
    <?php $class = 'col-sm-6'; ?>
    {% elseif column_left || column_right %}
    <?php $class = 'col-sm-9'; ?>
    {% else %}
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="{{ class }}"> {{ content_top }}
      <h2>{{ text_edit_address }}</h2>
      <form action="{{ action }}" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-firstname">{{ entry_firstname }}</label>
            <div class="col-sm-10">
              <input type="text" name="firstname" value="{{ firstname }}" placeholder="{{ entry_firstname }}" id="input-firstname" class="form-control" />
              {% if error_firstname %}
              <div class="text-danger">{{ error_firstname }}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-lastname">{{ entry_lastname }}</label>
            <div class="col-sm-10">
              <input type="text" name="lastname" value="{{ lastname }}" placeholder="{{ entry_lastname }}" id="input-lastname" class="form-control" />
              {% if error_lastname %}
              <div class="text-danger">{{ error_lastname }}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-company">{{ entry_company }}</label>
            <div class="col-sm-10">
              <input type="text" name="company" value="{{ company }}" placeholder="{{ entry_company }}" id="input-company" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-address-1">{{ entry_address_1 }}</label>
            <div class="col-sm-10">
              <input type="text" name="address_1" value="{{ address_1 }}" placeholder="{{ entry_address_1 }}" id="input-address-1" class="form-control" />
              {% if error_address_1 %}
              <div class="text-danger">{{ error_address_1 }}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-address-2">{{ entry_address_2 }}</label>
            <div class="col-sm-10">
              <input type="text" name="address_2" value="{{ address_2 }}" placeholder="{{ entry_address_2 }}" id="input-address-2" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-city">{{ entry_city }}</label>
            <div class="col-sm-10">
              <input type="text" name="city" value="{{ city }}" placeholder="{{ entry_city }}" id="input-city" class="form-control" />
              {% if error_city %}
              <div class="text-danger">{{ error_city }}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-postcode">{{ entry_postcode }}</label>
            <div class="col-sm-10">
              <input type="text" name="postcode" value="{{ postcode }}" placeholder="{{ entry_postcode }}" id="input-postcode" class="form-control" />
              {% if error_postcode %}
              <div class="text-danger">{{ error_postcode }}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-country">{{ entry_country }}</label>
            <div class="col-sm-10">
              <select name="country_id" id="input-country" class="form-control">
                <option value="">{{ text_select }}</option>
                {% for country in countries %}
                {% if country['country_id'] == $country_id %}
                <option value="{{ country.country_id }}" selected="selected">{{ country.name }}</option>
                {% else %}
                <option value="{{ country.country_id }}">{{ country.name }}</option>
                <?php } ?>
                <?php } ?>
              </select>
              {% if error_country %}
              <div class="text-danger">{{ error_country }}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-zone">{{ entry_zone }}</label>
            <div class="col-sm-10">
              <select name="zone_id" id="input-zone" class="form-control">
              </select>
              {% if error_zone %}
              <div class="text-danger">{{ error_zone }}</div>
              <?php } ?>
            </div>
          </div>
         {% for custom_field in custom_fields %}
          {% if custom_field['location'] == 'address') { ?>
          {% if custom_field['type'] == 'select') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="{{ custom_field.sort_order }}">
            <label class="col-sm-2 control-label" for="input-custom-field{{ custom_field.custom_field_id }}">{{ custom_field.name }}</label>
            <div class="col-sm-10">
              <select name="custom_field[{{ custom_field.custom_field_id }}]" id="input-custom-field{{ custom_field.custom_field_id }}" class="form-control">
                <option value="">{{ text_select }}</option>
                {% for custom_field_value in custom_field.custom_field_value %}
                {% if isset($address_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address_custom_field[$custom_field['custom_field_id']]) { ?>
                <option value="{{ custom_field_value.custom_field_value_id }}" selected="selected">{{ custom_field_value.name }}</option>
                {% else %}
                <option value="{{ custom_field_value.custom_field_value_id }}">{{ custom_field_value.name }}</option>
                <?php } ?>
                <?php } ?>
              </select>
              {% if isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          {% if custom_field['type'] == 'radio') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="{{ custom_field.sort_order }}">
            <label class="col-sm-2 control-label">{{ custom_field.name }}</label>
            <div class="col-sm-10">
              <div>
                {% for custom_field_value in custom_field.custom_field_value %}
                <div class="radio">
                  {% if isset($address_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address_custom_field[$custom_field['custom_field_id']]) { ?>
                  <label>
                    <input type="radio" name="custom_field[{{ custom_field.custom_field_id }}]" value="{{ custom_field_value.custom_field_value_id }}" checked="checked" />
                    {{ custom_field_value.name }}</label>
                  {% else %}
                  <label>
                    <input type="radio" name="custom_field[{{ custom_field.custom_field_id }}]" value="{{ custom_field_value.custom_field_value_id }}" />
                    {{ custom_field_value.name }}</label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              {% if isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          {% if custom_field['type'] == 'checkbox') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="{{ custom_field.sort_order }}">
            <label class="col-sm-2 control-label">{{ custom_field.name }}</label>
            <div class="col-sm-10">
              <div>
                {% for custom_field_value in custom_field.custom_field_value %}
                <div class="checkbox">
                  {% if isset($address_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $address_custom_field[$custom_field['custom_field_id']])) { ?>
                  <label>
                    <input type="checkbox" name="custom_field[{{ custom_field.custom_field_id }}][]" value="{{ custom_field_value.custom_field_value_id }}" checked="checked" />
                    {{ custom_field_value.name }}</label>
                  {% else %}
                  <label>
                    <input type="checkbox" name="custom_field[{{ custom_field.custom_field_id }}][]" value="{{ custom_field_value.custom_field_value_id }}" />
                    {{ custom_field_value.name }}</label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              {% if isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          {% if custom_field['type'] == 'text') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="{{ custom_field.sort_order }}">
            <label class="col-sm-2 control-label" for="input-custom-field{{ custom_field.custom_field_id }}">{{ custom_field.name }}</label>
            <div class="col-sm-10">
              <input type="text" name="custom_field[{{ custom_field.custom_field_id }}]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="{{ custom_field.name }}" id="input-custom-field{{ custom_field.custom_field_id }}" class="form-control" />
              {% if isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          {% if custom_field['type'] == 'textarea') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="{{ custom_field.sort_order }}">
            <label class="col-sm-2 control-label" for="input-custom-field{{ custom_field.custom_field_id }}">{{ custom_field.name }}</label>
            <div class="col-sm-10">
              <textarea name="custom_field[{{ custom_field.custom_field_id }}]" rows="5" placeholder="{{ custom_field.name }}" id="input-custom-field{{ custom_field.custom_field_id }}" class="form-control"><?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
              {% if isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          {% if custom_field['type'] == 'file') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="{{ custom_field.sort_order }}">
            <label class="col-sm-2 control-label">{{ custom_field.name }}</label>
            <div class="col-sm-10">
              <button type="button" id="button-custom-field{{ custom_field.custom_field_id }}" data-loading-text="{{ text_loading }}" class="btn btn-default"><i class="fa fa-upload"></i> {{ button_upload }}</button>
              <input type="hidden" name="custom_field[{{ custom_field.custom_field_id }}]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
              {% if isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          {% if custom_field['type'] == 'date') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="{{ custom_field.sort_order }}">
            <label class="col-sm-2 control-label" for="input-custom-field{{ custom_field.custom_field_id }}">{{ custom_field.name }}</label>
            <div class="col-sm-10">
              <div class="input-group date">
                <input type="text" name="custom_field[{{ custom_field.custom_field_id }}]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="{{ custom_field.name }}" data-date-format="YYYY-MM-DD" id="input-custom-field{{ custom_field.custom_field_id }}" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              {% if isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          {% if custom_field['type'] == 'time') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="{{ custom_field.sort_order }}">
            <label class="col-sm-2 control-label" for="input-custom-field{{ custom_field.custom_field_id }}">{{ custom_field.name }}</label>
            <div class="col-sm-10">
              <div class="input-group time">
                <input type="text" name="custom_field[{{ custom_field.custom_field_id }}]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="{{ custom_field.name }}" data-date-format="HH:mm" id="input-custom-field{{ custom_field.custom_field_id }}" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              {% if isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          {% if custom_field['type'] == 'datetime') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="{{ custom_field.sort_order }}">
            <label class="col-sm-2 control-label" for="input-custom-field{{ custom_field.custom_field_id }}">{{ custom_field.name }}</label>
            <div class="col-sm-10">
              <div class="input-group datetime">
                <input type="text" name="custom_field[{{ custom_field.custom_field_id }}]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="{{ custom_field.name }}" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field{{ custom_field.custom_field_id }}" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              {% if isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php } ?>
          <?php } ?>
          <div class="form-group">
            <label class="col-sm-2 control-label">{{ entry_default }}</label>
            <div class="col-sm-10">
              {% if default %}
              <label class="radio-inline">
                <input type="radio" name="default" value="1" checked="checked" />
                {{ text_yes }}</label>
              <label class="radio-inline">
                <input type="radio" name="default" value="0" />
                {{ text_no }}</label>
              {% else %}
              <label class="radio-inline">
                <input type="radio" name="default" value="1" />
                {{ text_yes }}</label>
              <label class="radio-inline">
                <input type="radio" name="default" value="0" checked="checked" />
                {{ text_no }}</label>
              <?php } ?>
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="{{ back }}" class="btn btn-default">{{ button_back }}</a></div>
          <div class="pull-right">
            <input type="submit" value="{{ button_continue }}" class="btn btn-primary" />
          </div>
        </div>
      </form>
      {{ content_bottom }}</div>
    {{ column_right }}</div>
</div>
<script type="text/javascript"><!--
// Sort the custom fields
$('.form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('.form-group').length-2) {
		$('.form-group').eq(parseInt($(this).attr('data-sort'))+2).before(this);
	}

	if ($(this).attr('data-sort') > $('.form-group').length-2) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('.form-group').length-2) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('.form-group').length-2) {
		$('.form-group:first').before(this);
	}
});
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});
//--></script>
<script type="text/javascript"><!--
$('select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/account/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
			}

			html = '<option value="">{{ text_select }}</option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '{{ zone_id }}') {
						html += ' selected="selected"';
			  		}

			  		html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected">{{ text_none }}</option>';
			}

			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
{{ footer }}
