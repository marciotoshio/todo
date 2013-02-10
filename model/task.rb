class Task
	include MongoMapper::Document

	key :title,		  String
	key :description, String
	key :done,		  Boolean
	timestamps!

	belongs_to :project

	scope :undone, where(:done => false) 
	scope :done, where(:done => true)
end