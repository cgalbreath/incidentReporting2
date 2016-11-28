class FacilityArea < ActiveRecord::Base
	belongs_to :facility
	belongs_to :area

	validates_uniqueness_of :area_id, :scope => :facility_id
end
