class Injury < ActiveRecord::Base
	belongs_to :incident

	def injury_string
		"Injury - #{id}"
	end
end
