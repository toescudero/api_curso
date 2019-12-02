class CreateJoinTablePeopleCourses < ActiveRecord::Migration[5.0]
  def change
    create_join_table :people, :courses do |t|
      t.references :person, foreign_key: true
      t.references :course, foreign_key: true
    end
  end
end
