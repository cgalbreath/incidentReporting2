class Incident < ActiveRecord::Base
	belongs_to :facility
	has_many :injuries, dependent: :destroy
	has_many :misconducts, dependent: :destroy
	has_many :behaviourals, dependent: :destroy
	has_many :thefts, dependent: :destroy
	has_many :vehicle_accidents, dependent: :destroy
	has_many :property_damages, dependent: :destroy
	accepts_nested_attributes_for :injuries, :allow_destroy => true
	accepts_nested_attributes_for :misconducts, :allow_destroy => true
	accepts_nested_attributes_for :behaviourals, :allow_destroy => true
	accepts_nested_attributes_for :thefts, :allow_destroy => true
	accepts_nested_attributes_for :vehicle_accidents, :allow_destroy => true
	accepts_nested_attributes_for :property_damages, :allow_destroy => true
end
