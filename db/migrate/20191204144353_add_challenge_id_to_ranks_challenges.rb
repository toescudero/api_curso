# frozen_string_literal: true

class AddChallengeIdToRanksChallenges < ActiveRecord::Migration[5.0]
  def change
    remove_column :ranks_challenges, :person_id
    remove_column :ranks_challenges, :challenge_id

    add_reference :ranks_challenges, :person, index: true, foreign_key: true
    add_reference :ranks_challenges, :challenge, index: true, foreign_key: true
  end
end
