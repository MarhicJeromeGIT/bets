class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bets
  belongs_to :event
  
  before_create :create_default_bets
  
  accepts_nested_attributes_for :bets
  
  scope :for_event, ->(event) { where(:event => event).where.not(:event => nil) }
  
  def count_points
    score = 0
    self.bets.each do |bet|
      score += 1 if bet.won
    end
    return score
  end
  
  def create_default_bets
    Match.all.each do |m|
      self.bets.build(match: m, result: Match::TIE)
    end
  end
end










