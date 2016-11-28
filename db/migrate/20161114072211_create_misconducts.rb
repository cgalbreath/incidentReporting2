class CreateMisconducts < ActiveRecord::Migration
  def change
    create_table :misconducts do |t|
      t.integer :incident_id
      t.text :misconduct_description
	  t.boolean :misconduct_cps_notified
	  t.boolean :misconduct_emergency_notified
	  t.text :misconduct_cps_detail
	  t.text :misconduct_emergency_detail
	  t.text :misconduct_followup
	  t.boolean :misconduct_members_involved
	  t.boolean :misconduct_staff_involved
	  t.boolean :misconduct_other_involved
	  t.text :misconduct_members_involved_detail
	  t.text :misconduct_staff_involved_detail
	  t.text :misconduct_other_involved_detail

      t.timestamps null: false
    end
  end
end
