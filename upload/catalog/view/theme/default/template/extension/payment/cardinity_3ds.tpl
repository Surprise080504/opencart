{% if success %}
<form id="cardinity-3ds-form" name="ThreeDForm" method="POST" action="{{ url }}">
	<input type="hidden" name="PaReq" value="{{ PaReq }}" />
	<input type="hidden" name="TermUrl" value="{{ TermUrl }}" />
	<input type="hidden" name="MD" value="{{ MD }}" />
</form>
<script type="text/javascript"><!--
	$('#cardinity-3ds-form').submit();
//--></script>
<?php } ?>
{% if redirect %}
<script type="text/javascript"><!--
	location = '{{ redirect }}';
//--></script>
<?php } ?>
