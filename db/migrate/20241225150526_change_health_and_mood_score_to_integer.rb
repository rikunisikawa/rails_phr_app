class ChangeHealthAndMoodScoreToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :records, :health_score, :integer
    change_column :records, :mood_score, :integer
  end
end
