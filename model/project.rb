class Project
	include MongoMapper::Document

	key :name,	String

	many :tasks
end