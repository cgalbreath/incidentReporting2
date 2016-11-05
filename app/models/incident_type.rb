class IncidentType < ActiveRecord::Base
	belongs_to :incident_detail
end
