class Person < ApplicationRecord
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :challenges
end
