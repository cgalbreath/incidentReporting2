class Program < ActiveRecord::Base
	belongs_to :facility, polymorphic: true
end
