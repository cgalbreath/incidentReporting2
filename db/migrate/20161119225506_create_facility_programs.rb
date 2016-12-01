class CreateFacilityPrograms < ActiveRecord::Migration
  def change
    create_table :facility_programs do |t|
      t.integer :facility_id
      t.integer :program_id
      t.timestamps null: false
    end
  end
end
