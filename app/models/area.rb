class Area < ActiveRecord::Base
	belongs_to :facility, polymorphic: true
end
