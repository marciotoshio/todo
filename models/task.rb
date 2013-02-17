class Task
	include MongoMapper::Document

	key :title,		  String
	key :description, String
	key :done,		  Boolean
	timestamps!

	belongs_to :project do 
		def from_user(uid)
			where(:uid => uid)
		end
	end
end