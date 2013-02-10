require 'sinatra/base'
require './model/todo_viewmodel'

class ToDo < Sinatra::Base
	helpers do
    	def partial (template, locals = {})
      		erb(template, :layout => false, :locals => locals)
    	end
  	end

	get '/?:project_id?' do
		@viewmodel = TodoViewModel.new(params[:project_id])
		erb :index
	end

	post '/create_task' do
		project = Project.find(params[:project_id])
		project.add_task(params[:task_title])
		redirect to("/?project_id=#{params[:project_id]}")
	end

	post '/create_project' do
		project = Project.new
		project.name = params[:project_name]
		project.save
		redirect to("/?project_id=#{project._id}")
	end

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