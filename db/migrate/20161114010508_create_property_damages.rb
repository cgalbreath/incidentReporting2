class CreatePropertyDamages < ActiveRecord::Migration
  def change
    create_table :property_damages do |t|
      t.integer :incident_id
      t.text :prop_description
      t.text :prop_occurance
      t.boolean :prop_emergency_notified
      t.boolean :prop_insurance_filed
      t.boolean :prop_members_involved
      t.text :prop_emergency_detail
      t.text :prop_insurance_filed_detail
      t.text :prop_members_involved_detail
      t.text :prop_followup

      t.timestamps null: false
    end
  end
end



