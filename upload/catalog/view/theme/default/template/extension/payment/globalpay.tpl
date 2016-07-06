<form action="{{ action }}" method="POST" class="form-horizontal" id="globalpay_form_redirect">
  <input type=hidden name="MERCHANT_ID" value="{{ merchant_id }}" />
  <input type=hidden name="ORDER_ID" value="{{ order_id }}" />
  <input type=hidden name="CURRENCY" value="{{ currency }}" >
  <input type=hidden name="AMOUNT" value="{{ amount }}" >
  <input type=hidden name="TIMESTAMP" value="{{ timestamp }}" />
  <input type=hidden name="SHA1HASH" value="{{ hash }}">
  <input type=hidden name="AUTO_SETTLE_FLAG" value="{{ settle }}">
  <input type=hidden name="RETURN_TSS" value="{{ tss }}">
  <input type=hidden name="BILLING_CODE" value="{{ billing_code }}">
  <input type=hidden name="BILLING_CO" value="{{ payment_country }}">
  <input type=hidden name="SHIPPING_CODE" value="{{ shipping_code }}">
  <input type=hidden name="SHIPPING_CO" value="{{ shipping_country }}">
  <input type=hidden name="MERCHANT_RESPONSE_URL" value="{{ response_url }}">
  <input type=hidden name="COMMENT1" value="OpenCart">
  {% if card_select == true) { ?>
  <fieldset id="payment">
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-cc-type"><span data-toggle="tooltip" title="{{ help_select_card }}">{{ entry_cc_type }}</span></label>
      <div class="col-sm-10">
        <select name="ACCOUNT" class="form-control" id="input-cc-type">
          <?php foreach ($cards as $card) { ?>
          <option value="<?php echo $card['account']; ?>"><?php echo $card['type']; ?></option>
          <?php } ?>
        </select></div>
    </div>
  </fieldset>
  <?php } ?>
</form>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="{{ button_confirm }}" id="button-confirm" class="btn btn-primary" />
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').bind('click', function() {
  $('#globalpay_form_redirect').submit();
});
//--></script>