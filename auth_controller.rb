require 'sinatra/base'
require './helpers/todo_helper'

class AuthController < Sinatra::Base
	helpers TodoHelper

	get '/auth/login' do
		erb :login
	end
	
	%w(get post).each do |method|
  		send(method, "/auth/:provider/callback") do
    		auth = env['omniauth.auth'] # => OmniAuth::AuthHash
    		set_current_user(auth['uid'], auth['info']['name'])
    		redirect '/'
  		end
	end
end