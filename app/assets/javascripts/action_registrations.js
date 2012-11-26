function brand_selected(brand_id){
	$.ajax({
        type: 'GET',
        url: '/models',
        data: {'brand_id': brand_id},
        success: function(data){
            alert(data);
        },
        dataType: 'json'
    });
}

function model_selected(){
	$.ajax({
        type: 'GET',
        url: '/bodies',
        data: {},
        success: function(data){
            alert(data);
        },
        dataType: 'json'
    });
}

function body_selected(){

}

function DropDown(el) {
				this.dd = el;
				this.placeholder = this.dd.children('span');
				this.opts = this.dd.find('ul.dropdown > li');
				this.val = '';
				this.index = -1;
				this.initEvents();
}

DropDown.prototype = {
				initEvents : function() {
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

						brand_selected(opt.attr("value"));
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

				var dd = new DropDown( $('#dd') );

				$(document).click(function() {
					// all dropdowns
					$('.wrapper-dropdown-3').removeClass('active');
				});

			});