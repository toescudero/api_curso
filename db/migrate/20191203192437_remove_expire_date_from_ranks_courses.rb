class RemoveExpireDateFromRanksCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :ranks_courses, :expire_date, :date
  end
end
