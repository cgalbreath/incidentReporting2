class Facility < ActiveRecord::Base
	serialize :areas, Array
	serialize :programs, Array
end
