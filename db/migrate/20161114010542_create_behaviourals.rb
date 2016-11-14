class CreateBehaviourals < ActiveRecord::Migration
  def change
    create_table :behaviourals do |t|
      t.integer :incident_id
      t.integer :behav_involved_type_id
      t.string :behav_involved_name
      t.text :behav_description
      t.boolean :behav_guardian_notified
      t.string :behav_guardian_name
      t.string :behav_guardian_number
      t.text :behav_counseling
      t.text :behav_followup
      t.boolean :behav_members_involved
      t.boolean :behav_staff_involved
      t.boolean :behav_other_involved
      t.text :behav_members_involved_detail
      t.text :behav_staff_involved_detail
      t.text :behav_other_involved_detail

      t.timestamps null: false
    end
  end
end