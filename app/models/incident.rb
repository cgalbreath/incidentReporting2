class Incident < ActiveRecord::Base
	has_many :incident_details, dependent: :destroy
	accepts_nested_attributes_for :incident_details, :allow_destroy => true
end
