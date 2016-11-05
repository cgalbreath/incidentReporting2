class CreateInvolvedTypes < ActiveRecord::Migration
  def change
    create_table :involved_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
