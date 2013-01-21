require 'sinatra/base'
require './model/task'

class ToDo < Sinatra::Base
	get '/' do
		@tasks = Task.all
		erb :index
	end
end