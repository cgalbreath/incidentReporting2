class IncidentDetails < ActiveRecord::Migration
  def change
  	create_table :incident_details do |t|
      t.integer :incident_id
      t.integer :incident_type_id
      t.integer :involved_type_id
      t.integer :vehicle_ownership_id
      t.string :involved_name
      t.string :involved_atc
      t.boolean :alternative_transport
      t.string :alternative_transport_detail
      t.string :counseling
      t.boolean :cps_notified
      t.string :cps_detail
      t.text   :description
      t.boolean :drug_screen
      t.boolean :emergency_notified
      t.text :emergency_detail
      t.string :first_aid
      t.text :followup
      t.string :guardian_name
      t.string :guardian_number
      t.boolean :guardian_notified
      t.string :guardian_notified_date
      t.boolean :insurance_filed
      t.string :insurance_filed_detail
      t.boolean :members_involved
      t.text :members_involved_detail
      t.text :occurance
      t.boolean :security_video
      t.boolean :staff_involved
      t.text :staff_involved_detail
      t.boolean :other_involved
      t.text :other_involved_detail
      t.boolean :parent_pickup
      t.boolean :suspended
      t.string :vehicle_ownership
      t.string :vehicle_description
      t.string :VIN
  	end
  end
end
