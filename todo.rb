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

	post '/create' do
		project = Project.find(params[:project_id])
		project.add_task(params[:task_title])
		redirect to("/?project_id=#{params[:project_id]}")
	end
end