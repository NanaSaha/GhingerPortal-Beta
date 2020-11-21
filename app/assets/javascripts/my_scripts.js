// $(document).ready(function () {
// 	alert("Saved to ghinger");
// });

$(document).ready(function(){
	$('form').attr('autocomplete', 'off');

	$('.combobox').combobox();

	$('span.input-group-addon').addClass("hidden");

});

$('span.input-group-addon').addClass("hidden");
var requester_cat;

    
function change() { 
    requester_cat = document.getElementById('req_cat');
    //alert(requester_cat.value);
    
	 	if (requester_cat.value == 'T')  {
            console.log('This is the if');
            $("#beneficiary_name").removeClass("hidden");
            //document.getElementById("foreign_licence").disabled = false;
            //document.getElementById("foreign_licence").required = true;
            }
         else{
              console.log('This is the else');
              $("#beneficiary_name").addClass("hidden");
              //document.getElementById("foreign_licence").disabled = true;
              //document.getElementById("foreign_licence").required = false;
            }  
 }
 
 //get the personal doctor subscription
 var person_doctor_subscription 
 function pdSub(){
 	person_doctor_subscription = document.getElementById('person_type')
 	console.log('Work on initial'); 		
 	// alert(person_doctor_subscription.value);
 	if (person_doctor_subscription.value == 'D'){
 		console.log('This is the if part, the person is a doctor');
 		$("#pd_sub").removeClass("hidden");
 	}
 	else
 	{
 		console.log('This is the else part, the person is not a doctor');
 		$("#pd_sub").addClass("hidden");
 	}
 
 }
 
 
 
 
