$("#Country").html("<%= escape_javascript(render(:partial => "find_countries")) %>");
$("#Region_State").html("<%= escape_javascript(render(:partial=>"region_masters/index")) %>"); 