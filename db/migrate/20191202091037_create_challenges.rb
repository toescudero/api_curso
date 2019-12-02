class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :instructions
      t.references :course
      t.integer :points
      t.timestamp :time_limit

      t.timestamps
    end
  end
end
