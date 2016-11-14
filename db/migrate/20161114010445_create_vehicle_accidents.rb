class CreateVehicleAccidents < ActiveRecord::Migration
  def change
    create_table :vehicle_accidents do |t|
      t.integer :incident_id
      t.integer :veh_ownership_id
      t.text :veh_description
      t.text :veh_car_description
      t.boolean :veh_members_involved
      t.boolean :veh_alternative_transport
      t.boolean :veh_insurance_filed
      t.boolean :veh_drug_screen
      t.boolean :veh_emergency_notified
      t.text :veh_members_involved_detail
      t.text :veh_alternative_transport_detail
      t.text :veh_insurance_filed_detail
      t.text :veh_emergency_detail

      t.timestamps null: false
    end
  end
end