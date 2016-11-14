class CreateInjuries < ActiveRecord::Migration
  def change
    create_table :injuries do |t|
      t.integer :incident_id
      t.integer :injury_involved_type_id
      t.string :injury_involved_name
      t.string :injury_description
      t.string :injury_first_aid
      t.string :injury_guardian_number
      t.string :injury_guardian_name
      t.boolean :injury_guardian_notified
      t.text :injury_followup

      t.timestamps null: false
    end
  end
end
