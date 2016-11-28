class Program < ActiveRecord::Base
	has_many :facility_programs, dependent: :destroy
	has_many :facilities, through: :facility_programs
end
