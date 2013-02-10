var ToDo = ToDo || {};

ToDo.Main = function() {

	this.binds = function() {
		bind_task_title_click();
		bind_checkbox_click();
		bind_description_hover();
		bind_description_link_click();
		bind_description_form_submit();
	}

	function bind_task_title_click() {
		$('.task_title_link').on('click', function(event) {
			event.preventDefault();
			$($(this).attr('href')).slideToggle();
		});
	}

	function bind_checkbox_click() {
		$('input[type="checkbox"]').on('click', function() {
			var task_id = $(this).val();
			var url = $(this).parent().attr('action');
			var task_type = $(this).parents('.task-list').attr('data-task-type');
			$.post(url, {'task_id': task_id}).done(handle_done_success.call(this, task_type));
		});
	}

	function handle_done_success(task_type) {
		var checkbox = $(this);
		var task_group = checkbox.parents('.task-group');
		task_group.fadeOut(function() {
			append_task_group(task_group, task_type, checkbox);
			task_group.fadeIn('slow');
		});
	}

	function append_task_group(task_group, from_task_type, checkbox) {
		var to_task_type = from_task_type === 'done-tasks' ? 'undone-tasks' : 'done-tasks';
		$('.task-list[data-task-type="' + to_task_type + '"]').append(task_group);
		checkbox.prop('checked', to_task_type === 'done-tasks' ? true : false);
	}

	function bind_description_hover() {
		$('.task-description').hover(
			function() { $(this).children('.edit-button-wrapper').show() },
			function() { $(this).children('.edit-button-wrapper').hide() }
		);
	}

	function bind_description_link_click() {
		$('.description-edit-link').on('click', function(event) {
			event.preventDefault();
			$(this).parents('.task-description').children('.description-text').hide();
			$(this).parents('.task-description').children('.description-form').show();
		});
	}

	function bind_description_form_submit() {
		$('.description-form form').on('submit', function(event) {
			event.preventDefault();
			var data = $(this).serialize();
			$.post($(this).attr('action'), data).done(handle_edit_description_success.call(this));
		});
	}

	function handle_edit_description_success() {
		var top_parent = $(this).parents('.task-description');
		top_parent.find('.description-text pre').text($(this).children('textarea').val());
		top_parent.children('.description-text').show();
		top_parent.children('.description-form').hide();
	}
} 

$(function(){
	new ToDo.Main().binds();
});