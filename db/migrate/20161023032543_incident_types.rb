class IncidentTypes < ActiveRecord::Migration
  def change
    create_table :incident_types do |t|
      t.string :name
      t.string :description
    end
  end
end
