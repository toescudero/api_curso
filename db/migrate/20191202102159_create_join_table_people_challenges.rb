class CreateJoinTablePeopleChallenges < ActiveRecord::Migration[5.0]
  def change
    create_join_table :people, :challenges do |t|
      t.references :person, foreign_key: true
      t.references :challenge, foreign_key: true
    end
  end
end
