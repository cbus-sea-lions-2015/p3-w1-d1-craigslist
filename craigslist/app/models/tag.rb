class Tag < ActiveRecord::Base
  belongs_to :question
	def self.names
		 self.all.map {|tag| tag.name}
	end
end
