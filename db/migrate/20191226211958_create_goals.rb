class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.string :name,  null: false
      t.integer :time,  null: false
      t.timestamps
    end
  end
end
