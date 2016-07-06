<h2>{{ heading_title }}</h2>

<table class="table table-bordered table-hover">
  <thead>
    <tr>
      <td class="text-left" colspan="2">{{ text_reference_info }}</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="text-left" style="width: 50%;">
	    <b>{{ text_laybuy_ref_no }}</b> <?php echo $transaction['laybuy_ref_no']; ?>
	  </td>
      <td class="text-left">
	    <b>{{ text_paypal_profile_id }}</b> <?php echo $transaction['paypal_profile_id']; ?>
	  </td>
    </tr>
  </tbody>
</table>

<table class="table table-bordered table-hover">
  <thead>
    <tr>
      <td class="text-left" colspan="2">{{ text_payment_plan }}</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="text-left" style="width: 50%;">
	    <b>{{ text_status }}</b> <?php echo $transaction['status']; ?><br />
	    <b>{{ text_downpayment_percent }}</b> <?php echo $transaction['downpayment'] . '%'; ?><br />
	    <b>{{ text_payment_amounts }}</b> <?php echo $transaction['payment_amounts']; ?><br />
	    <b>{{ text_first_payment_due }}</b> <?php echo $transaction['first_payment_due']; ?>
	  </td>
      <td class="text-left">
	    <b>{{ text_amount }}</b> <?php echo $transaction['amount']; ?><br />
	    <b>{{ text_downpayment_amount }}</b> <?php echo $transaction['downpayment_amount']; ?><br />
	    <b>{{ text_months }}</b> <?php echo $transaction['months']; ?><br />
	    <b>{{ text_last_payment_due }}</b> <?php echo $transaction['last_payment_due']; ?>
	  </td>
    </tr>
  </tbody>
</table>

<table class="table table-bordered table-hover">
  <thead>
    <tr>
	  <th>{{ column_instalment; }}</th>
	  <th>{{ column_amount; }}</th>
	  <th>{{ column_date; }}</th>
	  <th>{{ column_pp_trans_id; }}</th>
	  <th>{{ column_status; }}</th>
	</tr>
  </thead>
  <tbody>
  <?php foreach ($transaction['report'] as $report) { ?>
    <?php if ($report['instalment'] == '0') { ?>
      <tr>
	    <td>{{ text_downpayment }}</td>
	    <td><?php echo $report['amount']; ?></td>
	    <td><?php echo $report['date']; ?></td>
	    <td><?php echo $report['pp_trans_id']; ?></td>
	    <td><?php echo $report['status']; ?></td>
	  </tr>
    <?php } else { ?>
      <tr>
	    <td><?php echo $text_month . ' ' . $report['instalment']; ?></td>
	    <td><?php echo $report['amount']; ?></td>
	    <td><?php echo $report['date']; ?></td>
	    <td><?php echo $report['pp_trans_id']; ?></td>
	    <td><?php echo $report['status']; ?></td>
	  </tr>
    <?php } ?>
  <?php } ?>
  </tbody>
</table>