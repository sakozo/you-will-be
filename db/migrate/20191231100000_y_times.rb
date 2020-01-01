class YTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :y_times do |t|
      t.float :time, null: false
      t.references :user,      null: false, foreign_key: true
      t.references :goal,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
