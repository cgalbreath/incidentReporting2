class FacilityProgram < ActiveRecord::Base
	belongs_to :facility
	belongs_to :program
end
