$("#Country").html("<%= escape_javascript(render(:partial =>"show")) %>");
$('.flash_message').html("<%= escape_javascript(render 'layouts/messages') %>");
