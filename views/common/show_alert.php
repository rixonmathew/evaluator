<? if (isset($show_alert) && $show_alert) { ?>
    <div class="alert alert-<?=$alert_type?> alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <?=$alert_message?>
    </div>
<? } ?>
