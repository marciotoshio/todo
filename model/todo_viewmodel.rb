require './model/task'
require './model/project'

class TodoViewModel
	attr_accessor :projects, :project_id, :undone_tasks, :done_tasks

	def initialize(project_id)
		@projects = Project.all #for the project list menu
		
		@project_id = project_id
		project = Project.find(project_id)
		
		@undone_tasks = project ? project.undone_tasks : Task.undone
		@done_tasks = project ? project.done_tasks : Task.done
	end
end