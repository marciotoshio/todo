class Task
	include MongoMapper::Document

	key :title,		String
	key :done,		Boolean
	timestamps!
end