class AddNewFieldsToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :exercise_type, :string
    add_column :records, :exercise_duration, :integer
    add_column :records, :meditation_duration, :integer
    add_column :records, :sleep_duration, :integer
    add_column :records, :stress_level, :integer
    add_column :records, :weight, :float
    add_column :records, :temperature, :float
    add_column :records, :concentration, :integer
    add_column :records, :fatigue, :integer
  end
end
