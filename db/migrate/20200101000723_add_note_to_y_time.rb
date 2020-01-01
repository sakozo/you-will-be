class AddNoteToYTime < ActiveRecord::Migration[5.0]
  def change
    add_column :y_times, :note, :string
  end
end
