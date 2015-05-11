require 'sinatra/base'

class TaskController < Sinatra::Base
	post '/task/done' do
		task = Task.find(params[:task_id])
		task.done = !task.done
		task.save
	end

	post '/task/edit_description' do
		task = Task.find(params[:task_id])
		task.description = params[:description]
		task.save
	end

	post '/task/delete' do
		Task.delete(params[:id])
	end
end