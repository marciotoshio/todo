var ToDo = ToDo || {};

ToDo.Main = function() {

	this.binds = function() {
		bind_task_title_click();
	}

	function bind_task_title_click() {
		$('.task_title_link').on('click', function() {
			$($(this).attr('href')).slideToggle();
		});
	}
} 

$(function(){
	new ToDo.Main().binds();
});