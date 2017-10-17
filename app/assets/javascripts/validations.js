$(function(){

    //add custom validator for jquery validator
$.validator.methods.email = function( value, element ) {
  return this.optional( element ) || /[a-z]+@[a-z]+\.[a-z]+/.test( value );
}
$("#my_form").validate({

  errorClass:'error',  
  errorPlacement:function(error,element){
  	element.parent().prev().html(error);
  },
  
  success: function(label) {
    label.parent().next().find('button.success').show();
    label.parent().next().find('button.fail').hide();
    label.parent().html(get_string_from_for(label.attr('for')));
    console.log(label.parent().next());
  },
  
  highlight: function(element, errorClass) {
  	$(element).prev().show();
  },
  
  
  rules: {
    'contact[name]': "required",
    'contact[email]': "required",
    'contact[url]': "required",
   },
   messages:{
   		'contact[name]':{
   			required:'Please enter your name'
   		},
   		'contact[email]':{
   			required:'Please enter your email',
   			email:'Are you sure this is your email?'
   		},
        'contact[url]': {
   			required:'Please fill in your URL (http://mywebsite.com)',
        }
   }
});//end of validate()

$('#contact_name').on('change',function(){
  $('#my_form').validate();
  console.log('here');
});

    
 function get_string_from_for(for_text){
 	switch(for_text) {
    case 'contact_name':
        return 'Name';
        break;
    case 'contact_email':
        return 'Email'
        break;
    case 'contact_url':
        return 'URL'
        break;
    default:
        return '';
	}
}

 });