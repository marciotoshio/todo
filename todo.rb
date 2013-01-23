require 'sinatra/base'
require './model/task'
require './model/project'

class ToDo < Sinatra::Base
	helpers do
    	def partial (template, locals = {})
      		erb(template, :layout => false, :locals => locals)
    	end
  	end

	get '/?:project_id?' do
		@projects = Project.all #for the project list menu

		project = Project.find(params[:project_id])
		@undone_tasks = project ? project.undone_tasks : Task.undone
		@done_tasks = project ? project.done_tasks : Task.done
		
		erb :index
	end

# 	get '/seed' do
#		p = Project.new
#		p.name = 'Project 2'
#
#		t1 = Task.new
#		t1.title = 'lorem ipsum'
#
#		t2 = Task.new
#		t2.title = 'dolor sit amet'
#
#		t3 = Task.new
#		t3.title = 'lorem dolor ipsum'
#		t3.done = true
#		p.tasks = [t1,t2,t3]
#
#		p.save
#	end

end