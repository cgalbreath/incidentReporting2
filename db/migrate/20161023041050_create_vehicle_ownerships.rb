class CreateVehicleOwnerships < ActiveRecord::Migration
  def change
    create_table :vehicle_ownerships do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
