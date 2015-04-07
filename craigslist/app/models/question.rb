class Question < ActiveRecord::Base
	
	def tags
      @tag
	end


	def tags=(tag)
     @tag << tag
	end
end
