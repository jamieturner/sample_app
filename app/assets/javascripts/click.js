$('a.tag').live('click', function(e){

// add selected class
$(this).toggleClass('selected');

var newTag = '';
$('a.tag.selected').each(function(){

    // add seperator
    newTag += ((newTag.length > 0) ? ', ' : '');

    // add value;
    newTag += $(this).text();
});
$('#tag').val(newTag);

return false;  
});