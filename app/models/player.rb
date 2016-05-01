class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bets
  belongs_to :event
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  before_create :create_default_bets
  before_create :set_default_points
  
  accepts_nested_attributes_for :bets
  
  scope :for_event, ->(event) { where(:event => event).where.not(:event => nil) }
  
  def count_points
    score = 0
    self.bets.each do |bet|
      score += 1 if bet.won
    end
    return score
  end
  
  private
    def create_default_bets
      Match.all.each do |m|
        self.bets.build(match: m, result: Match::TIE)
      end
    end
    
    def set_default_points
      self.points = 0
    end
end










