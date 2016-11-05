class Facility < ActiveRecord::Base
	belongs_to :incident_detail
	serialize :areas
	serialize :programs
end
