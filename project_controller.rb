require 'sinatra/base'
require './helpers/todo_helper'

class ProjectController < Sinatra::Base
	helpers TodoHelper

	post '/create_task' do
		project = Project.find(params[:project_id])
		project.add_task(params[:task_title])
		redirect to("/?project_id=#{params[:project_id]}")
	end

	post '/create_project' do
		project = Project.new
		project.name = params[:project_name]
		project.uid = get_current_user[:uid]
		project.save
		redirect to("/?project_id=#{project._id}")
	end
end