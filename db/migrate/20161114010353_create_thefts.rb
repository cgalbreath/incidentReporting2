class CreateThefts < ActiveRecord::Migration
  def change
    create_table :thefts do |t|
      t.integer :incident_id
      t.text :theft_serial
      t.text :theft_description
	  t.boolean :theft_security_video

      t.timestamps null: false
    end
  end
end