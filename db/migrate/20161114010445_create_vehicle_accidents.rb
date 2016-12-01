class CreateVehicleAccidents < ActiveRecord::Migration
  def change
    create_table :vehicle_accidents do |t|
      t.integer :incident_id
      t.integer :veh_ownership_id
      t.text :veh_description
      t.text :veh_car_vin
      t.text :veh_car_plate
      t.boolean :veh_alternative_transport
      t.text :veh_alternative_description
      t.text :veh_alternative_car_vin
      t.text :veh_alternative_car_plate

      t.timestamps null: false
    end
  end
end