//show lab service function	
var appointment_type;
function lab(){
	appointment_type = document.getElementById('appt_type');
	 // alert(appointment_type.value)	
	if (appointment_type.value == 'LA' ){
		console.log('This is the if');
		$('#extra_type').removeClass("hidden");
		$('#hide').removeClass("hidden");
		$('#location').removeClass("hidden");
		$('#reg_urgency').removeClass("hidden");
		$('#req_type').removeClass("hidden");
		$('#prev_history').removeClass("hidden");
		$('#datetime').removeClass("hidden");
		$('#allergy').removeClass("hidden");
		$('#chose-lab').removeClass("hidden");
		
		// hide the rest
		$('#provider').addClass("hidden");
		$('#medication').addClass("hidden");
	      $('#has_pd').addClass("hidden");
	      $('#complaint').addClass("hidden");
	    
	}
	else if(appointment_type.value == 'MA'){		
		console.log('appointment id is MA');
		$('#location').removeClass("hidden");
		$('#provider').removeClass("hidden");
		$('#reg_urgency').removeClass("hidden");
		$('#req_type').removeClass("hidden");
		$('#datetime').removeClass("hidden");
		$('#allergy').removeClass("hidden");
		$('#complaint').removeClass("hidden");
		$('#prev_history').removeClass("hidden");
		
		// hide the rest
		$('#extra_type').addClass("hidden");
		$('#hide').addClass("hidden");
	       $('#show').addClass("hidden");
	       $('#medication').addClass("hidden");
	       $('#has_pd').addClass("hidden");
	       $('#complaint').removeClass("hidden");
		$('#prev_history').removeClass("hidden");
		$('#chose-lab').addClass("hidden");
		
		
	}	
	else if(appointment_type.value == 'MD'){
		$('#location').removeClass("hidden");
		$('#req_type').removeClass("hidden");
		$('#reg_urgency').removeClass("hidden");
		$('#allergy').removeClass("hidden");
		$('#medication').removeClass("hidden");
		// $('#allergy').removeClass("hidden");
		$('#prev_history').removeClass("hidden");
		$('#extra_type').removeClass("hidden");
		$('#hide').removeClass("hidden");
	       
	       // $('#show').removeClass("hidden");
		
		// hide the rest
		// $('#extra_type').addClass("hidden");
		// $('#hide').addClass("hidden");
	       $('#show').addClass("hidden");
	    // $('#medication').addClass("hidden");
	       $('#has_pd').addClass("hidden");
	       $('#provider').addClass("hidden");
	       $('#complaint').addClass("hidden");
	       $('#chose-lab').addClass("hidden");
	    
				
	}
	else if (appointment_type.value == 'PD'){
		$('#location').removeClass("hidden");
		$('#prev_history').removeClass("hidden");
		$('#has_pd').removeClass("hidden");
		$('#reg_urgency').removeClass("hidden");
		$('#req_type').removeClass("hidden");
			
		$("#has_pd_value").click(function() {
		if ($("#has_pd_value").is(":checked")) {
                 $('#pd_name').removeClass("hidden");
               }
               else
               {
               	 $('#pd_name').addClass("hidden");
               }
		   });
	
	 // Hide the rest
		$('#provider').addClass("hidden");
		$('#datetime').addClass("hidden");
		$('#allergy').addClass("hidden");
		$('#complaint').addClass("hidden");
		$('#extra_type').addClass("hidden");
		$('#hide').addClass("hidden");
	       $('#show').addClass("hidden");
	       $('#medication').addClass("hidden");
	       $('#chose-lab').addClass("hidden");
	    			
	}
	
	else if (appointment_type.value == 'VC'){
		$('#datetime').removeClass("hidden");	
		
		$('#req_type').removeClass("hidden");
		$('#reg_urgency').removeClass("hidden");
		$('#complaint').removeClass("hidden");
		$('#prev_history').removeClass("hidden");
		
		// Hide the rest
		$('#location').addClass("hidden");
		$('#provider').addClass("hidden");
		$('#allergy').addClass("hidden");
		// $('#complaint').addClass("hidden");
		$('#extra_type').addClass("hidden");
		$('#hide').addClass("hidden");
	    	$('#show').addClass("hidden");
	    	$('#medication').addClass("hidden");
	    // $('#prev_history').addClass("hidden");
	    	$('#has_pd').addClass("hidden");
	    	$('#chose-lab').addClass("hidden");
			
	}	
	
	else if (appointment_type.value == 'HC'){
		$('#location').removeClass("hidden");
		$('#req_type').removeClass("hidden");
		$('#reg_urgency').removeClass("hidden");
		$('#complaint').removeClass("hidden");
		$('#prev_history').removeClass("hidden");
		$('#allergy').removeClass("hidden");
		$('#datetime').removeClass("hidden");
		
		// Hide the rest
		$('#extra_type').addClass("hidden");
	       $('#hide').addClass("hidden");
	       $('#show').addClass("hidden");
	       $('#has_pd').addClass("hidden");
	       $('#provider').addClass("hidden");
	       $('#chose-lab').addClass("hidden");
		
	}
	
	// pds services
	else if (appointment_type.value == 'PC'){
		$('#datetime').removeClass("hidden");
		$('#req_type').removeClass("hidden");
		$('#reg_urgency').removeClass("hidden");
		$('#complaint').removeClass("hidden");
		$('#prev_history').removeClass("hidden");
		
		// Hide the rest
		$('#location').addClass("hidden");
		$('#provider').addClass("hidden");
		$('#allergy').addClass("hidden");
		// $('#complaint').addClass("hidden");
		$('#extra_type').addClass("hidden");
		$('#hide').addClass("hidden");
	       $('#show').addClass("hidden");
	       $('#medication').addClass("hidden");
	    // $('#prev_history').addClass("hidden");
	       $('#has_pd').addClass("hidden");
	       $('#duration').addClass("hidden");
	       $('#chose-lab').addClass("hidden");
	   
	}
	
	else if (appointment_type.value == 'PDVC'){
		$('#datetime').removeClass("hidden");
		$('#req_type').removeClass("hidden");
		$('#reg_urgency').removeClass("hidden");
		$('#complaint').removeClass("hidden");
		$('#prev_history').removeClass("hidden");
		
		// Hide the rest
		$('#location').addClass("hidden");
		$('#provider').addClass("hidden");
		$('#allergy').addClass("hidden");
		// $('#complaint').addClass("hidden");
		$('#extra_type').addClass("hidden");
		$('#hide').addClass("hidden");
	       $('#show').addClass("hidden");
	       $('#medication').addClass("hidden");
	    // $('#prev_history').addClass("hidden");
	       $('#has_pd').addClass("hidden");
	       $('#duration').addClass("hidden");
	       $('#chose-lab').addClass("hidden");
	}
	
	else if (appointment_type.value == 'PDHC'){
		$('#datetime').removeClass("hidden");
		$('#req_type').removeClass("hidden");
		$('#reg_urgency').removeClass("hidden");
		$('#complaint').removeClass("hidden");
		$('#prev_history').removeClass("hidden");
		
		// Hide the rest
		$('#location').addClass("hidden");
		$('#provider').addClass("hidden");
		$('#allergy').addClass("hidden");
		// $('#complaint').addClass("hidden");
		$('#extra_type').addClass("hidden");
		$('#hide').addClass("hidden");
	       $('#show').addClass("hidden");
	       $('#medication').addClass("hidden");
	    // $('#prev_history').addClass("hidden");
	       $('#has_pd').addClass("hidden");
	       $('#duration').addClass("hidden");
	       $('#chose-lab').addClass("hidden");
	}
	
	else if (appointment_type.value == 'PDDP'){
		$('#req_type').removeClass("hidden");
		$('#reg_urgency').removeClass("hidden");
		$('#medication').removeClass("hidden");
		$('#duration').removeClass("hidden");
		
		// Hide the rest
		$('#location').addClass("hidden");
		$('#provider').addClass("hidden");
		$('#allergy').addClass("hidden");
		$('#complaint').addClass("hidden");
		$('#extra_type').addClass("hidden");
		$('#hide').addClass("hidden");
	       $('#show').addClass("hidden");
	       $('#prev_history').addClass("hidden");
	       $('#has_pd').addClass("hidden");
	       $('#datetime').addClass("hidden");
	       $('#chose-lab').addClass("hidden");

	}
	
	else 
	{
	  $('#extra_type').addClass("hidden");
	  $('#hide').addClass("hidden");
	  $('#show').addClass("hidden");
	  $('#location').addClass("hidden");
	  $('#provider').addClass("hidden");
	  $('#reg_urgency').addClass("hidden");
	  $('#allergy').addClass("hidden");
	  $('#req_type').addClass("hidden");
	  $('#datetime').addClass("hidden");
	  $('#complaint').addClass("hidden");
	  $('#medication').addClass("hidden");
	  $('#prev_history').addClass("hidden");
	  $('#has_pd').addClass("hidden");
	  $('#datetime').addClass("hidden");
	  $('#chose-lab').addClass("hidden"); 
	  
	  
	}
}

//hide lab services function
function hideLab(){
	appointment_type = document.getElementById('appt_type');
    if (appointment_type.value == 'LA'){
    	$('#extra_type').addClass("hidden");   
        $('#hide').addClass("hidden");
    	$('#show').removeClass("hidden");
    	$('#chose-lab').removelass("hidden");
    }
    else
    {
      $('#extra_type').addClass("hidden");
	  $('#hide').addClass("hidden");
	  $('#show').addClass("hidden");
	  $('#chose-lab').addClass("hidden");
	}
}

function showLab(){
	appointment_type = document.getElementById('appt_type');
	if (appointment_type.value == 'LA'){
		$('#extra_type').removeClass("hidden");
		$('#hide').removeClass("hidden");
    		$('#show').addClass("hidden");
    		$('#chose-lab').removelass("hidden");
    }
    else
    {
    	$('#extra_type').addClass("hidden");   
        $('#hide').addClass("hidden");
    	$('#show').removeClass("hidden");
    	$('#chose-lab').addClass("hidden");
    }
    
    
}


// Doctor's genenal and pds appointment dropdown

function myAccFunc() {
    var x = document.getElementById("demoAcc");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-black";
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-black", "");
    }
}
