class Bet < ActiveRecord::Base
  belongs_to :player
  belongs_to :match
  
  validates :result, presence: true, inclusion: { in: [Match::WIN,Match::LOSE,Match::TIE] }
  validates :player, presence: true
  validates :match, presence: true
  
  scope :for_player, ->(player) { where(:player => player) }
  scope :for_match, ->(match) { where(:match => match) }
  
  # return true if the bet is won
  def won
    return self.match.result == self.result
  end
  
  # return true if the match hasn't been played yet
  def pending
    return match.result.blank?
  end
end
