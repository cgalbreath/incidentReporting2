class Location < ActiveRecord::Base
	belongs_to :incident_detail
end
