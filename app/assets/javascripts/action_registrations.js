function brand_selected(brand_id){
	$.ajax({
        type: 'GET',
        url: '/models',
        data: {'brand_id': brand_id},
        success: function(json){
			create_list(json, '#modelsPlaceHolder', '#modelsListTemplate', 'models', model_selected);
		},
		dataType: 'json'
	});

	$('#bodies').remove();
	$('#brand_id').val(brand_id);
	$('#model_id').val(null);
	$('#body_id').val(null);
}

function model_selected(model_id){
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
	$('#body_id').val(null);
}

function body_selected(body_id){
	$('#body_id').val(body_id);
}

function create_list(data, placeholder, template, newId, clickCallback) {
	var listTemplate = $(template).clone();	
	listTemplate.first().attr('id', newId);

	$.each(data, function() {
		var listItemTemplate = $('#listItemTemplate').clone();
		listItemTemplate.removeAttr('id');
		listItemTemplate.attr('value', this.id);		
		listItemTemplate.find('a').append(this.name);
		listTemplate.find('.dropdown').append(listItemTemplate);
	});

	$(placeholder).html($(listTemplate));
	var dd = new DropDown( $('#' + newId), clickCallback );
}

function DropDown(el, clickCallback) {
	this.dd = el;
	this.placeholder = this.dd.children('span');
	this.opts = this.dd.find('ul.dropdown > li');
	this.val = '';
	this.index = -1;
	this.initEvents(clickCallback);
}

DropDown.prototype = {
	initEvents : function(clickCallback) {
		var obj = this;

		obj.dd.bind('click', function(event){
			$(this).toggleClass('active');
			return false;
		});

		obj.opts.bind('click',function(){
			var opt = $(this);
			obj.val = opt.text();						
			obj.index = opt.index();
			obj.placeholder.text(obj.val);
			clickCallback(opt.attr("value"));
		});
	},
	getValue : function() {
		return this.val;
	},
	getIndex : function() {
		return this.index;
	}
}

$(function() {
	new DropDown( $('#brands'), brand_selected );
	if ($('#models')){
		new DropDown( $('#models'), model_selected );
	}
	if ($('#bodies')) {
		new DropDown( $('#bodies'), body_selected );
	}

	$(document).click(function() {
		// all dropdowns
		$('.wrapper-dropdown-3').removeClass('active');
	});
});