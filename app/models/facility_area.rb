class FacilityArea < ActiveRecord::Base
	belongs_to :facility
	belongs_to :area
end
