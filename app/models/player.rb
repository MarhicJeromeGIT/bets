class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bets
  belongs_to :event
  
  scope :for_event, ->(event) { where(:event => event).where.not(:event => nil) }
  
  def count_points
    score = 0
    self.bets.each do |bet|
      score += 1 if bet.won
    end
    return score
  end
end
