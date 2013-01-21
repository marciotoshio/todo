require 'sinatra/base'
require './model/task'
require './model/project'

class ToDo < Sinatra::Base
	get '/' do
		@projects = Project.all
		@undone_tasks = Task.undone
		@done_tasks = Task.done
		erb :index
	end
end