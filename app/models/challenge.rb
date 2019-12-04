# frozen_string_literal: true

class Challenge < ApplicationRecord
  belongs_to :course
  has_and_belongs_to_many :people
end
