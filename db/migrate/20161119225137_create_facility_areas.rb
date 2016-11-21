class CreateFacilityAreas < ActiveRecord::Migration
  def change
    create_table :facility_areas do |t|
      t.integer :facility_id
      t.integer :area_id

      t.timestamps null: false
    end
  end
end
