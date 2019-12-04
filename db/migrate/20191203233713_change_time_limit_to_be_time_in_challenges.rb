# frozen_string_literal: true

class ChangeTimeLimitToBeTimeInChallenges < ActiveRecord::Migration[5.0]
  def change
    remove_column :challenges, :time_limit
    add_column :challenges, :time_limit, :int
  end
end
