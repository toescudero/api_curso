# frozen_string_literal: true

class CheckingDates
  def perform
    queue_challenges = RanksChallenge.where(status: true)
    queue_challenges.each do |r|
        if r.expire_date < Time.now
          r.status = false
          r.save
        end
    end
  end
end
