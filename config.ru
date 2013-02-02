require 'rubygems'
require 'bundler'
require 'better_errors'

Bundler.require

configure :development do
	use BetterErrors::Middleware
	MongoMapper.setup({'development' => {'uri' => 'mongodb://127.0.0.1:27017/todo-dev'}}, 'development')
end

configure :production do
	MongoMapper.setup({'production' => {'uri' => 'mongodb://127.0.0.1:27017/todo'}}, 'production')
end

require './todo'
run ToDo