function brand_selected(brand_id, brand_name){
	$.ajax({
        type: 'GET',
        url: '/models',
        data: {'brand_id': brand_id},
        success: function(json){
			create_list(json, '#modelsPlaceHolder', '#modelsListTemplate', 'models', model_selected);
		},
		dataType: 'json'
	});

	$('#brand_id').val(brand_id);
	$('#brands_label').text(brand_name);

	$('#bodies').remove();	
	$('#model_id').val(null);
	$('#body_id').val(null);
}

function model_selected(model_id, model_name){
	$.ajax({
        type: 'GET',
        url: '/bodies',
        data: {},
        success: function(json){
			create_list(json, '#bodiesPlaceHolder', '#bodiesListTemplate', 'bodies', body_selected);
		},
		dataType: 'json'
	});

	$('#model_id').val(model_id);
	$('#models_label').text(model_name);
	$('#body_id').val(null);
}

function body_selected(body_id, body_name){
	$('#body_id').val(body_id);
	$('#bodies_label').text(body_name);
}

function create_list(data, placeholder, template, newId, clickCallback) {
	var listTemplate = $(template).clone();	
	listTemplate.first().attr('id', newId);

	$.each(data, function() {
		var listItemTemplate = $('#listItemTemplate').clone();
		listItemTemplate.removeAttr('id');
		listItemTemplate.attr('value', this.id);		
		listItemTemplate.append(this.name);
		listTemplate.find('.dropdown-menu').append(listItemTemplate);
	});
	
	AddEventListeners($(listTemplate));
	$(placeholder).html($(listTemplate));
}

$(function() {
	$(document).ready(AddEventListeners($('.dropdown-menu')));
});

function AddEventListeners(menu){
	$(menu).on('click', 'li', function(event) {
			var listId = $(this).parent().parent().attr('id');
			var listItemValue = $(this).val();
			var listItemText = $(this).text();

			switch(listId) {
				case 'brands': {
					brand_selected(listItemValue, listItemText);
					break;
				}
				case 'models' : {
					model_selected(listItemValue, listItemText);
					break;
				}
				case 'bodies' : {
					body_selected(listItemValue, listItemText);
					break;
				}
			}
		});
}