class Area < ActiveRecord::Base
	has_many :facility_areas, dependent: :destroy
	has_many :facilities, through: :facility_areas
end
