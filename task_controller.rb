require 'sinatra/base'

class TaskController < Sinatra::Base
	post '/done' do
		task = Task.find(params[:task_id])
		task.done = !task.done
		task.save
	end

	post '/edit_description' do
		task = Task.find(params[:task_id])
		task.description = params[:description]
		task.save
	end
end