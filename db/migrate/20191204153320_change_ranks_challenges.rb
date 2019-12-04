class ChangeRanksChallenges < ActiveRecord::Migration[5.0]
  def change
    
    change_column :ranks_challenges, :expire_date , :datetime
    
  end
end
