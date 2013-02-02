var ToDo = ToDo || {};

ToDo.Main = function() {

	this.binds = function() {
		bind_task_title_click();
		bind_checkbox_click();
	}

	function bind_task_title_click() {
		$('.task_title_link').on('click', function() {
			$($(this).attr('href')).slideToggle();
		});
	}

	function bind_checkbox_click() {
		$('input[type="checkbox"]').on('click', function() {
			var task_id = $(this).val();
			var url = 'done/' + task_id;
			var task_type = $(this).parents('.task-list').attr('data-task-type');
			$.post(url).success(handle_done_success.call(this, task_type));
		});
	}

	function handle_done_success(task_type) {
		var checkbox = $(this);
		var task_group = checkbox.parent().parent();
		task_group.fadeOut(function() {
			if(task_type === 'done-tasks') {
				$('.task-list[data-task-type="undone-tasks"]').append(task_group);
				checkbox.prop('checked', false);
			} else {
				$('.task-list[data-task-type="done-tasks"]').append(task_group);
				checkbox.prop('checked', true);
			}
			task_group.fadeIn('slow');
		});
	}
} 

$(function(){
	new ToDo.Main().binds();
});