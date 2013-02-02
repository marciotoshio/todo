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
end