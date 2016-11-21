class Facility < ActiveRecord::Base
	has_many :facility_areas, :dependent => :destroy
	has_many :areas, :through => :facility_areas
	has_many :facility_programs, :dependent => :destroy
	has_many :programs, :through => :facility_programs
	accepts_nested_attributes_for :facility_areas, :allow_destroy => true
	accepts_nested_attributes_for :facility_programs, :allow_destroy => true
end
