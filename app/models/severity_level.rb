class SeverityLevel < ActiveRecord::Base
	belongs_to :incident_detail
end
