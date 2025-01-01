class RemoveExerciseAndMeditationColumnsFromRecords < ActiveRecord::Migration[7.0]
  def change
    remove_column :records, :exercise, :boolean
    remove_column :records, :exercise_type, :string
    remove_column :records, :exercise_duration, :integer
    remove_column :records, :meditation, :boolean
    remove_column :records, :meditation_duration, :integer
  end
end
