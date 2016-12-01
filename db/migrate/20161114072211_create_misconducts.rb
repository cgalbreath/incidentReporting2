class CreateMisconducts < ActiveRecord::Migration
  def change
    create_table :misconducts do |t|
      t.integer :incident_id
      t.text :misconduct_description
	  t.boolean :misconduct_cps_notified
	  t.text :misconduct_cps_detail
      t.timestamps null: false
    end
  end
end
