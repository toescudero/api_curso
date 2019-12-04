class RanksChallenge < ApplicationRecord
  belongs_to :person
  belongs_to :challenge
  self.primary_keys = :person_id, :challenge_id  
end
