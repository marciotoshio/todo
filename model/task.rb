class Task
	include MongoMapper::Document

	key :title,		String
	key :done,		Boolean
	timestamps!

	scope :undone, where(:done => false)
	scope :done, where(:done => true)
end