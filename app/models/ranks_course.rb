class RanksCourse < ApplicationRecord
  belongs_to :person
  belongs_to :course
  self.primary_keys = :person_id, :course_id
end
