require 'sinatra/base'
require './model/task'

class ToDo < Sinatra::Base
	get '/' do
		@undone_tasks = Task.undone
		@done_tasks = Task.done
		erb :index
	end
end