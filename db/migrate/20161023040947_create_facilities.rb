class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :address
      t.string :areas, null: true, array: true
      t.string :programs, null: true, array: true
      t.timestamps null: false
    end
  end
end
