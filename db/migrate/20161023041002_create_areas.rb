class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.belongs_to :facilities, index: true
      t.string :name
      t.timestamps null: false
    end
  end
end
