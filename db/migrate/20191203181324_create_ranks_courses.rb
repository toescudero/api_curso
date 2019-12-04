class CreateRanksCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :ranks_courses do |t|
      t.references :person, foreign_key: true
      t.references :course, foreign_key: true
      t.boolean :teacher
      t.float :points
      t.boolean :status
      t.date :expire_date
      t.date :end_date

      t.timestamps
    end
  end
end
