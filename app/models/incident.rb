class Incident < ActiveRecord::Base
	belongs_to :facility
	has_many :injuries, dependent: :destroy
	has_many :misconducts, dependent: :destroy
	has_many :behaviourals, dependent: :destroy
	has_many :thefts, dependent: :destroy
	has_many :vehicle_accidents, dependent: :destroy
	has_many :property_damages, dependent: :destroy
	accepts_nested_attributes_for :injuries, :allow_destroy => true, :reject_if => proc { |attr| attr[:injury_description].blank? }
	accepts_nested_attributes_for :misconducts, :allow_destroy => true, :reject_if => proc { |attr| attr[:misconduct_description].blank? }
	accepts_nested_attributes_for :behaviourals, :allow_destroy => true, :reject_if => proc { |attr| attr[:behav_description].blank? }
	accepts_nested_attributes_for :thefts, :allow_destroy => true, :reject_if => proc { |attr| attr[:theft_description].blank? }
	accepts_nested_attributes_for :vehicle_accidents, :allow_destroy => true, :reject_if => proc { |attr| attr[:veh_description].blank? }
	accepts_nested_attributes_for :property_damages, :allow_destroy => true, :reject_if => proc { |attr| attr[:prop_description].blank? }


	ransacker :id do
	  Arel::Nodes::SqlLiteral.new("substring(CAST(#{table_name}.id as CHAR(12)),length(id))")
	end

	ransacker :area_id do
	  Arel::Nodes::SqlLiteral.new("substring(CAST(#{table_name}.area_id as CHAR(12)),length(area_id))")
	end

	ransacker :program_id do
	  Arel::Nodes::SqlLiteral.new("substring(CAST(#{table_name}.program_id as CHAR(12)),length(program_id))")
	end
end
