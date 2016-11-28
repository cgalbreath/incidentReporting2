class Incidents < ActiveRecord::Migration
  def change
  	create_table :incidents do |t|
      t.string :date_reported
      t.string :date_of_incident
      t.string :reporter
      t.string :reporter_atc
      t.string :witness
      t.string :witness_atc
      t.text   :description
      t.string :physical_address
      t.integer :severity_level_id
      t.integer :location_id
      t.integer :program_id
      t.integer :facility_id
      t.integer :area_id
      t.boolean :guardian_notified
      t.string :guardian_name
      t.string :guardian_number
  	end
  end
end
