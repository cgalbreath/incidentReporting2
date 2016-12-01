class CreatePropertyDamages < ActiveRecord::Migration
  def change
    create_table :property_damages do |t|
      t.integer :incident_id
      t.text :prop_description
      t.text :prop_occurance
      t.timestamps null: false
    end
  end
end



