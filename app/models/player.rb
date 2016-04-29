class Player < ActiveRecord::Base
  has_many :bets
  belongs_to :event
  
  validates :name, presence: true
  
  scope :for_event, ->(event) { where(:event => event).where.not(:event => nil) }
  
  def count_points
    score = 0
    self.bets.each do |bet|
      score += 1 if bet.won
    end
    return score
  end
end
