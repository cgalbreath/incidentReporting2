class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :BUS_NUM
      t.string :FOUR_VIN
      t.string :PLATE
      t.string :assigned_programs, null: true, array: true
      t.string :assigned_facilities, null: true, array: true
      t.timestamps null: false
    end
  end
end
