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
end