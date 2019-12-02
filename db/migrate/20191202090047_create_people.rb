class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :first_names
      t.string :last_names
      t.date :birth_date
      t.string :address
      t.string :mail
      t.integer :celphone_number
      t.float :total_points

      t.timestamps
    end
  end
end
