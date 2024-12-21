class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.date :date
      t.float :health_score
      t.float :mood_score
      t.text :memo
      t.string :user

      t.timestamps
    end
  end
end
