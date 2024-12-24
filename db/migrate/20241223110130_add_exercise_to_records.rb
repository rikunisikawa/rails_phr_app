class AddExerciseToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :exercise, :boolean
  end
end
