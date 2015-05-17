require 'sinatra/base'
require './helpers/todo_helper'
require './models/project'
require './models/task'
require './auth_controller'
require './project_controller'
require './task_controller'

class ToDo < Sinatra::Base
	enable :sessions
	
	configure :development do
		MongoMapper.setup({'development' => {'uri' => 'mongodb://127.0.0.1:27017/todo-dev'}}, 'development')
		use OmniAuth::Builder do
			provider :developer
		end
	end

	configure :production do
		MongoMapper.setup({'production' => {'uri' => 'mongodb://127.0.0.1:27017/todo'}}, 'production')
		use OmniAuth::Builder do
			provider :twitter, '{TWITTER_KEY}', '{TWITTER_SECRET}'
		end
	end

	helpers TodoHelper

  	before /^(?!\/auth)/ do
  		authorized!
  	end

  	get '/?:project_id?' do
		@projects = Project.where(:uid => get_current_user[:uid]) #for the project list menu
		@project = Project.find(params[:project_id])
		@undone_tasks = @project ? @project.undone_tasks : get_tasks(@projects, false)
		@done_tasks = @project ? @project.done_tasks : get_tasks(@projects, true)
		erb :index
	end

	use AuthController
  	use ProjectController
	use TaskController
end