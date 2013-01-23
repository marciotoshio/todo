class Project
	include MongoMapper::Document

	key :name,	String

	many :tasks

	def undone_tasks
		tasks.select{ |t| !t.done }
	end

	def done_tasks
		tasks.select{ |t| t.done }
	end

	def add_task(task_title)
		new_task = Task.new
		new_task.title = task_title
		self.tasks << new_task
		self.save
	end
end