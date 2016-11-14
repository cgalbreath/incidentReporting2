class CreateThefts < ActiveRecord::Migration
  def change
    create_table :thefts do |t|
      t.integer :incident_id
      t.text :theft_description
	  t.boolean :theft_emergency_notified
	  t.boolean :theft_insurance_filed
	  t.boolean :theft_security_video
	  t.text :theft_emergency_detail
	  t.text :theft_insurance_filed_detail
	  t.boolean :theft_members_involved
	  t.boolean :theft_staff_involved
	  t.boolean :theft_other_involved
	  t.text :theft_members_involved_detail
	  t.text :theft_staff_involved_detail
	  t.text :theft_other_involved_detail

      t.timestamps null: false
    end
  end
end