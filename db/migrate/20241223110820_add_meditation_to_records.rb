class AddMeditationToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :meditation, :boolean
  end
end
