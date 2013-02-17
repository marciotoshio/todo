module TodoHelper
	def partial (template, locals = {})
  		erb(template, :layout => false, :locals => locals)
	end

	def authorized!
		redirect 'auth/login' unless session[:current_user]
	end

	def set_current_user(uid, name)
		session[:current_user] = { :uid => uid, :name => name }
	end

	def get_current_user
		session[:current_user]
	end

	def get_tasks(projects, is_done)
		tasks = []
		projects.map {|p| tasks << p.tasks.where(:done => is_done).all}
		tasks.flatten
	end
end