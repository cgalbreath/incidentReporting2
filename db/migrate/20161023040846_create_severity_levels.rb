class CreateSeverityLevels < ActiveRecord::Migration
  def change
    create_table :severity_levels do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
