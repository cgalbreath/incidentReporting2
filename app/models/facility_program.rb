class FacilityProgram < ActiveRecord::Base
	belongs_to :facility
	belongs_to :program

	validates_uniqueness_of :program_id, :scope => :facility_id
end
