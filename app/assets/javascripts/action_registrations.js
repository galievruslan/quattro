function brand_selected(brand_id){
	$.ajax({
        type: 'GET',
        url: '/models',
        data: {'brand_id': brand_id},
        success: function(json){
			create_list(json, $('#modelsPlaceHolder'), 'models', model_selected);
		},
		dataType: 'json'
	});
}

function model_selected(){
	$.ajax({
        type: 'GET',
        url: '/bodies',
        data: {},
        success: function(json){
			create_list(json, $('#bodiesPlaceHolder'), 'bodies', body_selected);
		},
		dataType: 'json'
	});
}

function body_selected(){

}

function create_list(data, placeholder, dropdown_id, click_callback) {
	var listName = $(placeholder).find('span').html();
	var contendDiv = '<div id="' + dropdown_id + '" class="wrapper-dropdown-3" tabindex="1">\n';
	contendDiv += '\t<span>' + listName + '</span>\n';
	var list = '\t\t<ul class="dropdown">\n';
   	$.each(data, function() {
   		listItem = '\t\t\t<li value=' + this.id + ">\n";
   		listItem += "\t\t\t\t<a href=\"#\">\n";
   		listItem += "\t\t\t\t\t<i class=\"icon-large\"></i>\n";
   		listItem += this.name;
    	listItem += "\t\t\t\t</a>\n";
    	listItem += "\t\t\t</li>\n";
	   	list += listItem;
	});	
	list += '\t\t</ul>\n';
	contendDiv += list;
   	contendDiv += '</div>\n';
    $(placeholder).html(contendDiv);
    var dd = new DropDown( $('#' + dropdown_id), click_callback );
}

function DropDown(el, click_callback) {
	this.dd = el;
	this.placeholder = this.dd.children('span');
	this.opts = this.dd.find('ul.dropdown > li');
	this.val = '';
	this.index = -1;
	this.initEvents(click_callback);
}

DropDown.prototype = {
	initEvents : function(click_callback) {
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
			click_callback(opt.attr("value"));
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
	var dd = new DropDown( $('#brands'), brand_selected );	

	$(document).click(function() {
		// all dropdowns
		$('.wrapper-dropdown-3').removeClass('active');
	});
});