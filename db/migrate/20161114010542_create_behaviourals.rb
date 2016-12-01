class CreateBehaviourals < ActiveRecord::Migration
  def change
    create_table :behaviourals do |t|
      t.integer :incident_id
      t.integer :behav_involved_type_id
      t.string :behav_involved_name
      t.text :behav_description
      t.text :behav_counseling
      t.boolean :behav_guardian_notified
      t.string :behav_guardian_name
      t.string :behav_guardian_number
      t.timestamps null: false
    end
  end
end