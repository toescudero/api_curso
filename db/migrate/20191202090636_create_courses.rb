# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :content
      t.timestamp :time_cost
      t.string :price
      t.float :required_points

      t.timestamps
    end
  end
end
