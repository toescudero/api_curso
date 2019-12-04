class CreatePk < ActiveRecord::Migration[5.0]
  def change
    execute "ALTER TABLE ranks_challenges DROP CONSTRAINT ranks_challenges_pkey;"
    execute "ALTER TABLE ranks_courses DROP CONSTRAINT ranks_courses_pkey;"

    execute "ALTER TABLE ranks_challenges ADD PRIMARY KEY (challenge_id, person_id);"
    execute "ALTER TABLE ranks_courses ADD PRIMARY KEY (course_id, person_id);"
  end
end
