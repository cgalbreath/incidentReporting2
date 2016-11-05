class Bus < ActiveRecord::Base
	serialize :assigned_facilities
	serialize :assigned_programs
end
