class AddExerciseTypesToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :muscle_training, :boolean
    add_column :records, :running, :boolean
    add_column :records, :stretching, :boolean
  end
end
