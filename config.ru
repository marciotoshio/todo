require 'rubygems'
require 'bundler'

Bundler.require

configure :development do
	MongoMapper.setup({'development' => {'uri' => 'mongodb://127.0.0.1:27017/todo'}}, 'development')
end

configure :production do
	MongoMapper.setup({'production' => {'uri' => 'mongodb://127.0.0.1:27017/todo'}}, 'production')
end

require './todo'
run ToDo